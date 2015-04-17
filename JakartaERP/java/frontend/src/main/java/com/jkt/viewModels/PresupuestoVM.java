/*
 * 
 */
package com.jkt.viewModels;

import static org.apache.commons.beanutils.BeanUtils.copyProperties;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import lombok.Data;

import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.util.media.AMedia;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.FormaFacturacionOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListNotasOV;
import com.jkt.ov.NotaOV;
import com.jkt.ov.PresupuestoOV;
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
	
	
	@Command
	@NotifyChange("comprobanteOV")
	public void agregarFormaFacturacion(){
		this.comprobanteOV.getFacturaciones().add(0, new FormaFacturacionOV());
	}
	
	@SuppressWarnings("rawtypes")
	@Command
	public void guardar(){
//		
		if(!this.validaPresupuesto()){
			return;
		}
		
		if(!super.validarOV()){
			return;
		}
//		
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
			   		
					Window window = (Window) Executions.createComponents("/pantallas/presupuesto/reporte2.zul", null, hashMap);
					window.doModal();
		        }
		    }
		}
		);
		
	}

	private boolean validaPresupuesto() {
		List<FormaFacturacionOV> facturaciones = this.comprobanteOV.getFacturaciones();
		
		int i=1;
		for (FormaFacturacionOV formaFacturacionOV : facturaciones) {

			if(!this.validarDescriptible(formaFacturacionOV.getCondicionDePago(), "Complete la condicion de pago de elemento "+i+" en la \n solapa 'Formas de facturación'.")){
				return false;
			}
			
			if (formaFacturacionOV.getDescripcion()==null || formaFacturacionOV.getDescripcion().isEmpty()) {
				Messagebox.show("Complete la descripción del item "+i+" en la solapa 'Formas de facturación'.");
				return false;
			}
			i++;
		}
		return true;
	}


	@Command
	@NotifyChange({"comprobanteOV","contactoSeleccionado","contactos","lNotas","items","itemsArticulos","lDocumentacion","clienteOV","sucursalOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas","vendedorOV","representanteOV"})
	public void nuevo(){
		super.nuevo();
		this.comprobanteOV= new PresupuestoOV();
		init();
	}
	
	
	DescriptibleOV cotizacionDescriptible = new DescriptibleOV();
	DescriptibleOV presupuestoDescriptible = new DescriptibleOV();

	@Command
	public void buscar() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException{
		openHelper("presupuesto", "", presupuestoDescriptible, "cargarPresupuesto", "Presupuestos Disponibles", "Nro Presupuesto", "Cliente Sucursal / Fecha");
	}
	
	@Command
	public void cargarCotizacion() throws IllegalAccessException, InvocationTargetException, JakartaException{
		
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.cotizacionDescriptible.getId()));
		PresupuestoOV ovRecuperado = (PresupuestoOV) Operaciones.ejecutar("TraerCotizacionParaPresupuesto", objetoOV, PresupuestoOV.class);
		
		cargarPresupuestoDesdeCotizacion(ovRecuperado);
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}
	
	private void cargarPresupuestoDesdeCotizacion(PresupuestoOV ovRecuperado) throws JakartaException, IllegalAccessException, InvocationTargetException {
		this.vendedorOV = Operaciones.recuperarObjetoDescriptible("vendedor",ovRecuperado.getIdVendedor());
		this.representanteOV = Operaciones.recuperarObjetoDescriptible("representante",ovRecuperado.getIdRepresentante());
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
		
		actualizarNotas(ovRecuperado);

		actualizarContactosReferencia();
		this.contactoSeleccionado = completarCombo(this.contactos.getList(), ovRecuperado.getIdContactoReferencia());
		
		
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
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.presupuestoDescriptible.getId()));
		PresupuestoOV ovRecuperado = (PresupuestoOV) Operaciones.ejecutar("TraerPresupuesto", objetoOV, PresupuestoOV.class);
		
		cargarDesdeOV(ovRecuperado);
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}
	
	
	/**
	 * Carga los datos correspondientes, copiando desde los ids, hacia los descriptibles, generalmente para mostrar combos correctamente
	 * 
	 */
	private void cargarDesdeOV(PresupuestoOV ovRecuperado) throws JakartaException, IllegalAccessException, InvocationTargetException{
		this.vendedorOV = Operaciones.recuperarObjetoDescriptible("vendedor",ovRecuperado.getIdVendedor());
		this.representanteOV = Operaciones.recuperarObjetoDescriptible("representante",ovRecuperado.getIdRepresentante());
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
		
		actualizarNotas(ovRecuperado);

		actualizarContactosReferencia();
		this.contactoSeleccionado = completarCombo(this.contactos.getList(), ovRecuperado.getIdContactoReferencia());
		
		
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
		comprobanteOV.setIdContactoReferencia(contactoSeleccionado.getId());
		
		ArrayList<ItemsOV> itemsFinal = new ArrayList<ItemsOV>();
		
		for (ItemsOV itemsOV : items) {
			itemsOV.setIdMoneda(itemsOV.getMoneda().getId());
			itemsOV.setDescripcion(itemsOV.getPlantilla().getDescripcion());
			itemsOV.setTipo(Integer.valueOf(itemsOV.getTipoVenta().getCodigo()));
			itemsOV.setTipoItem(PedidoDet.CHAR_ITEM);
			itemsFinal.add(itemsOV);
		}

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
		
		/*
		 * Junta todos los items
		 */
		comprobanteOV.setItems(itemsFinal);
		
		List<FormaFacturacionOV> facturaciones = comprobanteOV.getFacturaciones();
		for (FormaFacturacionOV formaFacturacionOV : facturaciones) {
			formaFacturacionOV.setIdCondicionDePago(formaFacturacionOV.getCondicionDePago().getId());
		}
		
	}

	@Init
	public void init(){
		log.info("Iniciando ViewModel de Pedido.");
		
		log.info("Recuperando notas...");
		this.lNotas = ((ListNotasOV) Operaciones.ejecutar("TraerNotas", ListNotasOV.class)).getList();
		
		
		//TODO aca cargar las condiciones comerciales?
//		log.info("Recuperando documentos...");
//		this.lDocumentacion = ((ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV("documentacion"), ListDescriptibleOV.class)).getList();

		log.info("Recuperando monedas...");
		this.lMonedas = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV("moneda"), ListDescriptibleOV.class);
		
		log.info("Inicializando items...");
		this.items=new ArrayList<ItemsOV>();
		this.items.add(new ItemsOV());

		log.info("Iniciando tipos de venta...");
		this.tiposVenta=(ListDescriptibleOV) Operaciones.ejecutar("TraerTiposDeVenta", ListDescriptibleOV.class);
		
		log.info("Inicializando items para articulos...");
		this.itemsArticulos=new ArrayList<ItemsOV>();
		this.itemsArticulos.add(new ItemsOV());
		
		log.info("Inicializando contactos...");
		this.contactos = new ListDescriptibleOV();
		this.contactoSeleccionado=new DescriptibleOV();
		
		this.comprobanteOV= new PresupuestoOV();
	}
	
	@GlobalCommand("actualizarOVs")
	@NotifyChange({"comprobanteOV","contactoSeleccionado","contactos","clienteOV","sucursalOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas", "items","itemsArticulos","vendedorOV","representanteOV","lDocumentacion"})
	public void actualizar(){}
	
	protected String retrieveMethod() {
		return "actualizarOVs";
	}
	
}