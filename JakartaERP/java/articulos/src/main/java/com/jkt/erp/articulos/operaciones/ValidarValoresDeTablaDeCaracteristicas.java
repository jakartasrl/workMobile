package com.jkt.erp.articulos.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.constantes.TiposDeDato;
import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.CaracteristicaProducto;
import com.jkt.erp.articulos.ValoresTablas;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionException;
import com.jkt.operaciones.Validar;

/**
 * <p>Esta operacion valida el tipo de dato ingresado para determinada caracteristica.
 * La caracteristica puede tener asociado un dato primitivo, o un valor de una tabla de valores.
 * Sea cual fuere el caso, se realiza una validacion de consistencia.
 * </p>
 * 
 * <p>
 * Los parametros recibidos son el valor ingresado para la caracteristica, que se extrae del valor <b>'CODIGO'</b> recibido desde el cliente.
 * Ademas se recibe el identificador de la caracteristica para poder saber que tipo es necesario(primitivo o valor de tabla).Este valor de toma desde el parametro <b>OIDENTIDADMAESTRA</b>
 * </p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ValidarValoresDeTablaDeCaracteristicas extends Validar {

	@Override
	protected PersistentEntity manejarFiltros(Map<String, Object> aParams) throws Exception {
		
		String valor=(String) aParams.get(CODIGO_FIELD);
		String identificadorDeCaracteristica=(String) aParams.get(OID_MAESTRO_FIELD);

		PersistentEntity objectRetrieved = obtener(CaracteristicaProducto.class, identificadorDeCaracteristica);
		
		CaracteristicaProducto caracteristicaProducto=(CaracteristicaProducto) objectRetrieved;
		
		String tipoDato = caracteristicaProducto.getTipoDato();
		if (TiposDeDato.TABLA_VALORES_TYPE.equals(tipoDato)) {
			List<ValoresTablas> valores = caracteristicaProducto.getTabla().getValoresDeTabla();
			boolean existeElValor=false;
			for (ValoresTablas valorTabla : valores) {
				if (valorTabla.getCodigo().equals(valor)) {
					//notificar a la salida...
					notificarObjeto("resultado", valorTabla);
					existeElValor=true;
					break;
					//y finalizar la rutina
				}
			}
			if (!existeElValor) {
				throw new JakartaException(String.format("No existe el valor '%s' en la tabla de valores de la caracteristica %s(%s).", valor, caracteristicaProducto.getCodigo(), caracteristicaProducto.getDescripcion()));
			}
		}else if (TiposDeDato.STRING_TYPE.equals(tipoDato)) {
			if (valor.trim().isEmpty()) {
				throw new JakartaException("El valor no debe ser vacio.");
			}
		}else if (TiposDeDato.INTEGER_TYPE.equals(tipoDato)) {
			try{
				Integer.valueOf(valor);
			}catch(NumberFormatException e){
				throw new JakartaException("El valor debe ser un entero.");
			}
		}else if (TiposDeDato.DOUBLE_TYPE.equals(tipoDato)) {
			try{
				Double.valueOf(valor);
			}catch(NumberFormatException e){
				throw new JakartaException("El valor debe ser de tipo 'double'.");
			}
		}else if (TiposDeDato.BOOLEAN_TYPE.equals(tipoDato)) {
			if (valor.toLowerCase().equals("true") || valor.toLowerCase().equals("false")) {
				//ok
			}else{
				throw new JakartaException("El valor booleano debe ser 'true' o 'false'.");
			}
		}
		
		return null;
	}

	@Override
	protected void manejoDeExistencia(PersistentEntity entity,String className, String codigo) throws ValidacionException {
		//No hacer nada ac�.
		
		/*
		 * No se hace nada ac�, xq el flujo normal de las operaciones de validar son, encontrar la entidad y luego manejarla por existencia o inexistencia.
		 * Como esta operacion tiene un manejo particular (si es primitivo no mostrar, pero si es tabla mostrar en la salida) se decidio pisar el metodo que maneja
		 * existencia, y notificar en el metodo manejar filtros.
		 * Si en algun momento se da otro caso particular, se ver� la forma de hacer algo mas generico, como algun flag para mostrar o no datos en la salida, sea primitivo o no.
		 * Ver la clase Validar para entender mas de xq se pisa este metodo.
		 * 
		 * Basicamente el problema es que los metodos de manejarExistencia/Inexistencia notifican objetos si no son nulo.
		 * Cuando la validacion es sobre un tipo primitivo, no se pueda asi xq si mandar un objeto N para que no sea nulo el objeto a notificar, x eso se decidio hacer esto.
		 * 
		 */
	}

}
