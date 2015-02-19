package com.jkt.dominio;

import javax.validation.constraints.NotNull;

import com.jkt.erp.articulos.Producto;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.varios.dominio.Moneda;

/**
 * <p>Detalle de la lista de precio.</p>
 * <p>Cada detalle es una referencia a una determinacion o a un producto, y su costo.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ListaPrecioDetalle extends PersistentEntity {


//	Transiente!!!
	
	/**
	 * Sirve para enviar como item vacio, ya que hay ocaciones en que debe ir en cero para guardar como nueva relacion, por ejemplo, en los items de un presupuesto.
	 * Si le mando el id de la entidad, se toma como una actualización de la entidad Precio, con lo cual es incorrecto!
	 */
	private String fakeId="0";
	
	public String getFakeId() {
		return fakeId;
	}

	public void setFakeId(String fakeId) {
		this.fakeId = fakeId;
	}

	public Moneda getMoneda() {
		return moneda;
	}

	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}

	@NotNull(message="No puede existir un detalle de lista de precio sin la lista de precio propiamente dicha.")
	private ListaPrecios listaPrecios;
	
	// campo transiente
	private Moneda moneda;
	
	private double precio;
	
	/*
	 * FIXME
	 * Por el momento defino las relaciones en separado, pero deberia ver de usar o una super clase, o polimorfismo
	 * para poder mapear estas diferentes entidades con solamente un campo.
	 */
	private Determinacion determinacion;
	private Producto producto;
	
	
	public ListaPrecios getListaPrecios() {
		return listaPrecios;
	}

	public void setListaPrecios(ListaPrecios listaPrecios) {
		this.listaPrecios = listaPrecios;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public Determinacion getDeterminacion() {
		return determinacion;
	}

	public void setDeterminacion(Determinacion determinacion) {
		this.determinacion = determinacion;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

}
