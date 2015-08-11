package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ImpuestoOV extends DescriptibleOV {
	
	private List<CategoriaImpuestoOV> categorias = new ArrayList<CategoriaImpuestoOV>();
	private String comportamiento;

}
