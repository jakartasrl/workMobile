package com.jkt.viewModels;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.ov.ClienteOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ListClienteOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListSucursalesOV;
import com.jkt.ov.PedidoOV;
import com.jkt.ov.SucursalOV;
import com.jkt.pedido.dominio.Pedido;

/**
 * ViewModel de la entidad {@link Pedido} que se encarga de procesar las diferentes peticiones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class PedidoVM implements IBasicOperations{
	
	private List<ClienteOV> clientes=new ArrayList<ClienteOV>();
	private List<SucursalOV> sucursales=new ArrayList<SucursalOV>();
	
	public List<SucursalOV> getSucursales() {
		return sucursales;
	}

	public void setSucursales(List<SucursalOV> sucursales) {
		this.sucursales = sucursales;
	}

	public List<ClienteOV> getClientes() {
		return clientes;
	}

	public void setClientes(List<ClienteOV> clientes) {
		this.clientes = clientes;
	}
	
	@Override
	public void guardar() {
		
	}

	@Override
	public void nuevo() {
		
	}

	@Override
	public void cerrar() {
		
	}

	@Override
	public void cancelar() {
		
	}

	@Override
	@Command
	public void buscar() {
		
		PedidoOV pedidoOV = new PedidoOV();
		pedidoOV.setNro("PEDIDO-55-45");
		pedidoOV.setLetra("A");
		
		Operaciones.ejecutar("GuardarPedido",pedidoOV);
	}

	@Override
	public void buscarEliminados() {
		
	}

	@Override
	public void imprimir() {
		
	}
	
	@Command
	public void openHelper(@BindingParam("clase") String clase) {
		ListDescriptibleOV listDescriptible = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV(clase), ListDescriptibleOV.class);

		Map map=new HashMap();
		map.put("coleccion",listDescriptible.getList());
		map.put("codigo", "INDND");
		Window window = (Window) Executions.createComponents("/pantallas/pedido/helpGenerico.zul", null, map);
		window.doModal();
	}

}
