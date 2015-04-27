package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import org.neo4j.cypher.internal.compiler.v2_1.functions.E;

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
	
	public List obtenerFiltro(){
		ArrayList<FiltroOV> filtros = new ArrayList<FiltroOV>();
		filtros.add(new FiltroOV("codigo", codigo, "like", "string"));
		return filtros;
	}
	
	
}
