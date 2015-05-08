package com.jkt.viewModels.plantilla;

import java.lang.reflect.InvocationTargetException;

import lombok.Data;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.DescriptibleOV;
import com.jkt.viewModels.IBasicOperations;
import com.jkt.viewModels.ViewModel;

@Data
public class PlantillaVM extends ViewModel implements IBasicOperations{

//	private boolean editMode=false;
	
	private DescriptibleOV plantilla= new DescriptibleOV();
	
	@GlobalCommand("actualizarOVs")
	@NotifyChange({"plantilla","editMode"})
	public void actualizar() {}

	@Override
	protected String retrieveMethod() {
		return "actualizarOVs";
	}

	@Init
	public void init(){
		this.setTitulo("Administración de Plantila");
//		this.editMode=false;
	}
	
	@Command
	@NotifyChange({"plantilla","editMode"})
	public void guardar() throws JakartaException {
		String op = "actualizado";
		if (plantilla.getId()==0) {
			op = "guardado";
		}
		
		Operaciones.ejecutar("guardarPlantilla", plantilla);
		Messagebox.show("Se ha " + op + " la plantilla correctamente");
		this.nuevo();
	}

	@Command
	@NotifyChange("plantilla")
	public void nuevo() throws JakartaException {
		this.plantilla = new DescriptibleOV();
	}

	@Command
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		openComplexHelper("plantilla", "", plantilla, "modoEdicion", "Plantillas Disponibles", "Cod. Plantilla", "Descripción de plantilla", true, "" , "");
	}
	
	public void modoEdicion(){
//		this.editMode=true;
	}

}
