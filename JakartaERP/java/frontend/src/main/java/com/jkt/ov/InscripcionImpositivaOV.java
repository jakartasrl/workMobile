package com.jkt.ov;

import java.util.Date;
import lombok.Data;

@Data
public class InscripcionImpositivaOV extends DescriptibleOV {
	
	private SujetoImpositivoOV sujetoImpositivo;
	
	private ImpuestoOV impuesto;
	private String codImpuesto;
	private String descImpuesto;
	
	private CategoriaImpuestoOV categoria;
	private String codCategoria;
	private String descCategoria;
	
	private String numero;
	
	private Date fechaInscripcion;
	
	private Date fechaVigencia;
	
}
