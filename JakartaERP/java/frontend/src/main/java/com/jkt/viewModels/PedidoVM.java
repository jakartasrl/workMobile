package com.jkt.viewModels;

import java.util.HashMap;
import java.util.Map;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Window;

import com.jkt.common.Closure;
import com.jkt.common.Operaciones;
import com.jkt.ov.ClienteOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListaPrecioOV;
import com.jkt.ov.PedidoOV;
import com.jkt.pedido.dominio.Pedido;
import com.jkt.view.ObjectView;

/**
 * ViewModel de la entidad {@link Pedido} que se encarga de procesar las diferentes peticiones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class PedidoVM extends ViewModel {
	
	private ClienteOV clienteOV=new ClienteOV();
	private ListaPrecioOV lPreciosOV=new ListaPrecioOV();
	
	public ListaPrecioOV getlPreciosOV() {
		return lPreciosOV;
	}

	public void setlPreciosOV(ListaPrecioOV lPreciosOV) {
		this.lPreciosOV = lPreciosOV;
	}

	public ClienteOV getClienteOV() {
		return clienteOV;
	}

	public void setClienteOV(ClienteOV clienteOV) {
		this.clienteOV = clienteOV;
	}

	private String descripcionCliente;
	
	public String getDescripcionCliente() {
		return descripcionCliente;
	}

	public void setDescripcionCliente(String descripcionCliente) {
		this.descripcionCliente = descripcionCliente;
	}


	@Command
	public void buscar() {
		
		PedidoOV pedidoOV = new PedidoOV();
		pedidoOV.setNro("PEDIDO-55-45");
		pedidoOV.setLetra("A");
		
		Operaciones.ejecutar("GuardarPedido",pedidoOV);
	}

	@Command
	public void openHelper(@BindingParam("clase") String clase,@BindingParam("ov") ObjectView ov) {

		if (ov==null) {
			log.warn("No se ha indicado un objeto vista de destino. Por favor indique uno, de modo contrario, solamente la ventana es de una simple consulta de ayuda.");
		}
		
		ListDescriptibleOV listDescriptible = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV(clase), ListDescriptibleOV.class);

		Map map=new HashMap();
		
		map.put("coleccion",listDescriptible.getList());
		map.put("refresh", this.retrieveMethod());
		map.put("result", ov);

		Window window = (Window) Executions.createComponents("/pantallas/pedido/helpGenerico.zul", null, map);
		window.doModal();
	}

	
	@GlobalCommand("actualizarOVs")
	@NotifyChange({"clienteOV","lPreciosOV"})
	public void actualizar(){}
	
	protected String retrieveMethod() {
		return "actualizarOVs";
	}

}
