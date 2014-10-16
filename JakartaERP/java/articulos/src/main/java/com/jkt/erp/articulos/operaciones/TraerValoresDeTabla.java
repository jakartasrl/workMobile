package com.jkt.erp.articulos.operaciones;

import java.util.Map;

import com.jkt.erp.articulos.CaracteristicaProducto;
import com.jkt.erp.articulos.TablaValoresCaracProd;
import com.jkt.erp.articulos.ValoresTablas;
import com.jkt.operaciones.Operation;

/**
 * 
 * 
 * TODO Volar esta clase xq se va a usar el helper compuesto.
 * 
 * 
 * <p>Operacion que recibe el identificador de una tabla de valores y retorna todos sus valores.</p>
 * 
 * @see ValoresTablas
 * @see TablaValoresCaracProd
 * @see CaracteristicaProducto
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerValoresDeTabla extends Operation {

	private static final String WRITER_VALORES = "valores";
	private static final String OID = "oid".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(OID));
		
		TablaValoresCaracProd tabla = (TablaValoresCaracProd) obtener(TablaValoresCaracProd.class, (String)aParams.get(OID));
		
		notificarObjetos(WRITER_VALORES, tabla.getValoresDeTabla());
		
//		for (ValoresTablas valoresTablas : tabla.getValoresDeTabla()) {
//			notificarObjecto(WRITER_VALORES, valoresTablas);
//		}
	}

}
