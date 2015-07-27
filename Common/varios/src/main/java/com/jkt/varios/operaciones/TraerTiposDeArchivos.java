package com.jkt.varios.operaciones;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Descriptible;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Especificacion;
import com.jkt.varios.dominio.Especificacion.Categoria;

/**
 * Retorna una lista de categorias disponibles para generar un arbol de archivos
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerTiposDeArchivos extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {

		Categoria[] values = Especificacion.Categoria.values();
		
		List<Descriptible> categorias = new ArrayList<Descriptible>();
		for (Categoria categoria : values) {
			Descriptible c= new Descriptible();
			c.setId(categoria.getId());
			c.setDescripcion(categoria.getDescripcion());
			categorias.add(c);
		}
		
		notificarObjeto("", categorias);
		
	}

}
