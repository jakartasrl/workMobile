package com.jkt.ov;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.dominio.Actividad;
import com.jkt.presupuesto.dominio.Nota;
import com.jkt.view.ObjectView;

/**
 * {@link ObjectView} from entity Note ({@link Nota})
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
@EqualsAndHashCode(callSuper=true)
public class NotaOV extends DescriptibleOV {

	private String adicional;
	private String codigoActividad;
	private String codigoSubActividad;
	private Boolean checked = Boolean.FALSE;
	
	private long idActividad;
	private long idSubActividad;
		
	DescriptibleOV actividad = new DescriptibleOV();
	DescriptibleOV subActividad = new DescriptibleOV();
	
}
