package com.jkt.erp.articulos;

import com.jkt.dominio.PersistentEntity;

/**
 * El detalle de un tipo de producto.
 * El detalle del tipo de producto
 * 
 * El detalle tiene metadata de como armar la descripcion del producto, y ademas una lista de caracteristicas.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TipoProductoDet extends PersistentEntity {

	private TipoProducto tipoProducto;
	
	private CaracteristicaProducto caracteristica;
	
	private boolean obligatorio;
	private boolean armaCodigo;
	private boolean armaDescripcion;
	private int orden;

	public TipoProducto getTipoProducto() {
		return tipoProducto;
	}

	public void setTipoProducto(TipoProducto tipoProducto) {
		this.tipoProducto = tipoProducto;
	}

	public CaracteristicaProducto getCaracteristica() {
		return caracteristica;
	}

	public void setCaracteristica(CaracteristicaProducto caracteristica) {
		this.caracteristica = caracteristica;
	}

	public boolean isObligatorio() {
		return obligatorio;
	}

	public void setObligatorio(boolean obligatorio) {
		this.obligatorio = obligatorio;
	}

	public boolean isArmaCodigo() {
		return armaCodigo;
	}

	public void setArmaCodigo(boolean armaCodigo) {
		this.armaCodigo = armaCodigo;
	}

	public boolean isArmaDescripcion() {
		return armaDescripcion;
	}

	public void setArmaDescripcion(boolean armaDescripcion) {
		this.armaDescripcion = armaDescripcion;
	}

	public int getOrden() {
		return orden;
	}

	public void setOrden(int orden) {
		this.orden = orden;
	}

}
