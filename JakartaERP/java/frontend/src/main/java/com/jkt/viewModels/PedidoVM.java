package com.jkt.viewModels;

import org.zkoss.bind.annotation.Command;

import com.jkt.common.Operaciones;
import com.jkt.ov.PedidoOV;
import com.jkt.pedido.dominio.Pedido;

/**
 * ViewModel de la entidad {@link Pedido} que se encarga de procesar las diferentes peticiones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class PedidoVM implements IBasicOperations{

	
	
	
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

}
