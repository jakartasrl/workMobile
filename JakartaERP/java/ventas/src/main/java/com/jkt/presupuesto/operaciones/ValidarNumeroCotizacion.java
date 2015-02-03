package com.jkt.presupuesto.operaciones;

import java.util.Map;

import org.hibernate.Query;

import com.jkt.dominio.Container;
import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;

/**
 * esta operacion debe ser borrada una vez implementado el validador de campos custom.
 * FIXME TODO
 * 
 * 
 * @author leonel
 *
 */
public class ValidarNumeroCotizacion extends Operation {

	private static final String WRITER = "resultado";
	private static final String CODIGO = "codigo".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(CODIGO));
	
		String nroCotizacion = (String) aParams.get(CODIGO);
		
		String hql="select c.id from Cotizacion c where c.nro= :numero";
		Query qHQL = crearHQL(hql);
		qHQL.setParameter("numero", nroCotizacion);
		Long idRecupeado = (Long) qHQL.uniqueResult();
		
		if (idRecupeado==null) {
			throw new JakartaException("No existe la cotización solicitada.");
		}
		
		notificarObjeto(WRITER, new Container(String.valueOf(idRecupeado)));
		
	}

}
