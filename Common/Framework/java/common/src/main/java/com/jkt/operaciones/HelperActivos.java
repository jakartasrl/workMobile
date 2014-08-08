package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Filtro;

public class HelperActivos extends Helper {

	protected List recuperarObjetoUsandoKey(Map<String, Object> aParams) {
		return Arrays.asList(crearFiltro("activo","true","igual","boolean"));
	}

}
