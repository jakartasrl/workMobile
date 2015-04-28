package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.Default;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.HeaderHelpGenericoOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.view.ObjectView;

/**
 * <p>Superclass de todos los viewModel.</p>
 * <p>Define comportamiento para helps genericos, para logs, implementaciones de metodos necesarios y todo lo comun con los viewModels.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class ViewModel {

	protected static final Logger log = Logger.getLogger(ViewModel.class);

	private String filtro="filtroCodigo";
	private String titulo="";

	public String getFiltro() {
		return filtro;
	}

	public void setFiltro(String filtro) {
		this.filtro = filtro;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	@Command
	public void validarCampo(@BindingParam("clase") String clase, @BindingParam("codigo") String campo, @BindingParam("ov") ObjectView ov,@BindingParam("post") String metodo) throws JakartaException{
		
		if (campo.isEmpty()) {
			return;
		}
		
		/*
		 * Campos de entrada
		 */
		ContainerOV container= new ContainerOV();
		container.setString1(clase);
		container.setString2(campo);
		container.setString3(ov.getCampoClave());
		
		//Asigna el resultado.
		DescriptibleOV resultado= (DescriptibleOV) Operaciones.ejecutar("ValidarEntidad", container, DescriptibleOV.class);

		//Copio los valores simples, no se hace x referencias xq se pierden.
		BeanUtils.copyProperties(resultado, ov);
		
		if (metodo!=null && !metodo.isEmpty()) {
			ejecutarMetodoPostAccion(metodo);
		}
		
		//Actualiza todo el vm hijo
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}

	private void ejecutarMetodoPostAccion(String metodo)throws JakartaException {
		try {
			Method method =  getClass().getMethod(metodo);
			method.invoke(this);
		} catch (NoSuchMethodException e) {
			String msg = "No es posible ejecutar la acción especificada:".concat(metodo);
			msg.concat(String.format("Clase: %s - Metodo %s.", this.getClass().getSimpleName(), metodo));
			log.warn(msg);
		} catch (SecurityException e) {
			throw new JakartaException("Ocurrio un problema de seguridad al ejecutar el metodo:".concat(metodo));
		} catch (IllegalAccessException e) {
			throw new JakartaException("Ocurrio un problema de seguridad al ejecutar el metodo:".concat(metodo));
		} catch (IllegalArgumentException e) {
			throw new JakartaException("Ocurrio un problema de seguridad al ejecutar el metodo:".concat(metodo));
		} catch (InvocationTargetException e) {
			throw new JakartaException("Ocurrio un problema de seguridad al ejecutar el metodo:".concat(metodo));
		}
	}
	
	@Command
	public void openHelper(	@BindingParam("clase") String clase, 
							@BindingParam("oidEntidadMaestra") String oidEntidadMaestra ,
							@BindingParam("ov") ObjectView ov,
							@BindingParam("post") String metodo,
							@BindingParam("titulo") String titulo,
							@BindingParam("codHeader") String codHeader,
							@BindingParam("descHeader") String descHeader,
							@BindingParam("conFiltro") @Default("false") Boolean filtrar
			) throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {

		if (filtrar) {
			if (ov==null) {
				log.warn("Hay que indicar el OV, xq de este se toman los filtros!!");
				Messagebox.show("No se puede abrir la ayuda de esta entidad, ya que no se indico una entidad valida");
			}
			
		}else{
			if (ov==null) {
				log.warn("No se ha indicado un objeto vista de destino. Por favor indique uno, de modo contrario, solamente la ventana es de una simple consulta de ayuda.");
			}
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		ListDescriptibleOV listDescriptible;

		if (filtrar) {
			listDescriptible=new ListDescriptibleOV();
			map.put("clase",clase);
		}else{
			if (oidEntidadMaestra==null || oidEntidadMaestra.isEmpty()) {
				listDescriptible = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV(clase), ListDescriptibleOV.class);
			}else{
				HelperOV helperOV = new HelperOV();
				helperOV.setClase(clase);
				helperOV.setOidEntidadMaestra(oidEntidadMaestra);
				listDescriptible = (ListDescriptibleOV) Operaciones.ejecutar("HelperCompuesto",helperOV , ListDescriptibleOV.class);
			}
		}

		
		map.put("coleccion",listDescriptible.getList());
		map.put("conFiltro",filtrar);
		map.put("refresh", retrieveMethod());
		map.put("result", ov);
		map.put("invoke", metodo);
		map.put("vm", this);

		
		HeaderHelpGenericoOV metaDatos=new HeaderHelpGenericoOV();
		if (campoValido(titulo)) {
			metaDatos.setTitulo(titulo);
		}
		if (campoValido(codHeader)) {
			metaDatos.setColumnaCodigo(codHeader);
		}
		if (campoValido(descHeader)) {
			metaDatos.setColumnaDescripcion(descHeader);
		}
		
		map.put("metaDatos", metaDatos);
		
		Window window = (Window) Executions.createComponents("/pantallas/pedido/helpGenerico.zul", null, map);
		
		window.doModal();
	}
	
	/**
	 * Valida que un campo cadena no sea nulo o vacio.
	 */
	private boolean campoValido(String valor){
		if (valor==null) {
			return false;
		}
		if (valor.isEmpty()) {
			return false;
		}
		return true;
	}
	
	public ViewModel() {
		super();
	}
	
	/**
	 * Este metodo no debe realizar nada, salvo que as� lo desee.
	 * <p>El fin de este metodo es solamente actualizar todos los OV, declarando annotations sobre el metodo de tipo {@link NotifyChange}<p>
	 * <p>
	 * Define en el identificador, el nombre que se le asigna al comando global. Esta misma cadena que en el ejemplo es <b>actualizarOVs</b> debe ser la misma cadena
	 * que la que retorna el metodo {@link #retrieveMethod()}
	 * </p>
	 * 
	 * <code>
	 * 	@GlobalCommand("actualizarOVs")
	 *  @NotifyChange({"clienteOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas"})
	 *  public void actualizar(){}
	 * </code>
	 * 
	 */
	public abstract void actualizar();

	/**
	 * @return String que debe ser igual a la annotation declarada en el metodo actualizar.
	 */
	protected abstract String retrieveMethod();
	
	/**
	 * Dada una lista de elementos descriptibles y un id, se retornar el elemento correspondiete.
	 * 
	 * @param lista de todos los elementos, generalemten la lista con la que se bindea el componente de .zul
	 * @param id recuperado desde la base
	 * @return {@link DescriptibleOV} que se deberá setear en el selectedItem.
	 */
	protected DescriptibleOV completarCombo(List lista, Long id){
		DescriptibleOV elementoActual;
		for (Object object : lista) {
			elementoActual = (DescriptibleOV) object;
			if (elementoActual.getId()==id) {
				return elementoActual;
			}
		}
		return null;
	}
	
	@Command
	public void logOut(){
		Session sess = Sessions.getCurrent();
        sess.removeAttribute("userCredential");
        Executions.sendRedirect("/login.zul");
	}
	
}