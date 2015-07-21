package com.jkt.laboratorio.dominio;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.CaracteristicaProducto;

/**
 * Representa los valores que pueden asumir los resultados de una Determinación.<br>
 * Se utiliza para validar el valor ingresado en la carga de los protocolos del Laboratorio.<br>
 * Ejemplo: Para transformadores de mas de 60kv:<br>
 * Para la Determinación CONTENIDO DE INHIBIDOR(%) : El valor válido está en un rango de 1 a 6.
 */
@Data
@EqualsAndHashCode(callSuper=true)
public class ValorEsperado extends PersistentEntity {

//	private Metodo metodo;
	private CaracteristicaProducto caracteristica;
	private double valorDesde;
	private double valorHasta;
	private String limite;
	
}
