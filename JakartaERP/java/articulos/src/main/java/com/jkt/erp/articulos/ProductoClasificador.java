package com.jkt.erp.articulos;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.ComponenteValor;

public class ProductoClasificador extends PersistentEntity {

	@NotNull(message="El producto en la relacion producto-clasificador no puede ser nulo.")
	private Producto producto;
	
	@NotNull(message="Es primordial que exista un valor en la relacion entre el producto y un clasificador.")
	private ComponenteValor componenteValor;
	
//	@NotNull(message="Es primordial que exista una relacion con el clasificador dueño del valor.")
	private Clasificador clasificador;

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
//		this.componenteValor = componenteValor;
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
