/*
 * 
 */
package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import static org.apache.commons.beanutils.BeanUtils.*;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListItemsOV;
import com.jkt.ov.ListNotasOV;
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
public class PedidoVM extends ViewModel {

	private String titulo="Ingreso de Pedido";
	private DescriptibleOV clienteOV=new DescriptibleOV();
	private SucursalOV sucursalOV=new SucursalOV();
	private DescriptibleOV lPreciosOV=new DescriptibleOV();
	
	private ListDescriptibleOV tiposVenta=new ListDescriptibleOV();
	
	private List<ItemsOV> lDeterminacionesQuimicas=new ArrayList<ItemsOV>();
	private List<ItemsOV> lDeterminacionesElectricas=new ArrayList<ItemsOV>();
	
	private ListNotasOV lNotas=new ListNotasOV();
	
	private ListDescriptibleOV lDocumentacion=new ListDescriptibleOV();
	private List<DescriptibleOV> docEntregados=new ArrayList<DescriptibleOV>();

	private List<ItemsOV> items = new ArrayList<ItemsOV>();
	private List<ItemsOV> itemsArticulos = new ArrayList<ItemsOV>();
	
	private ListDescriptibleOV lMonedas=new ListDescriptibleOV();
	
	private DescriptibleOV vendedorOV=new DescriptibleOV();
	private DescriptibleOV representanteOV=new DescriptibleOV();
	
	private ListDescriptibleOV contactos=new ListDescriptibleOV();
	private DescriptibleOV contactoSeleccionado= new DescriptibleOV();
	
	private PedidoOV pedidoOV=new PedidoOV();
	
	/**
	 * Guarda un objeto
	 */
	@Command
	public void guardar(){
		completarOV();
		Operaciones.ejecutar("GuardarPedido", pedidoOV);
		Messagebox.show("Se ha guardado el pedido correctamente.", "Mensaje",null, null,null);
	}

	/**
	 * 
	 */
	@Command
	@NotifyChange({"contactoSeleccionado","contactos","lNotas","items","itemsArticulos","lDocumentacion","clienteOV","sucursalOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas","vendedorOV","representanteOV"})
	public void nuevo(){
		
		this.clienteOV = new DescriptibleOV();
		this.sucursalOV = new SucursalOV();
		this.lPreciosOV = new DescriptibleOV();
		this.lDeterminacionesQuimicas = new ArrayList<ItemsOV>();
		this.lDeterminacionesElectricas = new ArrayList<ItemsOV>();
		this.lNotas = new ListNotasOV();
		this.lDocumentacion = new ListDescriptibleOV();
		this.items = new ArrayList<ItemsOV>();
		this.lMonedas = new ListDescriptibleOV();

		this.contactos = new ListDescriptibleOV();

		this.vendedorOV = new DescriptibleOV();
		this.representanteOV = new DescriptibleOV();
		
		this.pedidoOV= new PedidoOV();
		
		this.contactoSeleccionado = new DescriptibleOV();
		
		init();
	}
	
	
	
	
	DescriptibleOV pedidoDescriptible = new DescriptibleOV();

	@Command
	public void buscar() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException{
		openHelper("pedido", "", pedidoDescriptible, "recuperarPedido", "Pedidos Disponibles", "Nro Pedido", "Descripción");
	}
	
