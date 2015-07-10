package com.jkt.ov;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode(of={"id"})
public class ContactoOV extends ObjectView {

	private String apellidoYNombre;
	private String telefono;
	private String telefonoAlternativo;
	private String celular;
	private String mail;
	private String tratamiento;

	private long idTipoContacto;
	private long clienteSucursalId;
	private String descripcionTipo;
	
}
