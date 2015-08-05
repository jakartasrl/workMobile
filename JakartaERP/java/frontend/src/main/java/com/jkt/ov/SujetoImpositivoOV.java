package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;
import lombok.Data;
import com.jkt.erp.varios.InscripcionImpositiva;

@Data
public class SujetoImpositivoOV extends DescriptibleOV {
	
	private ClienteOV cliente;
	private String razonSocial;
	private boolean personaJuridica;
	private DireccionOV direccionLegal;
	private boolean local;
	private String cuit;
	private List<InscripcionImpositiva> inscripcionesImpositivas=new ArrayList<InscripcionImpositiva>();

}
