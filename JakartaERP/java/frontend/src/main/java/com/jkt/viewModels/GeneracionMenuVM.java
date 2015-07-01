package com.jkt.viewModels;

import org.zkoss.bind.annotation.Init;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
import com.jkt.ov.ContainerOV;

public class GeneracionMenuVM {

	@Init
	public void init(){
		ContainerOV containerMenu = new ContainerOV();
		containerMenu.setString1("menu1.xml");
		Operaciones.ejecutar("CrearMenues", containerMenu);
		Messagebox.show("Se genero el menu correctamente...");
		Executions.sendRedirect("index.zul");
		
	}
	
}
