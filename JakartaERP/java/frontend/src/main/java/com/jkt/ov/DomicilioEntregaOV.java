package com.jkt.ov;

import lombok.Data;

@Data
public class DomicilioEntregaOV extends DescriptibleOV {
	
	private int nroDomicilio;
	
	private String direccion;
	private String localidad;
	private String codigoPostal;
	
	private ProvinciaOV provincia = new ProvinciaOV();
	private long idProvincia;
	private String codProvincia;
	private String descProvincia;
	
	private String horariosEntrega;
	private String telefono;
	
}
