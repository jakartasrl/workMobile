/*
 * 
 */
package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.apache.commons.collections.Closure;
import org.apache.commons.collections.CollectionUtils;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ClienteOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.DeterminacionOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListDeterminacionOV;
import com.jkt.ov.ListItemsOV;
import com.jkt.ov.ListNotasOV;
import com.jkt.ov.ListaPrecioOV;
import com.jkt.ov.NotaOV;
import com.jkt.ov.PedidoOV;
import com.jkt.ov.SucursalOV;
import com.jkt.pedido.dominio.Pedido;

/**
 * ViewModel de la entidad {@link Pedido} que se encarga de procesar las diferentes peticiones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class PedidoVM extends ViewModel {

	private String titulo="Ingreso de Pedido";
	private ClienteOV clienteOV=new ClienteOV();
	private SucursalOV sucursalOV=new SucursalOV();
	private ListaPrecioOV lPreciosOV=new ListaPrecioOV();
	
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
	@NotifyChange({"contactos","lNotas","items","itemsArticulos","lDocumentacion","clienteOV","sucursalOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas","vendedorOV","representanteOV"})
	public void nuevo(){
		
		this.clienteOV = new ClienteOV();
		this.sucursalOV = new SucursalOV();
		this.lPreciosOV = new ListaPrecioOV();
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
		init();
	}
	
	/**
	 * Abre un help generico
	 */
	@Command
	public void buscar() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException{
		openHelper("pedido", "", this.pedidoOV, "", "Pedidos Disponibles", "Nro Pedido", "Descripción");
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
			itemsFinal.add(itemsOV);
		}

		for (ItemsOV itemsOV : itemsArticulos) {
			itemsOV.setIdMoneda(itemsOV.getMoneda().getId());
			itemsOV.setDescripcion(itemsOV.getPlantilla().getDescripcion());
			itemsOV.setIdProducto(itemsOV.getProductoOV().getId());
			itemsFinal.add(itemsOV);
		}
		
		for (ItemsOV itemsOV : this.lDeterminacionesQuimicas) {
			itemsOV.setIdMoneda(itemsOV.getMoneda().getId());
			itemsFinal.add(itemsOV);
		}

		for (ItemsOV itemsOV : this.lDeterminacionesElectricas) {
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
	@NotifyChange({"contactos","clienteOV","sucursalOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas", "items","itemsArticulos","vendedorOV","representanteOV"})
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

	public ListaPrecioOV getlPreciosOV() {
		return lPreciosOV;
	}

	public void setlPreciosOV(ListaPrecioOV lPreciosOV) {
		this.lPreciosOV = lPreciosOV;
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

}