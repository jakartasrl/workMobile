package com.jkt.ov;

import lombok.Data;
import com.jkt.varios.dominio.Pais;
import com.jkt.varios.dominio.Provincia;

@Data
public class DireccionOV extends DescriptibleOV {
	
	private String nombre = "";
	private String direccion;
	private String codigoPostal;
	private String localidad;
	private Provincia provincia;
	private DescriptibleOV pais;	
	private String fax;
	private String mail;

}
