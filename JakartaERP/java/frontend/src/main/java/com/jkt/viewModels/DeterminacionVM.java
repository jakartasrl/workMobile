package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import lombok.Data;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DeterminacionOV;
import com.jkt.ov.ListCaracteristicaProductoOV;
import com.jkt.ov.ListValorEsperadoOV;
import com.jkt.ov.MetodoOV;
import com.jkt.ov.ValorEsperadoOV;

@Data
public class DeterminacionVM extends ViewModel implements IBasicOperations {
	
	private DeterminacionOV determinacion = new DeterminacionOV();

	@Init
	@NotifyChange("determinacion")
	public void init() {
		this.setTitulo("Determinaciones");
	}

	@Override
	public void guardar() throws JakartaException {
		
	}

	@Override
	public void nuevo() throws JakartaException {
		
	}

	@Override
	@Command
	public void buscar() {
		try {
			this.openHelper("determinacion", "", this.determinacion, "traerDeterminacion", "Determinaciones", "Código", "Descripción");
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (JakartaException e) {
			e.printStackTrace();
		}

	}

	@Override
	@GlobalCommand("actualizar")
	@NotifyChange({ "determinacion" })
	public void actualizar() {
		log.warn("Actualizando datos...");
	}
	
	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}
	
	@SuppressWarnings("unchecked")
	@NotifyChange({"determinacion"})
	public void traerDeterminacion() {
		
		long idDeterminacion = determinacion.getId();
		String entidad = "Determinacion";
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(String.valueOf(idDeterminacion));
		containerOV.setString2(entidad);
		
		DeterminacionOV det = (DeterminacionOV) Operaciones.ejecutar("TraerDeterminacion", containerOV, DeterminacionOV.class);
		
		List<ValorEsperadoOV> valoresEsperados = ((ListValorEsperadoOV) Operaciones.ejecutar("TraerValoresEsperados", containerOV, ListValorEsperadoOV.class)).getList();
		
		//this.caracteristicas = determinaciones.getList();

		
		this.determinacion.setMetodos(det.getMetodos());
				 
		this.setDeterminacion(det);
		
	}
	
	@Command
	@NotifyChange("determinacion")
	public void agregarMetodo(){
		MetodoOV metodo = new MetodoOV();
		metodo.setMetodo("Nuevo Metodo");
		this.determinacion.getMetodos().add(metodo);
	
	}

}