	/**
	 * Actualiza los datos recuperados desde el help de pedido.
	 * Debera setear todas las entidades con el objetivo de mostrar todos los datos previamente salvados.
	 * @throws JakartaException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public void recuperarPedido() throws JakartaException, IllegalAccessException, InvocationTargetException{
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.pedidoDescriptible.getId()));
		
		PedidoOV ovRecuperado = (PedidoOV) Operaciones.ejecutar("TraerPedido", objetoOV, PedidoOV.class);
		
		this.vendedorOV = Operaciones.recuperarObjetoDescriptible("vendedor",ovRecuperado.getIdVendedor());
		this.representanteOV = Operaciones.recuperarObjetoDescriptible("representante",ovRecuperado.getIdRepresentante());
		this.lPreciosOV =  Operaciones.recuperarObjetoDescriptible("listaPrecios",ovRecuperado.getIdListaPrecio());
		this.clienteOV =  Operaciones.recuperarObjetoDescriptible("clientes",ovRecuperado.getIdCliente());
		
		DescriptibleOV sucursal = Operaciones.recuperarObjetoDescriptible("clienteSucursal",ovRecuperado.getIdSucursal());
		copyProperties(this.sucursalOV, sucursal);
		
		actualizarCampoSucursal();
		
		
		this.pedidoOV.setItems(new ArrayList<ItemsOV>());
		
		this.items=new ArrayList<ItemsOV>();
		this.itemsArticulos =new ArrayList<ItemsOV>();
		this.lDeterminacionesElectricas=new ArrayList<ItemsOV>();
		this.lDeterminacionesQuimicas=new ArrayList<ItemsOV>();
		
		
		
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
		
		//Ejecuta evento para actualizar todas las relaciones
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}
	
	
	/**
	 * Muestra un mensaje solamente
	 */
	@Command
	public void salir(){
		Messagebox.show("Saliendo de la aplicación.");
	}
	
	
	private void completarOV() {
		pedidoOV.setIdCliente(clienteOV.getId());
		pedidoOV.setIdSucursal(sucursalOV.getId());
		pedidoOV.setIdListaPrecio(lPreciosOV.getId());
		pedidoOV.setIdVendedor(vendedorOV.getId());
		pedidoOV.setIdRepresentante(representanteOV.getId());
		pedidoOV.setIdContactoReferencia(contactoSeleccionado.getId());
		
		pedidoOV.completarListaDocumentos(lDocumentacion.getList(), docEntregados);
		
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
			itemsOV.setDescripcion(itemsOV.getPlantilla().getDescripcion());
			itemsOV.setIdProducto(itemsOV.getProductoOV().getId());
			itemsOV.setTipo(Integer.valueOf(itemsOV.getTipoVenta().getCodigo()));
			itemsOV.setTipoItem(PedidoDet.CHAR_MATERIAL);
			itemsFinal.add(itemsOV);
		}
		
		for (ItemsOV itemsOV : this.lDeterminacionesQuimicas) {
			itemsOV.setIdMoneda(itemsOV.getMoneda().getId());
			itemsOV.setTipoItem(PedidoDet.CHAR_QUIMICO);
			itemsFinal.add(itemsOV);
		}

		for (ItemsOV itemsOV : this.lDeterminacionesElectricas) {
			itemsOV.setTipoItem(PedidoDet.CHAR_ELECTRICO);
			itemsOV.setIdMoneda(itemsOV.getMoneda().getId());
			itemsFinal.add(itemsOV);
		}
		
