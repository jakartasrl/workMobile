package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.apache.commons.beanutils.BeanUtils;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.QueryParam;
import org.zkoss.zk.ui.util.Clients;

import com.google.gson.Gson;
import com.jkt.common.Operaciones;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.ListMenuOV;
import com.jkt.ov.MenuOV;

/**
 * Retorna todos los enlaces para generar un menu en la vista
 * 	
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class MenuVM {
	
	@Data
	public class MenuDTO{
		private String name, thumbnail, size, theme, link, content, url;
	}
	
	@Init
	public void init(@QueryParam("menu") String idMenu) throws IllegalAccessException, InvocationTargetException{

		ContainerOV container =  new ContainerOV();

		if(idMenu!= null && !idMenu.isEmpty()){
			container.setString1(idMenu);
		}else{
			container.setString1("");
		}
		
		List<MenuOV> menues = ((ListMenuOV) Operaciones.ejecutar("RecuperarMenu", container, ListMenuOV.class)).getList();
		List<MenuDTO> menuesPlanos = new ArrayList<MenuVM.MenuDTO>();

		MenuDTO menuDTO;
		for (MenuOV menuOV : menues) {
			
			menuDTO = new MenuDTO();
			
			if((menuOV.getLink()==null || menuOV.getLink().isEmpty()) && (menuOV.getType().equals("menu_principal") || menuOV.getType().equals("menu"))){
				menuOV.setLink("supermenu.zul?menu="+String.valueOf(menuOV.getId()));
//				menuOV.setUrl("supermenu.zul?menu="+String.valueOf(menuOV.getId()));
			}
			
			//NO puedo usar BeanUtils de apache xq los campos estan nombrados diferentes.
			menuDTO = new MenuDTO();
			menuDTO.setName(menuOV.getName());
			menuDTO.setContent(menuOV.getName());
			menuDTO.setThumbnail(menuOV.getImg());
			menuDTO.setSize(menuOV.getSize());
			menuDTO.setTheme(menuOV.getTheme());
			menuDTO.setLink(menuOV.getLink());
//			menuDTO.setUrl(menuOV.getUrl());

			menuesPlanos.add(menuDTO);
		}
		
		Gson g = new Gson();
		String listJson = g.toJson(menuesPlanos);
		
		Clients.evalJavaScript("cargarMenues("+listJson+");");
	}
	
}
