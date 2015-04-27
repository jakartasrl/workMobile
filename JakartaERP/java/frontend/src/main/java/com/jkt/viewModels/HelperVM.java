package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContenedorFiltrosOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.FiltroOV;
import com.jkt.ov.HeaderHelpGenericoOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.view.ObjectView;

/**
 * ViewModel para los helpers.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class HelperVM {

	
	private String filtro="filtroCodigo";
	
	public String getFiltro() {
		return filtro;
	}

	public void setFiltro(String filtro) {
		this.filtro = filtro;
	}

	protected static final Logger log = Logger.getLogger(HelperVM.class);

	protected List<FiltroOV> filtrarHook(){
		return new ArrayList<FiltroOV>();
	}
	
	@Command
	@NotifyChange("coleccion")
	public void filtrar(){
		ContenedorFiltrosOV c=new ContenedorFiltrosOV();
		c.setClase(this.clase);
		
		c.setFiltros(ov.obtenerFiltro());
		
		ListDescriptibleOV listDescriptible = (ListDescriptibleOV) Operaciones.ejecutar("HelperConFiltro", c, ListDescriptibleOV.class);		
		this.coleccion=listDescriptible.getList();
	}
	
	private Boolean conFiltro=Boolean.FALSE;
	private String titulo;
	private String clase;
	private String codigo;
	private String descripcion;
	private List<DescriptibleOV> coleccion = new ArrayList<DescriptibleOV>();
	private ObjectView ov;
	private String refresh;
	private String invoke;
	private Object vm;

	
	
	public Boolean getConFiltro() {
		return conFiltro;
	}

	public void setConFiltro(Boolean conFiltro) {
		this.conFiltro = conFiltro;
	}

	public String getClase() {
		return clase;
	}

	public void setClase(String clase) {
		this.clase = clase;
	}

	public String getRefresh() {
		return refresh;
	}

	public void setRefresh(String refresh) {
		this.refresh = refresh;
	}

	public String getInvoke() {
		return invoke;
	}

	public void setInvoke(String invoke) {
		this.invoke = invoke;
	}

	public Object getVm() {
		return vm;
	}

	public void setVm(Object vm) {
		this.vm = vm;
	}

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
	public void obtenerElemento(@BindingParam("objeto") DescriptibleOV d, @BindingParam("window") Window x) throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		
		if (ov==null) {
			log.warn("No está disponible la funcionalidad para el evento de click sobre una fila, ya que no existe un destino donde depositar los datos.");
		}else{
			BeanUtils.copyProperties(d, ov);
			x.detach();
			BindUtils.postGlobalCommand(null, null,this.refresh, null);
			
			//Execute post actions.
			if (invoke!=null && !invoke.isEmpty()) {
				log.info("Ejecutando acciones post select del help generico.");
				try {
					Method method = vm.getClass().getMethod(invoke);
					method.invoke(vm);
				} catch (NoSuchMethodException e) {
					String msg = "No es posible ejecutar la acción especificada:".concat(invoke);
					msg.concat(String.format("Clase: %s - Metodo %s.", this.vm.getClass().getSimpleName(), this.invoke));
					log.warn(msg);
				} catch (SecurityException e) {
					throw new JakartaException("Ocurrio un problema de seguridad al ejecutar el metodo:".concat(invoke));
				}
			}else{
				log.info("No se ejecutan post acciones adicionales luego de la selección del help generico.");
			}
		}
	}

	@Init
	public void init(	@ExecutionArgParam("coleccion") List<DescriptibleOV> coleccion,
						@ExecutionArgParam("metaDatos") HeaderHelpGenericoOV headerOV, 
						@ExecutionArgParam("result") ObjectView resultOV,
						@ExecutionArgParam("refresh") String refresh,
						@ExecutionArgParam("invoke") String metodo,
						@ExecutionArgParam("vm") Object vm,
						@ExecutionArgParam("clase") String clase,
						@ExecutionArgParam("conFiltro") Boolean conFiltro
			) {
		this.coleccion = coleccion;
		this.conFiltro=conFiltro;
		
		if(headerOV==null){//asigna los datos correspondientes.
			headerOV = new HeaderHelpGenericoOV();
		}
		
		this.codigo=headerOV.getColumnaCodigo();
		this.descripcion=headerOV.getColumnaDescripcion();
		this.titulo=headerOV.getTitulo();
		this.clase=clase;
		this.vm=vm;
		this.invoke=metodo;
		this.ov=resultOV;
		this.refresh=refresh;
	}

	@Command
	public void cerrarModal(@BindingParam("window") Window x) {
		x.detach();
	}

}