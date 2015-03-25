/*
 * 
 */
package com.jkt.viewModels;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;
import lombok.EqualsAndHashCode;

import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import scala.collection.script.Message;

import com.jkt.common.Operaciones;
import com.jkt.ov.ClienteOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListDeterminacionOV;
import com.jkt.ov.ListNotasOV;
import com.jkt.ov.ListaPrecioOV;
import com.jkt.ov.PedidoOV;
import com.jkt.pedido.dominio.Pedido;

/**
 * ViewModel de la entidad {@link Pedido} que se encarga de procesar las diferentes peticiones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class PedidoVM extends ViewModel {
	
	private ClienteOV clienteOV=new ClienteOV();
	private DescriptibleOV sucursalOV=new DescriptibleOV();
	private ListaPrecioOV lPreciosOV=new ListaPrecioOV();
	private ListDeterminacionOV lDeterminacionesQuimicas=new ListDeterminacionOV();
	private ListDeterminacionOV lDeterminacionesElectricas=new ListDeterminacionOV();
	private ListNotasOV lNotas=new ListNotasOV();
	private ListDescriptibleOV lDocumentacion=new ListDescriptibleOV();
	private List<ItemsOV> items = new ArrayList<ItemsOV>();
	
	
	/**
	 * Para abrir el pop up.
	 */
	private ItemsOV itemActual;
	
	private PedidoOV pedidoOV=new PedidoOV();
	
	@Command
	public void guardar(){
		completarOV();
		Operaciones.ejecutar("GuardarPedido", pedidoOV);
	}
	
	private void completarOV() {
		pedidoOV.setIdCliente(clienteOV.getId());
		pedidoOV.setIdSucursal(sucursalOV.getId());
		pedidoOV.setIdListaPrecio(lPreciosOV.getId());
	}

	@Init
	public void init(){
		log.info("Iniciando ViewModel de Pedido.");
		
		log.info("Recuperando notas...");
		this.lNotas = (ListNotasOV) Operaciones.ejecutar("TraerNotas", ListNotasOV.class);
		
		log.info("Recuperando documentos...");
		this.lDocumentacion = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV("documentacion"), ListDescriptibleOV.class);
		
		log.info("Inicializando items...");
		this.items.add(new ItemsOV());
		
	}
	
	@Command
	@NotifyChange("items")
	public void agregarElemento(){
		
//		ItemsOV itemsOV = this.items.get(0);
//		if (itemsOV.getCantidad()==0 || itemsOV.getImporte()==0 || itemsOV.getImporteTotal()==0 || itemsOV.getTipo().isEmpty() || itemsOV.getReferencia().isEmpty()) {
//			Messagebox.show("Debe completar el item anterior.", "Cargar datos.", Messagebox.OK, Messagebox.EXCLAMATION);
//			return;
//		}
		
		this.items.add(0, new ItemsOV());
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
	private ListDeterminacionOV actualizarDeterminaciones(String parametroLaboratorio) {
		Long idListaPrecio = this.lPreciosOV.getId();
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(parametroLaboratorio);
		containerOV.setString2(String.valueOf(idListaPrecio));
		
		return (ListDeterminacionOV) Operaciones.ejecutar("TraerDeterminacionConPrecio",containerOV,ListDeterminacionOV.class);
	}
	
	@GlobalCommand("actualizarOVs")
	@NotifyChange({"clienteOV","sucursalOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas", "items"})
	public void actualizar(){}
	
	protected String retrieveMethod() {
		return "actualizarOVs";
	}
	
	@Command
	public void editarPlantilla(@BindingParam("ov") ItemsOV item){
		this.itemActual=item;
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("item",this.itemActual);
		map.put("vm", this);

		Window window = (Window) Executions.createComponents("/pantallas/pedido/edicionPlantilla.zul", null, map);
		window.doModal();
		
	}

	public ListaPrecioOV getlPreciosOV() {
		return lPreciosOV;
	}

	public void setlPreciosOV(ListaPrecioOV lPreciosOV) {
		this.lPreciosOV = lPreciosOV;
	}

	public ListDeterminacionOV getlDeterminacionesQuimicas() {
		return lDeterminacionesQuimicas;
	}

	public void setlDeterminacionesQuimicas(ListDeterminacionOV lDeterminacionesQuimicas) {
		this.lDeterminacionesQuimicas = lDeterminacionesQuimicas;
	}

	public ListDeterminacionOV getlDeterminacionesElectricas() {
		return lDeterminacionesElectricas;
	}

	public void setlDeterminacionesElectricas(ListDeterminacionOV lDeterminacionesElectricas) {
		this.lDeterminacionesElectricas = lDeterminacionesElectricas;
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

}