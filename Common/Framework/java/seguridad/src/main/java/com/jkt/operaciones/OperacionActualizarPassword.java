package com.jkt.operaciones;

import java.util.Map;

import org.joda.time.LocalDateTime;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.HistorialPassword;
import com.jkt.dominio.Usuario;

/**
 * Actualiza la password de un usuario
 *
 * @author Leonel Suarez - Jakarta SRL
 */
@OperacionBean
public class OperacionActualizarPassword extends Operation {

	public void execute(Map<String, Object> aParams) throws Exception {
		Usuario usuario=(Usuario) aParams.get("objeto");
		HistorialPassword historialPassword = new HistorialPassword();
		historialPassword.setPassword(usuario.getPassword().getBytes());
		historialPassword.setFechaVencimiento(LocalDateTime.now());
		
		usuario.addPassword(historialPassword);
		
		this.serviceRepository.save(usuario);
	}

}
