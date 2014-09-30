package com.jkt.erp.varios;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.ComponenteValor;

/**
 * Crea la relacion entre el clienteSucursal y sus valores de componentes clasificadores.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ClienteSucursalClasificador extends PersistentEntity {

	private Clasificador clasificador;
	private ClienteSucursal clienteSucursal;
	private ComponenteValor componenteValor;

	public Clasificador getClasificador() {
		return clasificador;
	}

	public void setClasificador(Clasificador clasificador) {
		this.clasificador = clasificador;
	}

	public ClienteSucursal getClienteSucursal() {
		return clienteSucursal;
	}

	public void setClienteSucursal(ClienteSucursal clienteSucursal) {
		this.clienteSucursal = clienteSucursal;
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

}
