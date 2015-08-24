package com.jkt.pedido.validadores;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.facturacion.dominio.FacturadorPedido;
import com.jkt.facturacion.dominio.JakartaERPFacturador;
import com.jkt.grafo.DatoNodo;
import com.jkt.operaciones.ValidacionDeNegocio;
import com.jkt.pedido.dominio.TareaPedido;

public class ValidadorTareasPedido extends ValidacionDeNegocio {

	@SuppressWarnings("static-access")
	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		
		try {
			TareaPedido tarea = (TareaPedido) entity;
			if(tarea.isEsTareaFacturacion()){
				if(DatoNodo.Estado.EN_EJECUCION==tarea.getEstado().getEstado(tarea.getIdEstado())){
					//Facturar el pedido, con la forma de facturacion.
					JakartaERPFacturador facturador = new FacturadorPedido(getServiceRepository());
					facturador.ejecutarFacturacion(tarea);
				}
			}
		} catch (JakartaException e) {
			throw new ValidacionDeNegocioException("Ocurrio un error en la validacion de la tarea de pedido al intentar guardarla.");
		} catch (Exception e) {
			throw new ValidacionDeNegocioException("Ocurrio un error en la validacion de la tarea de pedido al intentar guardarla.");
		}
		
		
	}

}
