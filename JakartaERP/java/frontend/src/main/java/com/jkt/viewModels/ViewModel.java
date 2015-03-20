package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
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

	@Command
	public void openHelper(@BindingParam("clase") String clase, @BindingParam("oidEntidadMaestra") String oidEntidadMaestra ,@BindingParam("ov") ObjectView ov,@BindingParam("post") String metodo) throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {

		if (ov==null) {
			log.warn("No se ha indicado un objeto vista de destino. Por favor indique uno, de modo contrario, solamente la ventana es de una simple consulta de ayuda.");
		}
		
		ListDescriptibleOV listDescriptible;
		if (oidEntidadMaestra==null || oidEntidadMaestra.isEmpty()) {
			listDescriptible = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV(clase), ListDescriptibleOV.class);
		}else{
			HelperOV helperOV = new HelperOV();
			helperOV.setClase(clase);
			helperOV.setOidEntidadMaestra(oidEntidadMaestra);
			listDescriptible = (ListDescriptibleOV) Operaciones.ejecutar("HelperCompuesto",helperOV , ListDescriptibleOV.class);
		}

		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("coleccion",listDescriptible.getList());
		map.put("refresh", retrieveMethod());
		map.put("result", ov);
		map.put("invoke", metodo);
		map.put("vm", this);

		Window window = (Window) Executions.createComponents("/pantallas/pedido/helpGenerico.zul", null, map);
		window.doModal();
		
	}
	
	public ViewModel() {
		super();
	}
	
	/**
	 * Este metodo no debe realizar nada, salvo que así lo desee.
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
	
}