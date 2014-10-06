package com.jkt.laboratorio.operaciones;

import java.util.Map;
import com.jkt.laboratorio.dominio.Analisis;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;

/**
 * Representa la operación de recuperar un Análisis y sus Determinaciones.
 */
public class TraerAnalisis extends Operation {

	@Override
	public void execute(Map<String, Object> params) throws Exception {
		// Recuperar el objeto Analisis
		Analisis analisis = (Analisis) params.get("Objeto");
		// Notificar
		this.notificarObjecto(Notificacion.getNew("out1", analisis));

		// Notificar las determinaciones del Analisis
		for (Determinacion determinacion : analisis.getListaDeterminaciones()) {
			this.notificarObjecto(Notificacion.getNew("out2", determinacion));
		}
	}

}
