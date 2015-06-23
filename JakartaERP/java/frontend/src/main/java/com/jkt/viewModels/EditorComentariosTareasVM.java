package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.apache.commons.lang.StringUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import com.jkt.excepcion.JakartaException;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ItemsOV;

@Data
public class EditorComentariosTareasVM {
	
	private DescriptibleOV tarea;
	private List<DescriptibleOV> comentarios =  new ArrayList<DescriptibleOV>();
	
	@Init
	public void init(@ExecutionArgParam("tarea") DescriptibleOV tarea){
		this.tarea = tarea;
		
		DescriptibleOV descriptibleOV = new DescriptibleOV();
		descriptibleOV.setDescripcion("asd");
		comentarios.add(descriptibleOV);
		comentarios.add(descriptibleOV);
		comentarios.add(descriptibleOV);
		comentarios.add(descriptibleOV);
		comentarios.add(descriptibleOV);
		comentarios.add(descriptibleOV);
		
	}
	
	@Command
	public void cerrar(@BindingParam("window") Window w){
		w.detach();
	}

	@Command
	public void aceptar(@BindingParam("window") Window w) throws IllegalAccessException, InvocationTargetException, JakartaException{
		
		//Guardar los nuevos comentaros.
		
		//Guardar tarea, con comentarios incluidos.
		
		w.detach();
	}
	
}


