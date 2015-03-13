package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ClienteOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListDeterminacionOV;
import com.jkt.ov.ListaPrecioOV;
import com.jkt.ov.PedidoOV;
import com.jkt.pedido.dominio.Pedido;
//import com.jkt.view.ContainerOV;
import com.jkt.view.ObjectView;

/**
 * ViewModel de la entidad {@link Pedido} que se encarga de procesar las diferentes peticiones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class PedidoVM extends ViewModel {
	
	private ClienteOV clienteOV=new ClienteOV();
	private ListaPrecioOV lPreciosOV=new ListaPrecioOV();
	private ListDeterminacionOV lDeterminaciones=new ListDeterminacionOV();
	
	public ListDeterminacionOV getlDeterminaciones() {
		return lDeterminaciones;
	}

	public void setlDeterminaciones(ListDeterminacionOV lDeterminaciones) {
		this.lDeterminaciones = lDeterminaciones;
	}

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
	public void openHelper(@BindingParam("clase") String clase,@BindingParam("ov") ObjectView ov,@BindingParam("post") String metodo) throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {

		if (ov==null) {
			log.warn("No se ha indicado un objeto vista de destino. Por favor indique uno, de modo contrario, solamente la ventana es de una simple consulta de ayuda.");
		}
		
		ListDescriptibleOV listDescriptible = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV(clase), ListDescriptibleOV.class);

		Map map=new HashMap();
		
		map.put("coleccion",listDescriptible.getList());
		map.put("refresh", this.retrieveMethod());
		map.put("result", ov);
		map.put("invoke", metodo);
		map.put("vm", this);

		Window window = (Window) Executions.createComponents("/pantallas/pedido/helpGenerico.zul", null, map);
		window.doModal();
		
	}

	
	public void actualizarDeterminaciones(){
		Long idListaPrecio = this.getlPreciosOV().getId();
		System.out.println(idListaPrecio);
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1("LaboratorioQuimico");
		containerOV.setString2(String.valueOf(idListaPrecio));
		
		ListDeterminacionOV determinaciones = (ListDeterminacionOV) Operaciones.ejecutar("TraerDeterQuimConPrecio",containerOV,ListDeterminacionOV.class);
		List list = determinaciones.getList();
		list.size();
		
	}
	
	@GlobalCommand("actualizarOVs")
	@NotifyChange({"clienteOV","lPreciosOV"})
	public void actualizar(){}
	
	protected String retrieveMethod() {
		return "actualizarOVs";
	}

}
