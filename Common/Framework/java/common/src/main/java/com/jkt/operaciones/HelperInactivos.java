package com.jkt.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Filtro;

public class HelperInactivos extends Helper {

	protected List recuperarObjetoUsandoKey(Map<String, Object> aParams) {
		Filtro filtro = crearFiltro("activo","false","igual","boolean");
		return Arrays.asList(filtro);
	}
}
