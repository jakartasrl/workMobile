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
import com.jkt.ov.ListClienteOV;
import com.jkt.ov.PedidoOV;
import com.jkt.pedido.dominio.Pedido;

/**
 * ViewModel de la entidad {@link Pedido} que se encarga de procesar las diferentes peticiones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class PedidoVM implements IBasicOperations{
	
	private String campo="ejemplo";
	private List<ClienteOV> clientes=new ArrayList<ClienteOV>();
	
	@Init
	public void init(@ExecutionArgParam("list") List<ClienteOV> clientes){
		this.clientes=clientes;
	}
	
	public String getCampo() {
		return campo;
	}

	public void setCampo(String campo) {
		this.campo = campo;
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
	@NotifyChange("clientes")
	public void recuperarClientes(){
		ListClienteOV lista = (ListClienteOV) Operaciones.ejecutar("RecuperarClientes", ListClienteOV.class);
		clientes= lista.getList();
		
		if (clientes.isEmpty()) {
			Messagebox.show("No existen presupuestos disponibles.");
			return;
		}
		Map map=new HashMap();
		map.put("list",clientes);
		Window window = (Window) Executions.createComponents("/pantallas/pedido/helpPresupuesto.zul", null, map);
		window.doModal();
	}
	
	
	@Command
	public void cerrarModal(@BindingParam("window")  Window x){
		x.detach();
	}
	
	
}
