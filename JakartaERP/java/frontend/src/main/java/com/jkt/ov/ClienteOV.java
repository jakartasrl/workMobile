package com.jkt.ov;

import org.neo4j.cypher.internal.helpers.Converge.iterateUntilConverged;

import com.jkt.erp.varios.Cliente;
import com.jkt.view.ObjectView;

/**
 * ObjectView para la entidad {@link Cliente}.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ClienteOV extends ObjectView {

	
	private String codigo;
	private String telefono;
	private String fax;
	private String mail;
	private String nroProveedor;

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getNroProveedor() {
		return nroProveedor;
	}

	public void setNroProveedor(String nroProveedor) {
		this.nroProveedor = nroProveedor;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

}
