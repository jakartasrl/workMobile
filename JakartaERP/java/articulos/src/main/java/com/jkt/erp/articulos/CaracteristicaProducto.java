package com.jkt.erp.articulos;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.dominio.Descriptible;

/**
 * <p>Una caracteristica de producto puede ser una longitud, un color, un tipo de tela, un tipo de metal, ancho, largo, peso.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
@EqualsAndHashCode(callSuper=true)
public class CaracteristicaProducto extends Descriptible {

	private String tipoDato;//Del mismo valor que la clase TiposDeDato.
	private TablaValoresCaracProd tabla;

}
