
package com.jkt.erp.varios;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.ComponenteValor;

/**
 * Define la relacion entre un cliente y un clasificador
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ClienteClasificador extends PersistentEntity {

	@NotNull
	private Clasificador clasificador;

	@NotNull
	private Cliente cliente;
	
	@NotNull
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
		if (componenteValor!=null) {
			this.componenteValor = componenteValor;
			this.clasificador=componenteValor.getComponente().getClasificador();
		}
	}

	public Clasificador getClasificador() {
		return clasificador;
	}

	public void setClasificador(Clasificador clasificador) {
		this.clasificador = clasificador;
	}
	

}
