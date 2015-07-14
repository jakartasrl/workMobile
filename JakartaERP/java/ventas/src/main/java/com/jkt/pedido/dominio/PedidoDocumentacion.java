package com.jkt.pedido.dominio;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.dominio.PersistentEntity;
import com.jkt.presupuesto.dominio.Nota;

/**
 * Define la relación entre un documento, un pedido, y el estado del mismo.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class PedidoDocumentacion extends PersistentEntity {

//	private Pedido pedido;
	private Documentacion documentacion;
	private boolean entregado = Boolean.FALSE;
	
	public boolean equals(Object other) {
		if (this == other) return true;
		if ( !(other instanceof PedidoDocumentacion) ) return false;
		
		final PedidoDocumentacion entity = (PedidoDocumentacion) other;
		
		if (entity.getId()==0) return false;
		
		if ( !(entity.getId()==getId())) return false;
		
		return true;
	}
	
	public int hashCode() {
		int result;
		result = (int) (29 * getId());
		return result;
	}
}
