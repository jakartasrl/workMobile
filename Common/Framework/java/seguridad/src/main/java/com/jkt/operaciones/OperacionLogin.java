package com.jkt.operaciones;

import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.Login;
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

	private static final String CAMPO_USUARIO = "codigo";

	public void execute(Map<String, Object> aParams) throws Exception {
		Login login=(Login) aParams.get("login");
		
		Usuario user = (Usuario) this.serviceRepository.getUniqueByProperty(Usuario.class, CAMPO_USUARIO, login.getUsuario());
		if (user==null) {
//			this.notificarObjecto(Notificacion.getNew("resultado", new Error("Problemas al acceder al sistema")));
			throw new LoginException();
//			throw new RuntimeException("dakljjkldsa");
//			return;
		} 
		
		/*
		 * TODO Persistir el objeto login en la base junto a un ID autogenerado, que sera utilizado como sesion.
		 */
		
		log.info(login.getUsuario()+" "+login.getPassword());
		this.notificarObjecto(Notificacion.getNew("resultado", user));
		
	}

}