		/*
		 * Junta todos los items
		 */
		pedidoOV.setItems(itemsFinal);
		
	}

	@Init
	public void init(){
		log.info("Iniciando ViewModel de Pedido.");
		
		log.info("Recuperando notas...");
		this.lNotas = (ListNotasOV) Operaciones.ejecutar("TraerNotas", ListNotasOV.class);
		
		log.info("Recuperando documentos...");
		this.lDocumentacion = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV("documentacion"), ListDescriptibleOV.class);

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
	}
	
	@Command
	@NotifyChange("items")
	public void agregarElemento(){
		this.items.add(0, new ItemsOV());
	}
	@Command
	@NotifyChange("itemsArticulos")
	public void agregarElementoArticulo(){
		this.itemsArticulos.add(0, new ItemsOV());
	}
	
	/**
	 * 
	 * Metodo ejecutado desde el post del helper generico de lista de precios.
	 * 
	 */
	public void actualizarDeterminaciones(){
		this.lDeterminacionesQuimicas = actualizarDeterminaciones("LaboratorioQuimico");
		this.lDeterminacionesElectricas = actualizarDeterminaciones("LaboratorioElectrico");
	}

	/**
	 * 
	 * Actualiza las determinaciones recibiendo el nombre del parametro de laboratorio y una coleccion dnd depositar los resultados
	 * 
	 */
	private ArrayList<ItemsOV> actualizarDeterminaciones(String parametroLaboratorio) {
		Long idListaPrecio = this.lPreciosOV.getId();
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(parametroLaboratorio);
		containerOV.setString2(String.valueOf(idListaPrecio));
		
		ListItemsOV list = (ListItemsOV) Operaciones.ejecutar("TraerDeterminacionConPrecio",containerOV,ListItemsOV.class);
		return (ArrayList<ItemsOV>) list.getList();
	}
	
	@GlobalCommand("actualizarOVs")
	@NotifyChange({"contactoSeleccionado","contactos","clienteOV","sucursalOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas", "items","itemsArticulos","vendedorOV","representanteOV"})
	public void actualizar(){}
	
	protected String retrieveMethod() {
		return "actualizarOVs";
	}
	
	
	/**
	 * Solamente actualiza el campo que representa la descripcion completa de la sucursal.
	 * <p>ZK se encarga de actualizar el campo automaticamente con la ayuda del metodo actualizar que está en cada ViewModel.</p>
	 */
	public void actualizarCampoSucursal(){
		String text= this.clienteOV.getDescripcion().concat("/").concat(this.sucursalOV.getDescripcion());
		this.sucursalOV.setDescripcionCompleta(text);
		
		actualizarContactosReferencia();
	}

	private void actualizarContactosReferencia() {
		/*
		 * Actualiza los contactos de referencia
		 */
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(String.valueOf(this.sucursalOV.getId()));
		
		this.contactos = (ListDescriptibleOV) Operaciones.ejecutar("RecuperarContactosDeSucursal", containerOV, ListDescriptibleOV.class);
		this.contactoSeleccionado=new DescriptibleOV();
	}
	
	/**
	 * Limpia ovs al momento de seleccionar un cliente.
	 */
	public void actualizarCamposDependientesDeCliente(){
		this.sucursalOV=new SucursalOV();
		this.contactos=new ListDescriptibleOV();
		this.contactoSeleccionado=new DescriptibleOV();
	}


	public ListNotasOV getlNotas() {
		return lNotas;
	}

	public void setlNotas(ListNotasOV lNotas) {
		this.lNotas = lNotas;
	}

	public ListDescriptibleOV getlDocumentacion() {
		return lDocumentacion;
	}

	public void setlDocumentacion(ListDescriptibleOV lDocumentacion) {
		this.lDocumentacion = lDocumentacion;
	}

	public ListDescriptibleOV getlMonedas() {
		return lMonedas;
	}

	public void setlMonedas(ListDescriptibleOV lMonedas) {
		this.lMonedas = lMonedas;
	}

	public List<ItemsOV> getlDeterminacionesQuimicas() {
		return lDeterminacionesQuimicas;
	}

	public void setlDeterminacionesQuimicas(List<ItemsOV> lDeterminacionesQuimicas) {
		this.lDeterminacionesQuimicas = lDeterminacionesQuimicas;
	}

	public List<ItemsOV> getlDeterminacionesElectricas() {
		return lDeterminacionesElectricas;
	}

	public void setlDeterminacionesElectricas(
			List<ItemsOV> lDeterminacionesElectricas) {
		this.lDeterminacionesElectricas = lDeterminacionesElectricas;
	}

	public DescriptibleOV getlPreciosOV() {
		return lPreciosOV;
	}

	public void setlPreciosOV(DescriptibleOV lPreciosOV) {
		this.lPreciosOV = lPreciosOV;
	}

}