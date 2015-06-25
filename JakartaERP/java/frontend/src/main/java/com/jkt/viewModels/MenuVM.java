package com.jkt.viewModels;

import lombok.Data;

import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.QueryParam;
import org.zkoss.zk.ui.util.Clients;

import com.google.gson.Gson;
import com.jkt.common.Operaciones;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.ListMenuOV;

/**
 * Retorna todos los enlaces para generar un menu en la vista
 * 	
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class MenuVM {
	
	@Init
	public void init(@QueryParam("menu") String idMenu){

		ContainerOV container =  new ContainerOV();

		if(idMenu!= null && !idMenu.isEmpty()){
			container.setString1(idMenu);
		}else{
			container.setString1("");
		}
		
		ListMenuOV menues = (ListMenuOV) Operaciones.ejecutar("RecuperarMenu", container, ListMenuOV.class);
		
		Gson g = new Gson();
		String listJson = g.toJson(menues);
		
		Clients.evalJavaScript("cargarMenues("+listJson+");");
	}
	
}
