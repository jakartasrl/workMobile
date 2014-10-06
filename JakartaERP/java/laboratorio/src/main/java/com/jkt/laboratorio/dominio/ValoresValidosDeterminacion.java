package com.jkt.laboratorio.dominio;

import com.jkt.dominio.Descriptible;
import com.jkt.erp.articulos.CaracteristicaProducto;

/**
 * Representa los valores que pueden asumir los resultados de una Determinación.<br>
 * Se utiliza para validar el valor ingresado en la carga de los protocolos del Laboratorio.<br>
 * Ejemplo: Para transformadores de mas de 60kv:<br>
 * Para la Determinación CONTENIDO DE INHIBIDOR(%) : El valor válido está en un rango de 1 a 6.
 */
public class ValoresValidosDeterminacion extends Descriptible {

	private static final long serialVersionUID = 1L;
	
	/**
	 * Determinación a la que valida.
	 */
	private Determinacion determinacion;

	/**
	 * Característica del Producto que define la apertura de la validación.
	 */
	private CaracteristicaProducto caracteristica;

	/**
	 * Cota inferior del valor del compoonente.
	 */
	private double valorDesde;

	/**
	 * Cota superior del valor del componente.
	 */
	private double valorHasta;

	/**
	 * Valor mínimo que puede valer el resultado de una Determinación.
	 */
	private double limiteInferior;

	/**
	 * Valor máximo que puede valer el resultado de una Determinación.
	 */
	private double limiteSuperior;

	/**
	 * Tabla donde se valida el resultado de la Determinación.
	 */
	private TablaValidacionDeter tablaValidacion;

	/* -------------------------------------- Getters & Setters -------------------------------------- */	
	public Determinacion getDeterminacion() {
		return determinacion;
	}

	
	public void setDeterminacion(Determinacion determinacion) {
		this.determinacion = determinacion;
	}

	
	public CaracteristicaProducto getCaracteristica() {
		return caracteristica;
	}

	
	public void setCaracteristica(CaracteristicaProducto caracteristica) {
		this.caracteristica = caracteristica;
	}

	
	public double getValorDesde() {
		return valorDesde;
	}

	
	public void setValorDesde(double valorDesde) {
		this.valorDesde = valorDesde;
	}

	
	public double getValorHasta() {
		return valorHasta;
	}

	
	public void setValorHasta(double valorHasta) {
		this.valorHasta = valorHasta;
	}

	
	public double getLimiteInferior() {
		return limiteInferior;
	}

	
	public void setLimiteInferior(double limiteInferior) {
		this.limiteInferior = limiteInferior;
	}

	
	public double getLimiteSuperior() {
		return limiteSuperior;
	}

	
	public void setLimiteSuperior(double limiteSuperior) {
		this.limiteSuperior = limiteSuperior;
	}

	
	public TablaValidacionDeter getTablaValidacion() {
		return tablaValidacion;
	}

	
	public void setTablaValidacion(TablaValidacionDeter tablaValidacion) {
		this.tablaValidacion = tablaValidacion;
	}

}
