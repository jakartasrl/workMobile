package com.jkt.viewModels;

import java.util.ArrayList;
import java.util.List;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.zul.Window;

import com.jkt.common.Closure;
import com.jkt.dominio.Descriptible;
import com.jkt.ov.DescriptibleOV;

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

	private Closure c;
	
	@Command
	public void obtenerElemento(@BindingParam("objeto") DescriptibleOV d){
		System.out.println("daleeee");
		this.c.ejecutarAcciones();
	}
	
	private List<DescriptibleOV> coleccion = new ArrayList<DescriptibleOV>();
	private PedidoVM vm;

	public PedidoVM getVm() {
		return vm;
	}

	public void setVm(PedidoVM vm) {
		this.vm = vm;
	}

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
	
	public Closure getC() {
		return c;
	}

	public void setC(Closure c) {
		this.c = c;
	}

	@Init
	public void init(@ExecutionArgParam("vm") PedidoVM vm,
			@ExecutionArgParam("coleccion") List<DescriptibleOV> coleccion, @ExecutionArgParam("codigo") String codigo, @ExecutionArgParam("closure") Closure c) {
		this.coleccion = coleccion;
		this.codigo = codigo;
		this.vm = vm;
		this.c=c;
		this.c.setVM(this);
	}

	@Command
	public void cerrarModal(@BindingParam("window") Window x) {
		x.detach();
	}

}