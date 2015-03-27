package com.jkt.laboratorio.operaciones;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.jkt.dominio.Configuracion;
import com.jkt.operaciones.Operation;

/**
 * Recupera los valores de la tabla de marca
 * 
 * @author erubino
 *
 */
public class TraerMarcasParaEquipo extends Operation {

	private static final String KEY_TABLA_MARCAS = "tablaMarcas";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		//1 traer el parametro de la tabla de configuracion
		Configuracion config = obtenerConfiguracion(KEY_TABLA_MARCAS);
		long idDeTabla = Long.valueOf(config.getValorNumero());
		
		//ejecutar consulta filtrando por el id de la tabla
		Query query = crearHQL("from ValoresTablas as valores where valores.tablaValoresCaract.id = :idParametro");
		query.setParameter("idParametro", idDeTabla);
		List list = query.list();
		
		//mostrar objetos recuperados
		notificarObjeto("", list);
		
	}

}
