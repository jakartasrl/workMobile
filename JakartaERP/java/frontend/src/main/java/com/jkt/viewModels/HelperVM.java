package com.jkt.viewModels;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.ov.ClienteOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.SucursalOV;

/**
 * ViewModel para los helpers, en este caso solamente de los Presupuestos.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class HelperVM {

	private String titulo = "";
	private String id = "ID";
	private String codigo = "Codigo";
	private String descripcion = "Descripción";

	private List<DescriptibleOV> coleccion = new ArrayList<DescriptibleOV>();

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public List<DescriptibleOV> getColeccion() {
		return coleccion;
	}

	public void setColeccion(List<DescriptibleOV> coleccion) {
		this.coleccion = coleccion;
	}

	@Init
	public void init(@ExecutionArgParam("coleccion") List<DescriptibleOV> coleccion,@ExecutionArgParam("codigo") String codigo){
		this.coleccion=coleccion;
		this.codigo=codigo;
	}
	
	@Command
	public void cerrarModal(@BindingParam("window")  Window x){
		x.detach();
	}

	
}