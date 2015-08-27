package com.jkt.dominio;

import com.jkt.dominio.PersistentEntity;

import lombok.Data;

@Data
public class JakartaERP extends PersistentEntity {

	private String ip;
	private Integer port;
	private String aplicacion;
	private String servlet;
	private String usuario;
	private String password;
	private String ipBD;
	private String portBD;
	private String userBD;
	private String passBD;
	private String sid;
	
}
