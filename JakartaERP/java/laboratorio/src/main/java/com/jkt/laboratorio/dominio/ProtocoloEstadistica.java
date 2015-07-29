package com.jkt.laboratorio.dominio;

import java.util.Date;

import lombok.Data;

@Data
public class ProtocoloEstadistica {
	
	private long idDeterminacion;
	private String descDeterminacion;
	private Date fechaCreacion;
	private double resultadoExpresion;
	
}
