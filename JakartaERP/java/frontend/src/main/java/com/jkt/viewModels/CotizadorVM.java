package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import lombok.Data;

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
	
		this.completarCotizadorOV();
		
		Operaciones.ejecutar("GuardarCotizador", this.cotizadorOV );
		Messagebox.show("Modelo de Cotizador Guardado Correctamente.");
		
	}
	
	private void completarCotizadorOV() {
		
		this.cotizadorOV.setIdCotizacionDet(itemSelected.getId());
		this.cotizadorOV.setIdModelo(modeloCotizadorOV.getId());
		this.cotizadorOV.setIdMoneda(expresarEnMonedaSeleccionado.getId());
		this.cotizadorOV.setCodigoEstado("1");
		
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
			treeNode.getData().setIdC(treeNode.getData().getConcepto().getId());
			treeNode.getData().setConcepto(null);//para q el fwk no vaya a buscarlo a la base y le asigne null...
			//recordar, si elp valor es cero, se crea uno nuevo, si es >0 se busca en la base, si es null, se retorna null.
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
		if (treeNode.getData().getTipo().equalsIgnoreCase("C")){
			todosLosElementos.add(treeNode.getData());
		}
		
	}

	@Command
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		openComplexHelper("itemCotizacion", "", this.itemSelected, "cargarItemACotizar", "Items de Presupuesto", "Nro ítem", "Descripción del ítem",false, "","");
	}
	
	@SuppressWarnings("unchecked")
	@NotifyChange({"cotizadorOV","itemSelected"})
	public void cargarItemACotizar(){
		
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.itemSelected.getId()));
		ItemsOV itemsOV = (ItemsOV) Operaciones.ejecutar("TraerItem", objetoOV, ItemsOV.class);
		objetoOV.setString1(String.valueOf(this.itemSelected.getIdCotizador()));
		this.setItemSelected(itemsOV);	
		
	}
	
	@GlobalCommand("actualizar")
	@NotifyChange({"cotizadorOV","itemSelected","arbolTitulos","modeloCotizadorOV","monedas"})
	public void actualizar() {
		log.warn("Actualizando datos...");
	}

	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}
	
	@Override
	@Command
	@NotifyChange({"modeloCotizadorOV","tituloModeloCotizadorOV","arbolTitulos","cotizadorOV","clienteOV","vendedorOV","modeloCotizadorOV","itemSelected"})
	public void nuevo(){
		
		this.modeloCotizadorOV = new ModeloCotizadorOV();
		this.cotizadorOV = new CotizadorOV();
		this.clienteOV = new DescriptibleOV();
		this.vendedorOV = new DescriptibleOV();
		this.itemSelected = new ItemsOV();
		
		NodoTitulos root = new NodoTitulos(new TituloModeloCotizadorOV(),true);
		this.arbolTitulos=new AdvancedTreeModel(root);// DefaultTreeModel<TituloModeloCotizadorOV>(root);
	
	}
	
	@Init
	@NotifyChange({"lsTipoDeCambio"})
	public void init(){
		
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
				uMed.setId(tituloModeloCotizadorOV.getIdUnidadMedida());
				uMed.setCodigo(tituloModeloCotizadorOV.getCodUnidadMedida());
				uMed.setDescripcion(tituloModeloCotizadorOV.getDescUnidadMedida());
				tituloModeloCotizadorOV.setUnidadMedida(uMed);
				
				//Selecciono la moneda
				DescriptibleOV moneda=new DescriptibleOV();
				moneda.setId(tituloModeloCotizadorOV.getIdMoneda());
				moneda.setCodigo(tituloModeloCotizadorOV.getCodMoneda());
				moneda.setDescripcion(tituloModeloCotizadorOV.getDescMoneda());
				
				tituloModeloCotizadorOV.setMoneda(this.completarCombo(monedas.getList(), tituloModeloCotizadorOV.getIdMoneda()));
			
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
	@NotifyChange({"cotizadorOV","modeloCotizadorOV","arbolTitulos"})
	public void calcularPrecio(@BindingParam("titulo") NodoTitulos titulo){
		
		double precio = 0;
		double markUp = 0;
		
		precio = titulo.getData().getCantidad() * titulo.getData().getPrecioUnitario();
		titulo.getData().setPrecio(precio);
		
		if (this.expresarEnMonedaSeleccionado != null){
			markUp = precio * titulo.getData().getMarkUp() / 100;
			titulo.getData().setImporteVenta(precio / buscarCotizacion(this.expresarEnMonedaSeleccionado.getCodigo()) + markUp);
		}
		
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
		window.doModal();
	}
	
}
