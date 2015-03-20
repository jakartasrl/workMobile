package com.jkt.ov;

import lombok.Data;

import com.jkt.erp.varios.Cliente;
import com.jkt.view.ObjectView;

/**
 * ObjectView para la entidad {@link Cliente}.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class ClienteOV extends ObjectView {

	private String codigo;
	private String telefono;
	private String fax;
	private String mail;
	private String nroProveedor;

}
