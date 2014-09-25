package com.jkt.erp.articulos;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.ComponenteValor;

public class ProductoClasificador extends PersistentEntity {

	private Producto producto;
	private ComponenteValor componenteValor;

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public ComponenteValor getComponenteValor() {
		return componenteValor;
	}

	public void setComponenteValor(ComponenteValor componenteValor) {
		this.componenteValor = componenteValor;
	}

}
