package com.jkt.viewModels.plantilla;

import java.lang.reflect.InvocationTargetException;

import lombok.Data;

import org.jsoup.Jsoup;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.viewModels.IBasicOperations;
import com.jkt.viewModels.ViewModel;

@Data
public class PlantillaVM extends ViewModel implements IBasicOperations{

//	private boolean editMode=false;
	
	private DescriptibleOV plantilla= new DescriptibleOV();
	
	@GlobalCommand("actualizarOVs")
	@NotifyChange({"plantilla"})
	public void actualizar() {}

	@Override
	protected String retrieveMethod() {
		return "actualizarOVs";
	}

	@Init
	public void init(){
		this.setTitulo("Administración de Plantila");
	}
	
	@Command
	@NotifyChange({"plantilla","editMode"})
	public void guardar() throws JakartaException {
		String op = "actualizado";
		if (plantilla.getId()==0) {
			op = "guardado";
		}
		
		plantilla.setDescripcion(Jsoup.parse(plantilla.getCampoAdicional1()).text());
		
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

		ContainerOV container=new ContainerOV();
		container.setString1("plantilla");
		container.setString2(String.valueOf(plantilla.getId()));
		
		//recuperar la plantilla usando el id, para traer los datos con formato.
		ListDescriptibleOV listaDescriptibles = (ListDescriptibleOV) Operaciones.ejecutar("TraerPlantilla", container, com.jkt.ov.ListDescriptibleOV.class);
		DescriptibleOV plantilla = (DescriptibleOV) listaDescriptibles.getList().get(0);
		this.plantilla=plantilla;
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);

	}

}
