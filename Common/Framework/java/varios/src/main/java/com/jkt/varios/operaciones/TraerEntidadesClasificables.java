package com.jkt.varios.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.Container;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;

@OperacionBean
public class TraerEntidadesClasificables extends Operation {

	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		List<String> entidadesClasificables = Arrays.asList(new String[]{"empresa","usuario","vendedor"});
		for (String valor : entidadesClasificables) {
			notificarObjecto(Notificacion.getNew("entidades", new Container(valor)));
		}

		//Recuperar de algun lado todas las clases. Es buena tener un repositorio de clases, es decir, .class para no generar estructuras
		//Puedo utilizar la factory para esto
		
		//voy a recorrer la lista de clases registradas. deberian ser TODAS, y si no esta, loguear que la tiene que registrar!!!
		
//		IClasificable.class.isAssignableFrom(Clasificador.class);
		
	}

}
