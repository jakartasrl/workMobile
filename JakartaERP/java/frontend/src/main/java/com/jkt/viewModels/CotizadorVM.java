package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import lombok.Data;

import org.apache.commons.beanutils.BeanUtils;
import org.jsoup.Jsoup;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.DefaultTreeModel;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.TreeNode;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.cotizador.dominio.TituloModeloCotizador;
import com.jkt.dominio.CotizacionDet.Estado;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.CotizadorOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListTipoDeCambioOV;
import com.jkt.ov.ModeloCotizadorOV;
import com.jkt.ov.TipoDeCambioOV;
import com.jkt.ov.TituloModeloCotizadorOV;
import com.jkt.ov.tree.AdvancedTreeModel;
import com.jkt.ov.tree.NodoTitulos;

@Data
public class CotizadorVM extends ViewModel implements IBasicOperations {
	
	private String titulo = "Cotizador";
	
	private CotizadorOV cotizadorOV = new CotizadorOV();
	private DescriptibleOV clienteOV = new DescriptibleOV();
	
	
	
	private DescriptibleOV vendedorOV = new DescriptibleOV();
	private ModeloCotizadorOV modeloCotizadorOV = new ModeloCotizadorOV();
	private ItemsOV itemSelected = new ItemsOV();
	private DefaultTreeModel<TituloModeloCotizadorOV> arbolTitulos;
	private ListDescriptibleOV monedas=new ListDescriptibleOV();
	private List<TipoDeCambioOV> lsTipoDeCambio = new ArrayList<TipoDeCambioOV>();

	private DescriptibleOV expresarEnMonedaSeleccionado= new DescriptibleOV();
	
	//Esta lista es una lista transiente que contiene toda la informacion de la jerarquia usando codigoInterno y codigoPadre.
	//Posteriormente una operacion recupera la lista y arma el arbol como corresponde.
	private List<TituloModeloCotizadorOV> todosLosElementos= new ArrayList<TituloModeloCotizadorOV>();
	Random rand = new Random();
	
	@Command("guardar")
	@NotifyChange({"modeloCotizadorOV"})
	public void guardar() throws JakartaException {
		
		if(!this.cotizacionEditable){
			Messagebox.show("No es posible guardar una cotización ya autorizada");
			return;
		}
		
		this.validar();
	
		this.completarCotizadorOV();

		/*
		 * Asigna nuevas referencias si se abre un item cotizado, o si es nuevo.
		 */
		if(apertura){
			List<TituloModeloCotizadorOV> auxList=new ArrayList<TituloModeloCotizadorOV>();
			for (TituloModeloCotizadorOV tituloModeloCotizadorOV : this.cotizadorOV.getDetalles()) {
				if(tituloModeloCotizadorOV.getId()==0 && tituloModeloCotizadorOV.getIdNuevo()==0){
					//nada 
				}else{
					auxList.add(tituloModeloCotizadorOV);
				}
			}
			 this.cotizadorOV.setDetalles(auxList);
			 for (TituloModeloCotizadorOV tituloModeloCotizadorOV : this.cotizadorOV.getDetalles()) {
					tituloModeloCotizadorOV.setIdNuevo(tituloModeloCotizadorOV.getId()); //para el titulo modelo cotizador
					tituloModeloCotizadorOV.setId(0L); // para generar una nueva instancia siempre!
			}
		}else{
			for (TituloModeloCotizadorOV tituloModeloCotizadorOV : this.cotizadorOV.getDetalles()) {
				tituloModeloCotizadorOV.setIdNuevo(tituloModeloCotizadorOV.getId()); //para el titulo modelo cotizador
				tituloModeloCotizadorOV.setId(0L); // para generar una nueva instancia siempre!
			}
		}
		
//		this.cotizadorOV.setIdMoneda(1L);
		this.cotizadorOV.setIdMoneda(this.expresarEnMonedaSeleccionado.getId());
		this.cotizadorOV.setIdModelo(this.modeloCotizadorOV.getId());
		
		Operaciones.ejecutar("GuardarCotizador", this.cotizadorOV );
//		Messagebox.show("Se ha configurado una cotizacion correctamente.");
		Executions.sendRedirect("/pantallas/index/index-cotizador.zul");		

	}
	
	private void validar() throws JakartaException {
		
		if (this.modeloCotizadorOV.getId() == 0){
			throw new JakartaException("Debe ingresar un Modelo de Cotizador.");
		}
		
		if (this.expresarEnMonedaSeleccionado.getId() == 0){
			throw new JakartaException("Debe ingresar una moneda para poder expresar.");
		}
		
	}

