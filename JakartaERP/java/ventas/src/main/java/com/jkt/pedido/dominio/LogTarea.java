package com.jkt.pedido.dominio;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.dominio.PersistentEntity;

@Data
@EqualsAndHashCode(callSuper=false)
public class LogTarea extends PersistentEntity {

	private Date fecha;
	private String log;
	private long idUsuario; //Con esto recupero tambien el nombre de usuario.
	private String usuario;
	
}