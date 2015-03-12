package com.jkt.viewModels;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.Window;

import com.jkt.common.Closure;
import com.jkt.dominio.Descriptible;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.HeaderHelpGenericoOV;
import com.jkt.view.ObjectView;

/**
 * ViewModel para los helpers, en este caso solamente de los Presupuestos.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class HelperVM {

	protected static final Logger log = Logger.getLogger(HelperVM.class);

	private String titulo = "Consulta generica";
	private String id = "ID";
	private String codigo = "Codigo";
	private String descripcion = "Descripción";
	private List<DescriptibleOV> coleccion = new ArrayList<DescriptibleOV>();
	private ObjectView ov;
	private String refresh;
	

	public ObjectView getOv() {
		return ov;
	}

	public void setOv(ObjectView ov) {
		this.ov = ov;
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

	@Command
	public void obtenerElemento(@BindingParam("objeto") DescriptibleOV d, @BindingParam("window") Window x) {
		
		if (ov==null) {
			log.warn("No está disponible la funcionalidad para el evento de click sobre una fila, ya que no existe un destino donde depositar los datos.");
		}else{
			BeanUtils.copyProperties(d, ov);
			x.detach();
			BindUtils.postGlobalCommand(null, null,this.refresh, null);
		}
	}

	@Init
	public void init(	@ExecutionArgParam("coleccion") List<DescriptibleOV> coleccion,
						@ExecutionArgParam("columnasOV") HeaderHelpGenericoOV headerOV, 
						@ExecutionArgParam("result") ObjectView resultOV,
						@ExecutionArgParam("refresh") String refresh 
			) {
		this.coleccion = coleccion;
		
		if(headerOV!=null){
			this.id=headerOV.getColumnaId();
			this.codigo=headerOV.getColumnaCodigo();
			this.descripcion=headerOV.getColumnaDescripcion();
			this.titulo=headerOV.getTitulo();
		}
		
		this.ov=resultOV;
		this.refresh=refresh;
	}

	@Command
	public void cerrarModal(@BindingParam("window") Window x) {
		x.detach();
	}

}