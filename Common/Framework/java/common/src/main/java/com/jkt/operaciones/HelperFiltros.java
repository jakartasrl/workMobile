package com.jkt.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.ContenedorFiltros;
import com.jkt.dominio.Filtro;
import com.jkt.excepcion.JakartaException;

/**
 * Esta operacion recibe una lista de filtros, que puede ser vacia, para filtrar dada entidad.
 * 
 * @author ssuarez
 *
 */
public class HelperFiltros extends Helper {

	protected List recuperarObjetoUsandoKey(Map<String, Object> aParams) throws JakartaException {
		ContenedorFiltros containter = (ContenedorFiltros) aParams.get("objeto");
		
		String clase=containter.getClase();
		List<Filtro> filtros = containter.getFiltros();
		
		return filtros;
	}

}
