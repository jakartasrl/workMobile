package com.jkt.ov;

import lombok.Data;

import com.jkt.presupuesto.dominio.Nota;
import com.jkt.view.ObjectView;

/**
 * {@link ObjectView} from entity Note ({@link Nota})
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class NotaOV extends DescriptibleOV {

	private String adicional;
	private String codigoActividad;

}
