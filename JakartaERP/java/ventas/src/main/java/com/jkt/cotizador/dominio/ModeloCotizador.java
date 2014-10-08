package com.jkt.cotizador.dominio;

import com.jkt.dominio.Descriptible;

/**
 * <p>Un modelo de cotizador será para facilitar la tarea a los empleados que se encargan de cotizar.</p>
 * <p>Si se deben cotizar en diferentes dimnensiones, se pueden usar diferentes modelos de cotizador.</p>
 * <p>Por ejemplo, para un cambio de aceite de un transfo, será un cotizador pequeño, con no tantos datos.</p>
 * <p>En cambio, para presupuestar la venta de un transformador a medida, se necesitaran muchos datos, caracteristicas y demas.</p>
 * 
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ModeloCotizador extends Descriptible {

	private TituloModeloCotizador titulo;

	public TituloModeloCotizador getTitulo() {
		return titulo;
	}

	public void setTitulo(TituloModeloCotizador titulo) {
		this.titulo = titulo;
	}
	
}
