
package com.jkt.erp.varios;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.ComponenteValor;

/**
 * Define la relacion entre un cliente y un clasificador
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ClienteClasificador extends PersistentEntity {

	private Cliente cliente;
	private ComponenteValor componenteValor;

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public ComponenteValor getComponenteValor() {
		return componenteValor;
	}

	public void setComponenteValor(ComponenteValor componenteValor) {
		this.componenteValor = componenteValor;
	}

}
