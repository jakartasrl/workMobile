package com.jkt.ov;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class PropiedadMatricialOV extends ObjectView {
	
	private String nombre; 
	private long id_valor_primario; 
	private long id_valor_secundario; 
	private long  id_valor_terciario; 

}
