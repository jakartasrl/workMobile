package com.jkt.erp.articulos.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.erp.articulos.TipoProducto;
import com.jkt.erp.articulos.TipoProductoDet;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;

/**
 * <p>Operacion que recupera un determinado tipo de producto.</p>
 * 
 * <code>
 * 		<p>Cambios hechos por Leo sobre la clase creada por dani.</p>
 * 		<p>Le cambie la forma de recorrer, sin usar iteradores.La forma de recuperar el objeto, directamente usando un ID recibido desde el cliente.</p>
 *		<p>Agregada constante.</p>
 *		<p>Agregada validacion de entrada.</p>
 * </code>
 * 
 * 
 * @author DHS - Jakarta SRL
 * @author Leonel Suarez - Jakarta SRL
 * 
 * 
 */
public class TraerTipoProducto extends Operation {

	private static final String OID_TIPO = "oid_tipo".toUpperCase();
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(OID_TIPO));
		TipoProducto tipo = (TipoProducto) obtener(TipoProducto.class, (String)aParams.get(OID_TIPO));
		
		notificarObjecto(Notificacion.getNew("out1", tipo));
		
		List<TipoProductoDet> caracteristicas = tipo.getCaracteristicas();
		
		for (TipoProductoDet tipoProductoDet : caracteristicas) {
			notificarObjecto(Notificacion.getNew("out2", tipoProductoDet));
			
		}

	}

}
