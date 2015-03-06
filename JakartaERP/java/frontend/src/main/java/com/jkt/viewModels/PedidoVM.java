package com.jkt.viewModels;

import org.zkoss.bind.annotation.Command;

import com.jkt.conciliacion.Operaciones;
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
		Operaciones.ejecutar("TraerProvincia");
	}

	@Override
	public void buscarEliminados() {
		
	}

	@Override
	public void imprimir() {
		
	}

}