	private void completarCotizadorOV() {
		
		this.cotizadorOV.setId(itemSelected.getIdCotizador());
		this.cotizadorOV.setIdCotizacionDet(itemSelected.getId());
		this.cotizadorOV.setIdModelo(modeloCotizadorOV.getId());
		this.cotizadorOV.setIdMoneda(expresarEnMonedaSeleccionado.getId());
		
		if(this.itemSelected.isAutorizado()){
			this.cotizadorOV.setCodigoEstado(String.valueOf(Estado.AUTORIZADO.getId()));
		}else{
			this.cotizadorOV.setCodigoEstado(String.valueOf(Estado.COTIZADO_NO_AUTORIZADO.getId()));
		}
		
		DefaultTreeModel<TituloModeloCotizadorOV> arbol = this.arbolTitulos;
		this.todosLosElementos = new ArrayList<TituloModeloCotizadorOV>();
		
		//del arbol completo se genera una lista.
		List<TreeNode<TituloModeloCotizadorOV>> rootElements = arbol.getRoot().getChildren();
		for (TreeNode<TituloModeloCotizadorOV> treeNode : rootElements) {
			establecerCodigos(treeNode, 0);
		}

		//y se asigna al modelo cotizador q se va a guardar
		this.modeloCotizadorOV.setTitulos(this.todosLosElementos);
		this.cotizadorOV.setDetalles(this.todosLosElementos);
		
	}

	private void establecerCodigos(TreeNode<TituloModeloCotizadorOV> treeNode, int codigoPadre){
		int randomNum = rand.nextInt((999999 - 1) + 1) + 1;
		treeNode.getData().setCodigoInterno(randomNum);
		treeNode.getData().setCodigoInternoPadre(codigoPadre);
		
		if(treeNode.getData().getTipo().equals("C")){
//			treeNode.getData().setIdC(treeNode.getData().getConcepto().getId());
//			treeNode.getData().setConcepto(null);//para q el fwk no vaya a buscarlo a la base y le asigne null...
			//recordar, si elp valor es cero, se crea uno nuevo, si es >0 se busca en la base, si es null, se retorna null.
			if (treeNode.getData().getIdC() != null){
				
				treeNode.getData().setIdC(treeNode.getData().getConcepto().getId());
				treeNode.getData().setCodigoC(treeNode.getData().getCodigoC());
				treeNode.getData().setDescripcionC(treeNode.getData().getDescripcionC());
				
				DescriptibleOV concepto = new DescriptibleOV();
				concepto.setId(treeNode.getData().getIdC());
				concepto.setCodigo(treeNode.getData().getCodigoC());
				concepto.setDescripcion(treeNode.getData().getDescripcionC());
				treeNode.getData().setConcepto(concepto);
				
				treeNode.getData().setIdMoneda(treeNode.getData().getMoneda().getId());
				
				long idProducto = treeNode.getData().getProducto().getId();
				if(idProducto==0){
					treeNode.getData().setIdProducto(null);
				}else{
					treeNode.getData().setIdProducto(treeNode.getData().getProducto().getId());
				}

				if(treeNode.getData().getMoneda().getId()==0){
					treeNode.getData().setIdMoneda(null);
				}else{
					treeNode.getData().setIdMoneda(treeNode.getData().getMoneda().getId());
				}
				
				if(treeNode.getData().getUnidadMedida().getId()==0){
					treeNode.getData().setIdUnidadMedida(null);
				}else{
					treeNode.getData().setIdUnidadMedida(treeNode.getData().getUnidadMedida().getId());
				}
			
			}
		
		}else{
			treeNode.getData().setIdC(null);
		}
				
		if (!treeNode.isLeaf()) {
			List<TreeNode<TituloModeloCotizadorOV>> children = treeNode.getChildren();
			for (TreeNode<TituloModeloCotizadorOV> nodoHijo : children) {
				establecerCodigos(nodoHijo, randomNum);
			}
		}
		
		//Agregamos solo los conceptos
		if (treeNode.getData().getTipo().equals("C")){
			todosLosElementos.add(treeNode.getData());
		}
		
	}

	@Command
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vm", this);
		
		Window window = (Window) Executions.createComponents("/pantallas/cotizador/helpItems.zul", null, map );
		
