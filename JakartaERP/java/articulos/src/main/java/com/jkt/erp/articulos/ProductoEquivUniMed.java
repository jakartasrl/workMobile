package com.jkt.erp.articulos;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.UnidadMedida;

/**
 * <p>Define las relaciones entre dos unidades de medidas para determinado producto</p>
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class ProductoEquivUniMed extends PersistentEntity {

	@NotNull(message = "La equivalencia entre unidades de medidas debe tener relacionado un producto.")
	private Producto producto;

	@NotNull(message = "Para realizar la equivalencia es necesaria una unidad de medida de origen.")
	private UnidadMedida uniMedOrigen;

	@NotNull(message = "Para realizar la equivalencia es necesaria una unidad de medida de destino.")
	private UnidadMedida uniMedDestino;

	@NotBlank(message = "El factor es necesario para realizar la equivalencia.")
	private String factor;

	/*
	 * Setters y getters
	 */
	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public UnidadMedida getUniMedOrigen() {
		return uniMedOrigen;
	}

	public void setUniMedOrigen(UnidadMedida uniMedOrigen) {
		this.uniMedOrigen = uniMedOrigen;
	}

	public UnidadMedida getUniMedDestino() {
		return uniMedDestino;
	}

	public void setUniMedDestino(UnidadMedida uniMedDestino) {
		this.uniMedDestino = uniMedDestino;
	}

	public String getFactor() {
		return factor;
	}

	public void setFactor(String factor) {
		this.factor = factor;
	}

}
