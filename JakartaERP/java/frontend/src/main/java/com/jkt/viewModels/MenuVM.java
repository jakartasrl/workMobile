package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ContextParam;
import org.zkoss.bind.annotation.ContextType;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.bind.annotation.QueryParam;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.util.Clients;
import org.zkoss.zul.Messagebox;

import com.google.gson.Gson;
import com.jkt.common.Operaciones;
import com.jkt.dto.SessionViewModelsDTO;
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
	
	private String titulo = "Los Conce";
	
	private List<String> news=new ArrayList<String>();
	private String currentNew;
	private int index = 0;
	
	private Map<String, String> mapaViewModel =  new HashMap<String, String>();
	
	
	@Command
	@NotifyChange("currentNew")
	public void next(){
		index++;
		if (index==news.size()) {
			index=0;
		}
		currentNew=news.get(index);
	}
	
	@Data
	public class MenuDTO{
		private String name, thumbnail, size, theme, link, content, url;
	}
	
	@Init
	public void init(@QueryParam("menu") String idMenu) throws IllegalAccessException, InvocationTargetException{

		loadNews();
		
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
			this.mapaViewModel.put(menuOV.getLink(), menuOV.getVm()); //Meto en un mapa la url y el vm, para poder recuperarlo posteriormente
			
			menuDTO = new MenuDTO();
			
			if((menuOV.getLink()==null || menuOV.getLink().isEmpty()) && (menuOV.getType().equals("menu_principal") || menuOV.getType().equals("menu"))){
				menuOV.setLink("supermenu.zul?menu="+String.valueOf(menuOV.getId()));
			}else{
				menuOV.setLink("javascript:executeCommand('"+menuOV.getLink()+"')");
			}
			
			//NO puedo usar BeanUtils de apache xq los campos estan nombrados diferentes.
			menuDTO = new MenuDTO();
			
			menuDTO.setName(menuOV.getName());
			menuDTO.setContent(menuOV.getName());
			menuDTO.setThumbnail(menuOV.getImg());
			menuDTO.setSize(menuOV.getSize());
			menuDTO.setTheme(menuOV.getTheme());
			menuDTO.setLink(menuOV.getLink());
			
			
			menuesPlanos.add(menuDTO);
		}
		
		Gson g = new Gson();
		String listJson = g.toJson(menuesPlanos);
		
		Clients.evalJavaScript("cargarMenues("+listJson+");");
	}

	protected void loadNews() {
		news.add("Reactores - Serie o limitadores de corriente de cortocircuido. Paralelo, derivación o Shunt.");
		news.add("Transformadores - Potencia - Distribución - Especiales ");
		news.add("El Mural mas grande del mundo.");
		news.add("Los Conce. Tel.:(+54 11)46932220");
		
		currentNew=news.get(index);
	}
	
	/**
	 * EndPoint for generate redirects and work with sessions.
	 * 
	 */
	@Command
	public void test(@ContextParam(ContextType.TRIGGER_EVENT) Event event) {
	    String url = event.getData().toString();
//		Session sess = Sessions.getCurrent();
//		SessionViewModelsDTO dto = new SessionViewModelsDTO(url , this.mapaViewModel.get(url));
//		sess.setAttribute("sessionVMDTO", dto);
//	    Executions.sendRedirect("pantallas/sessionVMs/sessionManager.zul");
	    Executions.sendRedirect(url);
	}

}
