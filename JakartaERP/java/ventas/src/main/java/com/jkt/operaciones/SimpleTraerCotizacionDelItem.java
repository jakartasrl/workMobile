package com.jkt.operaciones;

import java.util.Map;

import com.jkt.cotizador.operaciones.AbstractRecuperarModelo;
import com.jkt.dominio.CotizacionDet;

/**
 * Esta operacion es una de las mas importantes en cuanto a la cotizacion.
 * Recupera la cotizacin de un item determinado en forma de arbol, utilizando su modelo de cotizacion asignado.
 * Muestra cada uno de los detalles, y en cada detalle, tiene logicas de recupero de precio desde diferentes fuentes, monedas desde diferentes fuentas, y demas.
 * TODO armar un documento con esta informacion por favor.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class SimpleTraerCotizacionDelItem extends AbstractRecuperarModelo {

	private static final String COTIZADOR_WRITER = "cotizador";
	private static final String ITEM_WRITER = "item";

	private CotizacionDet item = new CotizacionDet();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
	
		validarEntrada(aParams.get(OID));
	
		item=(CotizacionDet) obtener(CotizacionDet.class, (String)aParams.get(OID));
		
		if (tipoCliente.equals(CLIENTE_DELPHI)){
			notificarObjeto(ITEM_WRITER, item);
			notificarObjeto(COTIZADOR_WRITER, item.getCotizador());
		}
		
		notificarObjeto("", item);

	}
	

}