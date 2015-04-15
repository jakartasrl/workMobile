package com.jkt.operaciones;

import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.HistorialPassword;
import com.jkt.dominio.Usuario;
import com.jkt.exception.LoginException;

/**
 * Operacion que se encarga de manejar los accesos al sistema.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
@OperacionBean
public class Login extends Operation {

	/**
	 * Es el campo por el cual se filtra al usuario. Por protocolo, el codigo ser� igual al username, solamente en esta entidad.
	 */
	private static final String CAMPO_USUARIO = "codigo";

	public void execute(Map<String, Object> aParams) throws Exception {
//		Login login=(Login) aParams.get("login");
		String usuario=(String) aParams.get("USUARIO");
		String password=(String) aParams.get("PASSWORD");
		
		if (!validarConsistenciaDelCampo(usuario) || !validarConsistenciaDelCampo(password)) {
			throw new LoginException("Es necesario que complete los campos.");
		}
		
		Usuario user = (Usuario) serviceRepository.getUniqueByProperty(Usuario.class, CAMPO_USUARIO, usuario);
		if (user==null) {
			throw new LoginException("Los datos de ingreso son erroneos. Verifique usuario y/o password.");
		} 
		
		//Validando la password.
		HistorialPassword ultimaPassword = user.getUltimaPassword();
		if (ultimaPassword==null || !ultimaPassword.compararPasswords(password)){
			throw new LoginException("Los datos de ingreso son erroneos. Verifique usuario y/o password.");
		}
//		
		/*
		 * TODO Persistir el objeto login en la base junto a un ID autogenerado, que sera utilizado como sesion.
		 */
		
		log.info(usuario+" "+password);
		
		notificarObjeto("resultado", user);
		
	}
	
	private boolean validarConsistenciaDelCampo(String value){
		if (value==null || value.isEmpty()) {
			return false;
		}
		return true;
	}

}
