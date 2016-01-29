package com.jkt.dto;

import java.util.ArrayList;
import java.util.List;

import com.jkt.ov.DescriptibleOV;

import lombok.Data;

@Data
public class ClienteOV {
	
	private String codigoBarra;
	private String codigo;
	private String descripcion;
	
	private List<DescriptibleOV> articulos = new ArrayList<DescriptibleOV>();

}
