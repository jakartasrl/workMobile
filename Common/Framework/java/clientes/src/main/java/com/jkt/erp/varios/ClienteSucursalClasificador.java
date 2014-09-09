package com.jkt.erp.varios;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.ComponenteValor;

/**
 * Crea la relacion entre el clienteSucursal y sus valores de componentes clasificadores.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ClienteSucursalClasificador extends PersistentEntity {

	private static final long serialVersionUID = -3091611891807568449L;

	private ClienteSucursal clienteSucursal;
	private ComponenteValor componenteValor;

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
		this.componenteValor = componenteValor;
	}

}
