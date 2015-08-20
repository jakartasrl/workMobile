package com.jkt.facturacion.dominio;

import lombok.Data;

/**
 * @author mmunin
 *
 */
@Data
public class LoginDTO {

	private String certificado;
	private String session;
	private String sucursal;
	private String empleado;

}
