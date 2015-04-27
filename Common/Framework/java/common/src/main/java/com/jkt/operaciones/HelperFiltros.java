package com.jkt.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.ContenedorFiltros;
import com.jkt.dominio.Filtro;
import com.jkt.excepcion.JakartaException;



public class HelperFiltros extends Helper {

	protected List recuperarObjetoUsandoKey(Map<String, Object> aParams) throws JakartaException {
		
//		validarEntrada(aParams.get("FILTROS"));
//		
//		aParams.get("FILTROS");
		
		ContenedorFiltros containter = (ContenedorFiltros) aParams.get("objeto");
		
		String clase=containter.getClase();
		List<Filtro> filtros = containter.getFiltros();
		
		return filtros;
//		return Arrays.asList(crearFiltro("activo","true","igual","boolean"));
	}

}
