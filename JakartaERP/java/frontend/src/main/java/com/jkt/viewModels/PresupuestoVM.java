/*
 * 
 */
package com.jkt.viewModels;

import static org.apache.commons.beanutils.BeanUtils.copyProperties;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import lombok.Data;

import org.apache.commons.beanutils.BeanUtils;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zul.DefaultTreeModel;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ArchivoOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.FormaFacturacionOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListNotasOV;
import com.jkt.ov.NotaOV;
import com.jkt.ov.PresupuestoOV;
import com.jkt.ov.tree.NodoNotas;
import com.jkt.pedido.dominio.Pedido;
import com.jkt.pedido.dominio.PedidoDet;

/**
 * ViewModel de la entidad {@link Pedido} que se encarga de procesar las diferentes peticiones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class PresupuestoVM extends ComprobanteVM implements IBasicOperations{

	private String titulo="Ingreso de Presupuesto";
	
	private PresupuestoOV comprobanteOV=new PresupuestoOV();
	
	private boolean aPartirDeCotizacion = false;
	private Long idCotizacion=0L;

	@Command
	@NotifyChange("comprobanteOV")
	public void agregarFormaFacturacion(){
		this.comprobanteOV.getFacturaciones().add(new FormaFacturacionOV());
	}
	
	
	@SuppressWarnings("rawtypes")
	@Command
	public void guardar(){
		
		//Si se esta guardando un presupuesto a partir de una cotizacion, no se deben validar las listas innecesarias.
		if(this.aPartirDeCotizacion){
			this.lDeterminacionesElectricas=new ArrayList<ItemsOV>();
			this.lDeterminacionesQuimicas=new ArrayList<ItemsOV>();
			this.itemsArticulos=new ArrayList<ItemsOV>();
		}
		
		if(!this.validaFacturaciones(this.comprobanteOV.getFacturaciones())){
			return;
		}
		
		if(!super.validarOV()){
			return;
		}

		completarOV();
		final DescriptibleOV descripcionPresupuesto = (DescriptibleOV) Operaciones.ejecutar("GuardarPresupuesto", comprobanteOV, DescriptibleOV.class);
		
		Messagebox.show("¿Desea generar un comprobante del presupuesto generado?", "Reporte de Presupuesto", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION, new org.zkoss.zk.ui.event.EventListener() {    
			public void onEvent(Event evt) throws InterruptedException, IOException {
		        if (evt.getName().equals("onOK")) {
					ContainerOV datosPDF = (ContainerOV) Operaciones.ejecutar("GenerarComprobantePresupuesto", new ContainerOV(String.valueOf(descripcionPresupuesto.getId())), ContainerOV.class);
					
					String sPath = datosPDF.getString1();
					String sFile = datosPDF.getString2();

			   		HashMap<String, Object> hashMap = new HashMap<String, Object>();
			   		
			   		hashMap.put("Path", sPath);
			   		hashMap.put("File", sFile);
			   		
					Window window = (Window) Executions.createComponents("/pantallas/presupuesto/reporte.zul", null, hashMap);
					window.doModal();
		        }
		    }
		}
		);
		
		
	}

	@Command
	@NotifyChange({"arbolNotas","archivos","aPartirDeCotizacion", "comprobanteOV","contactoSeleccionado","contactos","lNotas","items","itemsArticulos","lDocumentacion","clienteOV","sucursalOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas","vendedorOV","representanteOV"})
	public void nuevo(){
		
		this.aPartirDeCotizacion=false;
		this.idCotizacion=0L;
		
		super.nuevo();
		this.comprobanteOV= new PresupuestoOV();
		this.aPartirDeCotizacion=false;
		init();
	}
	
	
	DescriptibleOV cotizacionDescriptible = new DescriptibleOV();
	PresupuestoOV presupuestoDescriptible = new PresupuestoOV();
	
	@Command
	public void buscar() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException{
		openComplexHelper("presupuesto", "", presupuestoDescriptible, "cargarPresupuesto", "Presupuestos Disponibles", "Nro Presupuesto", "Cliente" , true , "Fecha","");
	}
	
	@Command
	@NotifyChange({"aPartirDeCotizacion", "comprobanteOV"})
	public void cargarCotizacion() throws IllegalAccessException, InvocationTargetException, JakartaException{
		
		ContainerOV objetoOV = new ContainerOV();
		
		this.idCotizacion = this.cotizacionDescriptible.getId();
		this.aPartirDeCotizacion=true;
		
		objetoOV.setString1(String.valueOf(this.idCotizacion));
		PresupuestoOV ovRecuperado = (PresupuestoOV) Operaciones.ejecutar("TraerCotizacionParaPresupuesto", objetoOV, PresupuestoOV.class);
		
		cargarPresupuestoDesdeCotizacion(ovRecuperado);
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}
	
	private void cargarPresupuestoDesdeCotizacion(PresupuestoOV ovRecuperado) throws JakartaException, IllegalAccessException, InvocationTargetException {
		this.vendedorOV = Operaciones.recuperarObjetoDescriptible("vendedor",ovRecuperado.getIdVendedor());
		
		if(ovRecuperado.getIdRepresentante()!=null){
			this.representanteOV = Operaciones.recuperarObjetoDescriptible("representante",ovRecuperado.getIdRepresentante());
		}

//		this.representanteOV = Operaciones.recuperarObjetoDescriptible("representante",ovRecuperado.getIdRepresentante());
	
		this.clienteOV =  Operaciones.recuperarObjetoDescriptible("clientes",ovRecuperado.getIdCliente());
		
		DescriptibleOV sucursal = Operaciones.recuperarObjetoDescriptible("clienteSucursal",ovRecuperado.getIdSucursal());
		copyProperties(this.sucursalOV, sucursal);
		
		actualizarCampoSucursal();
		
		this.comprobanteOV.setId(ovRecuperado.getId());
		this.comprobanteOV.setItems(new ArrayList<ItemsOV>());
		this.comprobanteOV.setFacturaciones(new ArrayList<FormaFacturacionOV>());
		this.comprobanteOV.setNroCotizacion(ovRecuperado.getNroCotizacion());
		
		this.items=new ArrayList<ItemsOV>();
		this.itemsArticulos =new ArrayList<ItemsOV>();
		this.lDeterminacionesElectricas=new ArrayList<ItemsOV>();
		this.lDeterminacionesQuimicas=new ArrayList<ItemsOV>();
		
		log.info("Recuperando notas...");
		this.lNotas = ((ListNotasOV) Operaciones.ejecutar("TraerNotas", ListNotasOV.class)).getList();
		crearArbolNotas();
		
		actualizarContactosReferencia();
//		this.contactoSeleccionado = completarCombo(this.contactos.getList(), ovRecuperado.getIdContactoReferencia());
		
		this.archivos=ovRecuperado.getArchivos();
		
		DescriptibleOV plantilla;
		
		for (ItemsOV itemsOV : ovRecuperado.getItems()) {
			
			itemsOV.setTipoVenta(completarCombo(this.tiposVenta.getList(), Long.valueOf(itemsOV.getTipo())));
			itemsOV.setMoneda(completarCombo(this.lMonedas.getList(), itemsOV.getIdMoneda()));
		
			plantilla = new DescriptibleOV();
			
			Random rand = new Random();
		    int randomNum = rand.nextInt((10000 - 1) + 1) + 1;
			
			plantilla.setId(randomNum);
			
			plantilla.setDescripcion(itemsOV.getDescripcion());
			itemsOV.setPlantilla(plantilla);
			
			this.items.add(itemsOV);
		
		}
		
		this.comprobanteOV.setFecha(ovRecuperado.getFecha());
		this.comprobanteOV.setNro(ovRecuperado.getNro());
	}

	/**
	 * A partir de un presupuesto, completa datos para el nuevo pedido.
	 */
	public void cargarPresupuesto() throws IllegalAccessException, InvocationTargetException, JakartaException{
		this.idCotizacion=0L;
		
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.presupuestoDescriptible.getId()));
		PresupuestoOV ovRecuperado = (PresupuestoOV) Operaciones.ejecutar("TraerPresupuesto", objetoOV, PresupuestoOV.class);
		
		cargarDesdeOV(ovRecuperado);
		this.comprobanteOV.setNroCotizacion("");
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);

	}
	
	
	/**
	 * Carga los datos correspondientes, copiando desde los ids, hacia los descriptibles, generalmente para mostrar combos correctamente
	 * 
	 */
	private void cargarDesdeOV(PresupuestoOV ovRecuperado) throws JakartaException, IllegalAccessException, InvocationTargetException{
		this.vendedorOV = Operaciones.recuperarObjetoDescriptible("vendedor",ovRecuperado.getIdVendedor());
		
		if(ovRecuperado.getIdRepresentante()!=null){
			this.representanteOV = Operaciones.recuperarObjetoDescriptible("representante",ovRecuperado.getIdRepresentante());
		}
		
		this.lPreciosOV =  Operaciones.recuperarObjetoDescriptible("listaPrecios",ovRecuperado.getIdListaPrecio());
		this.clienteOV =  Operaciones.recuperarObjetoDescriptible("clientes",ovRecuperado.getIdCliente());
		
		DescriptibleOV sucursal = Operaciones.recuperarObjetoDescriptible("clienteSucursal",ovRecuperado.getIdSucursal());
		copyProperties(this.sucursalOV, sucursal);
		
		actualizarCampoSucursal();
		
		this.comprobanteOV.setId(ovRecuperado.getId());
		this.comprobanteOV.setItems(new ArrayList<ItemsOV>());
		
		this.items=new ArrayList<ItemsOV>();
		this.itemsArticulos =new ArrayList<ItemsOV>();
		this.lDeterminacionesElectricas=new ArrayList<ItemsOV>();
		this.lDeterminacionesQuimicas=new ArrayList<ItemsOV>();
		this.archivos=new ArrayList<ArchivoOV>();
		
		this.archivos=ovRecuperado.getArchivos();
		
		actualizarNotas(ovRecuperado);
		crearArbolNotas();
		
		actualizarContactosReferencia();
		actualizarContactosSeleccionados(ovRecuperado.getContactosReferencia());
		
		DescriptibleOV plantilla;//para asignar la descripcion si el detalle es item o material.
		//esta bindeado con la plantilla con lo cual debo asignar datos a la plantilla.
		
		for (ItemsOV itemsOV : ovRecuperado.getItems()) {
			
			itemsOV.setTipoVenta(completarCombo(this.tiposVenta.getList(), Long.valueOf(itemsOV.getTipo())));
			itemsOV.setMoneda(completarCombo(this.lMonedas.getList(), itemsOV.getIdMoneda()));
			
			
			switch (itemsOV.getTipoItem()) {
			case 'I':
				plantilla = new DescriptibleOV();
				plantilla.setDescripcion(itemsOV.getDescripcion());
				itemsOV.setPlantilla(plantilla);
				this.items.add(itemsOV);
				break;
			case 'M':
				plantilla = new DescriptibleOV();
				plantilla.setDescripcion(itemsOV.getDescripcion());
				itemsOV.setPlantilla(plantilla);
				itemsOV.setProductoOV(Operaciones.recuperarObjetoDescriptible("articulos", itemsOV.getIdProducto()));
				this.itemsArticulos.add(itemsOV);
				break;
			case 'E':
				this.lDeterminacionesElectricas.add(itemsOV);
				break;
			case 'Q':
				this.lDeterminacionesQuimicas.add(itemsOV);
				break;

			default:
				log.warn("El tipo de detalle "+ itemsOV.getId() +" no es correcto.");
				break;
			}
		}
		
		this.comprobanteOV.setFecha(ovRecuperado.getFecha());
		this.comprobanteOV.setNro(ovRecuperado.getNro());
		this.comprobanteOV.setIdCotizacion(ovRecuperado.getIdCotizacion());
		
		this.comprobanteOV.setFacturaciones(ovRecuperado.getFacturaciones());
		for (FormaFacturacionOV formaFacturacionOV : this.comprobanteOV.getFacturaciones()) {
			formaFacturacionOV.setCondicionDePago(Operaciones.recuperarObjetoDescriptible("condicionPago", formaFacturacionOV.getIdCondicionDePago()));
		}
		
		this.idCotizacion=this.comprobanteOV.getIdCotizacion();
		if (this.idCotizacion==null) {
			this.aPartirDeCotizacion=false;
		}else{
			this.aPartirDeCotizacion=true;
		}
		
	}
	
	
	/**
	 * Setea el total de las notas, y las seleccionadas luego.
	 * 
	 */
	private void actualizarNotas(PresupuestoOV ovRecuperado) {
		
		this.lNotas=ovRecuperado.getNotas();
		this.comprobanteOV.setNotas(new ArrayList<NotaOV>());
		for (NotaOV nota : this.lNotas) {
			if (nota.getActivo()) {
				nota.setChecked(true);
				this.comprobanteOV.getNotas().add(nota);
			}
		}
	}

	/**
	 * Muestra un mensaje solamente
	 */
	@Command
	public void salir(){
		Messagebox.show("Saliendo de la aplicación.");
	}
	
	
	/**
	 * Asigna desde los descriptibles, a ids, para poder enviar al fwk y que setee referencias existentes.(o no, si le id es 0, sera una nueva entidad)
	 */
	private void completarOV() {
		comprobanteOV.setIdCliente(clienteOV.getId());
		comprobanteOV.setIdSucursal(sucursalOV.getId());
		comprobanteOV.setIdListaPrecio(lPreciosOV.getId());
		comprobanteOV.setIdVendedor(vendedorOV.getId());
		comprobanteOV.setIdRepresentante(representanteOV.getId());

		//		comprobanteOV.setIdContactoReferencia(contactoSeleccionado.getId());
		comprobanteOV.setContactosReferencia(this.getContactosSeleccionados());

		
		comprobanteOV.setArchivos(this.archivos);
		
		comprobanteOV.setIdCotizacion(idCotizacion);
		
		ArrayList<ItemsOV> itemsFinal = new ArrayList<ItemsOV>();
		
		for (ItemsOV itemsOV : items) {
			itemsOV.setIdMoneda(itemsOV.getMoneda().getId());
			itemsOV.setDescripcion(itemsOV.getPlantilla().getDescripcion());
			itemsOV.setTipo(Integer.valueOf(itemsOV.getTipoVenta().getCodigo()));
			itemsOV.setTipoItem(PedidoDet.CHAR_ITEM);
			itemsFinal.add(itemsOV);
		}

		if (!this.isaPartirDeCotizacion()) {
			for (ItemsOV itemsOV : itemsArticulos) {
				itemsOV.setIdMoneda(itemsOV.getMoneda().getId());
				itemsOV.setIdProducto(itemsOV.getProductoOV().getId());
				itemsOV.setTipoItem(PedidoDet.CHAR_MATERIAL);
				itemsFinal.add(itemsOV);
			}
			
			for (ItemsOV itemsOV : lDeterminacionesQuimicas) {
				itemsOV.setIdMoneda(itemsOV.getMoneda().getId());
				itemsOV.setTipoItem(PedidoDet.CHAR_QUIMICO);
				itemsFinal.add(itemsOV);
			}
	
			for (ItemsOV itemsOV : lDeterminacionesElectricas) {
				itemsOV.setTipoItem(PedidoDet.CHAR_ELECTRICO);
				itemsOV.setIdMoneda(itemsOV.getMoneda().getId());
				itemsFinal.add(itemsOV);
			}
		}
		
		/*
		 * Junta todos los items
		 */
		comprobanteOV.setItems(itemsFinal);
		
		for (FormaFacturacionOV formaFacturacionOV : comprobanteOV.getFacturaciones()) {
			formaFacturacionOV.setIdCondicionDePago(formaFacturacionOV.getCondicionDePago().getId());
		}
		
	}

	@Init(superclass=true)
	public void init(){
		
		if(isCargadoDesdeSession()){
			return;
		}
		
		log.info("Iniciando ViewModel de Pedido.");
		
		log.info("Asignando filtros customizados.");
		this.setFiltro("filtroComprobanteCliente");
		
		log.info("Recuperando notas...");
		this.lNotas = ((ListNotasOV) Operaciones.ejecutar("TraerNotas", ListNotasOV.class)).getList();
		crearArbolNotas();
		
		log.info("Recuperando monedas...");
		this.lMonedas = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV("moneda"), ListDescriptibleOV.class);
		
		log.info("Inicializando items...");
		this.items=new ArrayList<ItemsOV>();
		this.items.add(new ItemsOV());

		log.info("Iniciando tipos de venta...");
		this.tiposVenta=(ListDescriptibleOV) Operaciones.ejecutar("TraerTiposDeVenta", ListDescriptibleOV.class);
		
		log.info("Inicializando items para articulos...");
		this.itemsArticulos=new ArrayList<ItemsOV>();
		
		log.info("Inicializando contactos...");
		this.contactos = new ListDescriptibleOV();
		this.contactosSeleccionados=new ArrayList<DescriptibleOV>();
		
		this.comprobanteOV= new PresupuestoOV();

	}


	@Command
	public void toogleNota(@BindingParam("nota") NotaOV nota){
		if(nota.getChecked()){
			this.comprobanteOV.getNotas().add(nota);
		}else{
			this.comprobanteOV.getNotas().remove(nota);
		}
	}
	

	@GlobalCommand("actualizarOVs")
	@NotifyChange({"arbolNotas","archivos","aPartirDeCotizacion","comprobanteOV","contactoSeleccionado","contactos","clienteOV","sucursalOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas", "items","itemsArticulos","vendedorOV","representanteOV","lDocumentacion"})
	public void actualizar(){}
	
	protected String retrieveMethod() {
		return "actualizarOVs";
	}

	public boolean isaPartirDeCotizacion() {
		return aPartirDeCotizacion;
	}

	public void setaPartirDeCotizacion(boolean aPartirDeCotizacion) {
		this.aPartirDeCotizacion = aPartirDeCotizacion;
	}

	
	@Command
	@NotifyChange("comprobanteOV")
	public void eliminarFacturacion(@BindingParam("elemento") FormaFacturacionOV elemento) {
		this.comprobanteOV.getFacturaciones().remove(elemento);
	}


	@Override
	public void cancelarCustomizado() {
		this.nuevo();
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}

	
}