		window.doModal();
		
	}
	
	private boolean apertura=false;
	private boolean cotizacionEditable = true;
	
	@SuppressWarnings("unchecked")
	@NotifyChange({"cotizadorOV","itemSelected","arbolTitulos","cotizacionEditable"})
	public void cargarItemACotizar(){
		
		apertura = true;
		
		NodoTitulos root = new NodoTitulos(new TituloModeloCotizadorOV(),true);
		this.arbolTitulos=new AdvancedTreeModel(root);
		
		//Traemos el Item a cotizar
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.itemSelected.getId()));
		
		ItemsOV itemOV = (ItemsOV) Operaciones.ejecutar("TraerCotizacionDelItem", objetoOV, ItemsOV.class);
		this.itemSelected = itemOV;
		
		this.itemSelected.setDescripcion(Jsoup.parse(this.itemSelected.getDescripcion()).text());
		
		if(this.itemSelected.getIdEstado()==Estado.AUTORIZADO.getId()){
			this.itemSelected.setAutorizado(true);
			this.cotizacionEditable = false;
		}else{
			this.cotizacionEditable = true;
		}
		
		this.modeloCotizadorOV.setId(itemOV.getIdModeloCotizador());
		this.modeloCotizadorOV.setCodigo(itemOV.getCodModeloCotizador());
		this.modeloCotizadorOV.setDescripcion(itemOV.getDescModeloCotizador());
		
		this.modeloCotizadorOV.setTitulos(this.itemSelected.getTitulos());
		
		crearArbolModeloCotizador(this.modeloCotizadorOV);
		this.setModeloCotizadorOV(this.modeloCotizadorOV);
		
		this.getModeloCotizadorOV().setCodigo(this.itemSelected.getCodModeloCotizador());
		this.getModeloCotizadorOV().setDescripcion(this.itemSelected.getDescModeloCotizador());
		
		//Selecciono la moneda
		expresarEnMonedaSeleccionado.setId(itemSelected.getIdMoneda());
		expresarEnMonedaSeleccionado.setCodigo(itemSelected.getCodMoneda());
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
		
	}
	
	@GlobalCommand("actualizar")
	@NotifyChange({"cotizadorOV","itemSelected","arbolTitulos","modeloCotizadorOV","monedas","cotizacionEditable"})
	public void actualizar() {
		log.warn("Actualizando datos...");
	}

	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}
	
	@Override
	@Command
	@NotifyChange({"modeloCotizadorOV","tituloModeloCotizadorOV","arbolTitulos","cotizadorOV","modeloCotizadorOV","itemSelected","cotizacionEditable"})
	public void nuevo(){
		
		this.modeloCotizadorOV = new ModeloCotizadorOV();
		this.cotizadorOV = new CotizadorOV();
		this.clienteOV = new DescriptibleOV();
		this.vendedorOV = new DescriptibleOV();
		this.itemSelected = new ItemsOV();
		this.cotizacionEditable = true;
		
		NodoTitulos root = new NodoTitulos(new TituloModeloCotizadorOV(),true);
		this.arbolTitulos=new AdvancedTreeModel(root);
	
	}
	
	@Init
	@NotifyChange({"lsTipoDeCambio"})
	public void init(){
		
		try {
			ViewModel recuperarDesdeSesion = recuperarDesdeSesion(this.getClass().getCanonicalName());
			if(recuperarDesdeSesion!=null){
				BeanUtils.copyProperties(this, recuperarDesdeSesion);
				return;// true; 
			}
		} catch (IllegalAccessException e) {
			throw new RuntimeException(e.getMessage());
		} catch (InvocationTargetException e) {
			throw new RuntimeException(e.getMessage());
		}

		this.cotizacionEditable = true;
		
		log.info("Recuperando monedas...");
		this.monedas = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV("moneda"), ListDescriptibleOV.class);
		
		this.cargarTiposDeCambio();

	}

	private void cargarTiposDeCambio() {
		
		ListTipoDeCambioOV list = (ListTipoDeCambioOV) Operaciones.ejecutar("TraerTipoDeCambio", ListTipoDeCambioOV.class);
		this.setLsTipoDeCambio(list.getList());
		
	}

	@Command
	@NotifyChange({"cotizadorOV","modeloCotizadorOV"})
	public void traerModeloCotizador() throws IllegalAccessException, InvocationTargetException, JakartaException {
		
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.modeloCotizadorOV.getId()));
		ModeloCotizadorOV modeloCotizadorOV = (ModeloCotizadorOV) Operaciones.ejecutar("TraerModeloParaCotizar", objetoOV, ModeloCotizadorOV.class);

		crearArbolModeloCotizador(modeloCotizadorOV);
		this.setModeloCotizadorOV(modeloCotizadorOV);
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
		
	}

	private void crearArbolModeloCotizador(ModeloCotizadorOV modeloCotizadorOV2) {
		
		NodoTitulos root = new NodoTitulos(new TituloModeloCotizadorOV(),true);

		List<TituloModeloCotizadorOV> todosLosTitulos = modeloCotizadorOV2.getTitulos();
		Map<String,NodoTitulos> relaciones=new HashMap<String, NodoTitulos>();
		for (TituloModeloCotizadorOV tituloModeloCotizadorOV : todosLosTitulos) {
			NodoTitulos nodoActual;
			if (tituloModeloCotizadorOV.getTipo().equals("C")) {
				
				DescriptibleOV concepto=new DescriptibleOV();
				concepto.setId(tituloModeloCotizadorOV.getIdC());
				concepto.setCodigo(tituloModeloCotizadorOV.getCodigoC());
				concepto.setDescripcion(tituloModeloCotizadorOV.getDescripcionC());
				tituloModeloCotizadorOV.setConcepto(concepto);
				
				//lo mismo con unidad de medidaa...
				DescriptibleOV uMed=new DescriptibleOV();
				if (tituloModeloCotizadorOV.getIdUnidadMedida() != null){
					uMed.setId(tituloModeloCotizadorOV.getIdUnidadMedida());
					uMed.setCodigo(tituloModeloCotizadorOV.getCodUnidadMedida());
					uMed.setDescripcion(tituloModeloCotizadorOV.getDescUnidadMedida());
					tituloModeloCotizadorOV.setUnidadMedida(uMed);
				}
				
				//Selecciono la moneda
				DescriptibleOV moneda=new DescriptibleOV();
				if(tituloModeloCotizadorOV.getIdMoneda() != null){
					moneda.setId(tituloModeloCotizadorOV.getIdMoneda());
					moneda.setCodigo(tituloModeloCotizadorOV.getCodMoneda());
					moneda.setDescripcion(tituloModeloCotizadorOV.getDescMoneda());
					tituloModeloCotizadorOV.setMoneda(this.completarCombo(monedas.getList(), tituloModeloCotizadorOV.getIdMoneda()));
				}
			
				DescriptibleOV producto = new DescriptibleOV();
				if (tituloModeloCotizadorOV.getIdProducto() != null && tituloModeloCotizadorOV.getIdProducto() != 0L ){
					producto.setId(tituloModeloCotizadorOV.getIdProducto());
					producto.setCodigo(tituloModeloCotizadorOV.getCodProducto());
					producto.setDescripcion(tituloModeloCotizadorOV.getDescProducto());
					tituloModeloCotizadorOV.setProducto(producto);
				}
				
				nodoActual=new NodoTitulos(tituloModeloCotizadorOV);
				
			} else {
				
				nodoActual=new NodoTitulos(tituloModeloCotizadorOV,true);
				
			}
			
			relaciones.put(String.valueOf(tituloModeloCotizadorOV.getCodigoInterno()), nodoActual);
			
		}
		
		Collection<NodoTitulos> values = relaciones.values();
		for (NodoTitulos nodoTitulos : values) {
			int codigoInternoPadre = nodoTitulos.getData().getCodigoInternoPadre();
			if (codigoInternoPadre==0) {//no tiene padre, entonces es root
				root.add(nodoTitulos);
			} else {
				//si tiene padre, asigno la referencia usando el mapa.
				NodoTitulos padre = relaciones.get(String.valueOf(codigoInternoPadre));
				padre.add(nodoTitulos);
			}
		}
		
		this.arbolTitulos=new DefaultTreeModel<TituloModeloCotizadorOV>(root);
	
	}
	
	@Command
	@NotifyChange({"arbolTitulos"})
	public void actualizarMonedaExpresada(){
		
		DefaultTreeModel<TituloModeloCotizadorOV> arbol = this.arbolTitulos;
		
		//del arbol completo se genera una lista.
		List<TreeNode<TituloModeloCotizadorOV>> rootElements = arbol.getRoot().getChildren();
		for (TreeNode<TituloModeloCotizadorOV> treeNode : rootElements) {
			mostrarArbol(treeNode);
		}
		
		
	}
	
	private void mostrarArbol(TreeNode<TituloModeloCotizadorOV> treeNode){
		
		if(treeNode.getData().getTipo().equals("C")){

			if (treeNode.getData().getIdC() != null){
				
				//Calculamos importeVenta
				double precio = treeNode.getData().getPrecio();
				double markUp = treeNode.getData().getMarkUp();
				treeNode.getData().setImporteVenta(this.calcularCostoEn(treeNode.getData().getMoneda(),this.expresarEnMonedaSeleccionado,precio + markUp));
				
				//Calculamos el costoEn 
				treeNode.getData().setCostoEn(this.calcularCostoEn(treeNode.getData().getMoneda(),this.expresarEnMonedaSeleccionado,precio));
				
				return;
			}
		
		}else{
			if (!treeNode.isLeaf()) {
				List<TreeNode<TituloModeloCotizadorOV>> children = treeNode.getChildren();
				for (TreeNode<TituloModeloCotizadorOV> nodoHijo : children) {
					mostrarArbol(nodoHijo);
				}
			}
		}
	}
		
	@Command
	@NotifyChange({"cotizadorOV","modeloCotizadorOV","arbolTitulos"})
	public void calcularPrecio(@BindingParam("titulo") NodoTitulos titulo){
		
		double precio = 0;
		double markUp = 0;
		
		precio = titulo.getData().getCantidad() * titulo.getData().getPrecioUnitario();
		titulo.getData().setPrecio(precio);
		
		if (this.expresarEnMonedaSeleccionado != null){
			markUp = precio * titulo.getData().getMarkUp() / 100;
//			titulo.getData().setImporteVenta(precio / buscarCotizacion(this.expresarEnMonedaSeleccionado.getCodigo()) + markUp);
			titulo.getData().setImporteVenta(this.calcularCostoEn(titulo.getData().getMoneda(),this.expresarEnMonedaSeleccionado,precio + markUp));
			
			
			//Calculamos el costoEn 
			titulo.getData().setCostoEn(this.calcularCostoEn(titulo.getData().getMoneda(),this.expresarEnMonedaSeleccionado,precio));
			
		}
		
	}
	
	private double calcularCostoEn(DescriptibleOV monedaOrigen, DescriptibleOV monedaDestino, double monto) {
		
		double valorMonedaOrigen = buscarCotizacion(monedaOrigen.getCodigo());
		double valorMonedaDestino =  buscarCotizacion(monedaDestino.getCodigo());
		
		return monto * valorMonedaOrigen / valorMonedaDestino;
		
	}

	private double buscarCotizacion(String codMoneda) {
		
		for(TipoDeCambioOV tipoDeCambioOV : lsTipoDeCambio){
			if (tipoDeCambioOV.getCodMoneda().equalsIgnoreCase(codMoneda)){
				return tipoDeCambioOV.getCotizacion() == 0 ? 1 : tipoDeCambioOV.getCotizacion();
			}
		}
		
		return 1;
		
	}

	@Command
	@NotifyChange({"cotizadorOV","modeloCotizadorOV","arbolTitulos"})
	public void calcularMarkUp(@BindingParam("titulo") NodoTitulos titulo){
	
		titulo.getData().setImporteVenta(titulo.getData().getPrecio() + titulo.getData().getPrecio() * titulo.getData().getMarkUp() / 100);
		
	}

	@Command
	@NotifyChange({"lsTipoDeCambio"})
	public void abrirTiposCambio(){
		Map<String,Object> args=new HashMap<String, Object>();
		args.put("lista", lsTipoDeCambio);
		Window window = (Window) Executions.createComponents("/pantallas/cotizador/tiposCambio.zul", null, args);
//		window.doModal();
		window.doPopup();
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		this.nuevo();
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}

	public void cargarItem() {

		long idABuscar = this.itemSelected.getId();
		this.nuevo();
		
		NodoTitulos root = new NodoTitulos(new TituloModeloCotizadorOV(),true);
		this.arbolTitulos = new DefaultTreeModel<TituloModeloCotizadorOV>(root);
		
		//Traemos el Item a cotizar
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(idABuscar));
		
		
		ItemsOV itemOV = (ItemsOV) Operaciones.ejecutar("SimpleTraerCotizacionDelItem", objetoOV, ItemsOV.class);
		this.itemSelected = itemOV;
		
		this.itemSelected.setDescripcion(Jsoup.parse(this.itemSelected.getDescripcion()).text());
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
		
	}
	
}
