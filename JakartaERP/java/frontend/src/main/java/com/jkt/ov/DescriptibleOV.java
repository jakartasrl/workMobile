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

	/*
	 * Campos para helps
	 */
	private String campoAdicional1;
	private String campoAdicional2;
	
	public int getCantidad(){
		return 3;
	}
	
	public DescriptibleOV(String codigo){
		this.codigo=codigo;
	}

	public DescriptibleOV(String codigo, String descripcion){
		this.codigo=codigo;
		this.descripcion=descripcion;
	}
	
	public DescriptibleOV(){
	}
	
	public List obtenerFiltro(){
		ArrayList<FiltroOV> filtros = new ArrayList<FiltroOV>();
		filtros.add(new FiltroOV("codigo", codigo, "like", "string"));
		filtros.add(new FiltroOV("descripcion", descripcion, "like", "string"));
		return filtros;
	}

	@Override
	public String getCampoClave() {
		return "codigo";
	}

}
