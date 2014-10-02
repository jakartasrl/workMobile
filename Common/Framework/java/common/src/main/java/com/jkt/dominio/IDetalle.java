package com.jkt.dominio;

/**
 * <p>La interface IDetalle indica que la clase que lo implementa pertenece al detalle en una relacion maestro-detalle.</p>
 * <p>Para ser mas claros, definimos un ejemplo: En la relacion Condicion de pago, y Detalle de condicion de pago, la 
 * clase detalle de condicion de pago deberá implementar esta interface</p>
 * <p>En la relacion Pais y provincia, se puede tomar como maestro el Pais, y como detalle la Provincia</p>
 * 
 * <p><b>¿Para que usar esta interface?</b></p>
 * <p>Se utilizará para que el detalle brinde información acerca de quien es su padre en la relacion maestro-detalle.
 * El ejemplo mas claro es el del HelperCompuesto el cual utiliza la relación dicha de maestro-detalle para filtrar utilizando
 * el identificador del maestro, de este modo, siguiendo a modo de ejemplos, se podrian recuperar todas las provincias
 * de determinado pais.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public interface IDetalle {

	/**
	 * <p>Retorna el nombre del atributo que hace referencia a su maestro.</p>
	 * <p>Por ejemplo, en la entidad Provincia, este metodo retornará "pais".</p>
	 * <p>En la entidad Detalle, que tiene como maestro a Maestro, pero con el nombre de atributo, esteEsElMaestro,
	 * deberá retornar, justamente el nombre exacto de la variable, en este caso 'esteEsElMaestro'</p>
	 * 
	 * @return El nombre en formato de String del atributo (nombre de la variable) que hace referencia a su maestro.
	 *  
	 */
	String getNombreDeMaestro();
	
}
