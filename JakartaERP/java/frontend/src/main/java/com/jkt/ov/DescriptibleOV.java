package com.jkt.ov;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode(callSuper=true)
public class DescriptibleOV extends ObjectView {

	private String codigo;
	private String descripcion;

	
	public DescriptibleOV(String descripcion){
		this.descripcion=descripcion;
	}
	public DescriptibleOV(){
	}
}
