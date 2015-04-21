package com.jkt.ov;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode(of={"codigo"})
public class DescriptibleOV extends ObjectView {

	private String codigo;
	private String descripcion;

	
	public DescriptibleOV(String descripcion){
		this.descripcion=descripcion;
	}
	public DescriptibleOV(){
	}
}
