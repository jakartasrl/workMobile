package com.jkt.erp.articulos;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.Descriptible;

/**
 * <p>Un tipo de producto puede ser una camisa, una puerta.</p>
 * 
 * @author ssuarez
 *
 */
public class TipoProducto extends Descriptible {

//	private Producto producto;
	private List<TipoProductoDet> caracteristicas = new ArrayList<TipoProductoDet>();

	protected void setCaracteristicas(List<TipoProductoDet> caracteristicas) {
		this.caracteristicas = caracteristicas;
	}

	public List<TipoProductoDet> getCaracteristicas() {
		return caracteristicas;
	}

	/*
	 * Metodos de ayuda para la coleccion de caracteristicas
	 */
	public void addCaracteristica(TipoProductoDet aCarac) {
		if (!caracteristicas.contains(aCarac)) {
			aCarac.setTipoProducto(this);
			caracteristicas.add(aCarac);
		}
	}

	public void deleteCaracteristica(TipoProductoDet aCarac) {
		aCarac.setActivo(false);
	}

}
