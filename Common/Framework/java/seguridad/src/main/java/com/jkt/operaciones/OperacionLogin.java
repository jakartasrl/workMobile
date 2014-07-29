package com.jkt.operaciones;

import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.Usuario;
import com.jkt.exception.LoginException;
import com.jkt.transformers.Notificacion;

/**
 * Operacion que se encarga de manejar los accesos al sistema.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
@OperacionBean
public class OperacionLogin extends Operation {

	/**
	 * Es el campo por el cual se filtra al usuario. Por protocolo, el codigo será igual al username, solamente en esta entidad.
	 */
	private static final String CAMPO_USUARIO = "codigo";

	public void execute(Map<String, Object> aParams) throws Exception {
//		Login login=(Login) aParams.get("login");
		String usuario=(String) aParams.get("usuario");
		String password=(String) aParams.get("password");
		
		if (usuario.isEmpty() || password.isEmpty()) {
			throw new LoginException();
		}
		
		Usuario user = (Usuario) this.serviceRepository.getUniqueByProperty(Usuario.class, CAMPO_USUARIO, usuario);
		if (user==null) {
			throw new LoginException();
		} 
		
		/*
		 * TODO Persistir el objeto login en la base junto a un ID autogenerado, que sera utilizado como sesion.
		 */
		
		log.info(usuario+" "+password);
		this.notificarObjecto(Notificacion.getNew("resultado", user));
		
	}

}
