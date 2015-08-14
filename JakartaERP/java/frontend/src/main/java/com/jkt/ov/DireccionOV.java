package com.jkt.ov;

import lombok.Data;

@Data
public class DireccionOV extends DescriptibleOV {
	
	private String nombre = "";
	private String direccion;
	private String codigoPostal;
	private String localidad;
	private ProvinciaOV provincia;
	private DescriptibleOV pais;	
	private String fax;
	private String mail;

}
