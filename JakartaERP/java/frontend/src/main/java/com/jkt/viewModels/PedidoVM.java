/*
 * 
 */
package com.jkt.viewModels;

import static org.apache.commons.beanutils.BeanUtils.copyProperties;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.validation.constraints.NotNull;

import lombok.Data;

import org.bouncycastle.i18n.MessageBundle;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.ValidationContext;
import org.zkoss.bind.Validator;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.bind.validator.AbstractValidator;
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.FormaFacturacionOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListItemsOV;
import com.jkt.ov.ListNotasOV;
import com.jkt.ov.NotaOV;
import com.jkt.ov.PedidoDocumentacionOV;
import com.jkt.ov.PedidoOV;
import com.jkt.ov.SucursalOV;
import com.jkt.pedido.dominio.Pedido;
import com.jkt.pedido.dominio.PedidoDet;

/**
 * ViewModel de la entidad {@link Pedido} que se encarga de procesar las diferentes peticiones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class PedidoVM extends ComprobanteVM implements IBasicOperations {

	private String titulo="Ingreso de Pedido";
	
	private List<DescriptibleOV> lDocumentacion=new ArrayList<DescriptibleOV>();
	private List<DescriptibleOV> docEntregados=new ArrayList<DescriptibleOV>();
	
	private PedidoOV comprobanteOV=new PedidoOV();
	
	private DescriptibleOV plantillaDescriptible = new DescriptibleOV();

	
	@Command
	@NotifyChange("comprobanteOV")
	public void agregarFormaFacturacion(){
		this.comprobanteOV.getFacturaciones().add(0, new FormaFacturacionOV());
	}
	
	/**
	 * Guarda un objeto
	 */
	@Command
	public void guardar(){
		
		if(!super.validarOV()){
			return;
		}
		
		completarOV();
		Operaciones.ejecutar("GuardarPedido", comprobanteOV);
		Messagebox.show("Se ha guardado el pedido correctamente.", "Mensaje",null, null,null);
	}

	
	
	/**
	 * 
	 */
	@Command
	@NotifyChange({"arbolNotas","archivos","comprobanteOV","contactoSeleccionado","contactos","lNotas","items","itemsArticulos","lDocumentacion","clienteOV","sucursalOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas","vendedorOV","representanteOV"})
	public void nuevo(){
		super.nuevo();
		this.lDocumentacion = new ArrayList<DescriptibleOV>();
		this.docEntregados= new ArrayList<DescriptibleOV>();
		this.comprobanteOV= new PedidoOV();
		init();
	}
	
	
	DescriptibleOV pedidoDescriptible = new DescriptibleOV();
	DescriptibleOV presupuestoDescriptible = new DescriptibleOV();

	@Command
	public void buscar() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException{
		openHelper("pedido", "", pedidoDescriptible, "recuperarPedido", "Pedidos Disponibles", "Nro Pedido", "Cliente Sucursal / Fecha",false);
	}
	
	
	/**
	 * A partir de un presupuesto, completa datos para el nuevo pedido.
	 */
	public void cargarPresupuesto() throws IllegalAccessException, InvocationTargetException, JakartaException{
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.presupuestoDescriptible.getId()));
		PedidoOV ovRecuperado = (PedidoOV) Operaciones.ejecutar("TraerPresupuestoParaPedido", objetoOV, PedidoOV.class);
		
		cargarDesdeOV(ovRecuperado);
		
		this.lDocumentacion = ((ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV("documentacion"), ListDescriptibleOV.class)).getList();
		this.docEntregados=new ArrayList<DescriptibleOV>();
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}
	
	
	/**
	 * Actualiza los datos recuperados desde el help de pedido.
	 * Debera setear todas las entidades con el objetivo de mostrar todos los datos previamente salvados.
	 */
	public void recuperarPedido() throws JakartaException, IllegalAccessException, InvocationTargetException{
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.pedidoDescriptible.getId()));
		
		PedidoOV ovRecuperado = (PedidoOV) Operaciones.ejecutar("TraerPedido", objetoOV, PedidoOV.class);

		cargarDesdeOV(ovRecuperado);
		actualizarDocs(ovRecuperado);
		
		this.comprobanteOV.setCargaACargoDeCliente(ovRecuperado.getCargaACargoDeCliente());
		this.comprobanteOV.setTransporteACargoDeCliente(ovRecuperado.getTransporteACargoDeCliente());
		this.comprobanteOV.setDescargaACargoDeCliente(ovRecuperado.getDescargaACargoDeCliente());
		
		//Ejecuta evento para actualizar todas las relaciones
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}
	
	private void cargarDesdeOV(PedidoOV ovRecuperado) throws JakartaException, IllegalAccessException, InvocationTargetException{
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
		
		this.archivos=ovRecuperado.getArchivos();
		
		actualizarNotas(ovRecuperado);
		crearArbolNotas();
		
		actualizarContactosReferencia();
		this.contactoSeleccionado = completarCombo(this.contactos.getList(), ovRecuperado.getIdContactoReferencia());
		
		
		DescriptibleOV plantilla;//para asignar la descripcion si el detalle es item o material.
		//esta bindeado con la plantilla con lo cual debo asignar datos a la plantilla.
		
		for (ItemsOV itemsOV : ovRecuperado.getItems()) {
			
			itemsOV.setMoneda(completarCombo(this.lMonedas.getList(), itemsOV.getIdMoneda()));
			
			itemsOV.setImporteTotal(itemsOV.getImporte()*itemsOV.getCantidad());
			
			switch (itemsOV.getTipoItem()) {
			case 'I':
				itemsOV.setTipoVenta(completarCombo(this.tiposVenta.getList(), Long.valueOf(itemsOV.getTipo())));

				
				/*
				 * Genero nuevas instancias, ya que se duplicaban textos en cada uno de los items al estar referenciando a la misma plantilla
				 */
				plantilla = new DescriptibleOV();
				
				Random rand = new Random();
			    int randomNum = rand.nextInt((10000 - 1) + 1) + 1;
				
				plantilla.setId(randomNum);
				
				plantilla.setDescripcion(itemsOV.getDescripcion());
				itemsOV.setPlantilla(plantilla);
				
				
				this.items.add(itemsOV);
				break;
			case 'M':
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

		this.comprobanteOV.setFacturaciones(ovRecuperado.getFacturaciones());
		for (FormaFacturacionOV formaFacturacionOV : this.comprobanteOV.getFacturaciones()) {
			formaFacturacionOV.setCondicionDePago(Operaciones.recuperarObjetoDescriptible("condicionPago", formaFacturacionOV.getIdCondicionDePago()));
		}
	
	}
	
	
	private void actualizarDocs(PedidoOV ovRecuperado) throws IllegalAccessException, InvocationTargetException {

		this.docEntregados = new ArrayList<DescriptibleOV>();
		this.lDocumentacion = new ArrayList<DescriptibleOV>();
		
		List<PedidoDocumentacionOV> docs = ovRecuperado.getDocs();
		for (PedidoDocumentacionOV pedidoDocumentacionOV : docs) {
			DescriptibleOV documento = new DescriptibleOV();
			copyProperties(documento, pedidoDocumentacionOV);
			documento.setId(pedidoDocumentacionOV.getIdDocumento());
			if (pedidoDocumentacionOV.getEntregado()) {
				this.docEntregados.add(documento);
			}
			this.lDocumentacion.add(documento);
		}
	}

	/**
	 * Setea el total de las notas, y las seleccionadas luego.
	 * 
	 */
	private void actualizarNotas(PedidoOV ovRecuperado) {
		
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
	
	
	private void completarOV() {
		comprobanteOV.setIdCliente(clienteOV.getId());
		comprobanteOV.setIdSucursal(sucursalOV.getId());
		comprobanteOV.setIdListaPrecio(lPreciosOV.getId());
		comprobanteOV.setIdVendedor(vendedorOV.getId());
		comprobanteOV.setIdRepresentante(representanteOV.getId());
		comprobanteOV.setIdContactoReferencia(contactoSeleccionado.getId());
		
		comprobanteOV.completarListaDocumentos(lDocumentacion, docEntregados);
		comprobanteOV.setArchivos(this.archivos);
		
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
//			itemsOV.setDescripcion(itemsOV.getPlantilla().getDescripcion());
			itemsOV.setIdProducto(itemsOV.getProductoOV().getId());
//			itemsOV.setTipo(Integer.valueOf(itemsOV.getTipoVenta().getCodigo()));
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
		
		for (FormaFacturacionOV formaFacturacionOV : comprobanteOV.getFacturaciones()) {
			formaFacturacionOV.setIdCondicionDePago(formaFacturacionOV.getCondicionDePago().getId());
		}
		
	}

	@Init
	public void init(){
		log.info("Iniciando ViewModel de Pedido.");
		
		log.info("Recuperando notas...");
		this.lNotas = ((ListNotasOV) Operaciones.ejecutar("TraerNotas", ListNotasOV.class)).getList();
		crearArbolNotas();

		
		log.info("Recuperando documentos...");
		this.lDocumentacion = ((ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV("documentacion"), ListDescriptibleOV.class)).getList();

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
		
		this.comprobanteOV=new PedidoOV();
		
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
	@NotifyChange({"arbolNotas","archivos","comprobanteOV","contactoSeleccionado","contactos","clienteOV","sucursalOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas", "items","itemsArticulos","vendedorOV","representanteOV","lDocumentacion"})
	public void actualizar(){}
	
	protected String retrieveMethod() {
		return "actualizarOVs";
	}
	
	public List<DescriptibleOV> getlDocumentacion() {
		return lDocumentacion;
	}

	public void setlDocumentacion(List<DescriptibleOV> lDocumentacion) {
		this.lDocumentacion = lDocumentacion;
	}
	
}