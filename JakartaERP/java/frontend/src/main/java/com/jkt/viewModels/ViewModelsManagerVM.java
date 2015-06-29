package com.jkt.viewModels;

import java.util.Map;

import lombok.Data;

import org.zkoss.bind.annotation.Init;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;

import com.jkt.dto.SessionViewModelsDTO;
import com.jkt.excepcion.JakartaException;

@Data
public class ViewModelsManagerVM {
	
	private Object viewModel;
	private String url;
	private String vmClass;
	
	/**
	 * URL es para incluir todo zk posible
	 * Key es para recuperar el viewModel, o generar uno nuevo
	 * vmClass es para instanciar el view modelo y pasarlo al include
	 * @throws ClassNotFoundException Cuando no existe la clase levanta esta excepcion
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws JakartaException 
	 */
	@Init
	public void init() throws ClassNotFoundException, InstantiationException, IllegalAccessException, JakartaException{
		Session sess = Sessions.getCurrent();

		SessionViewModelsDTO dto = (SessionViewModelsDTO) sess.getAttribute("sessionVMDTO"); //datos para ver si esta en sesion el vm o no, y para redireccionar
		
		Map<String,Object> mapa = (Map<String, Object>) sess.getAttribute("ventanas");
		Object viewModelEnSesion = mapa.get(dto.getUrl());

		if(viewModelEnSesion==null){
			String claseViewModel = dto.getClaseViewModel();
			if(claseViewModel==null || claseViewModel.isEmpty()){
				throw new JakartaException("Ocurrio una inconsistencia en el motor que administra este modulo.");
			}else{
				Class<?> clase = Class.forName(claseViewModel);
				this.viewModel = clase.newInstance();
			}
		}else{
			this.viewModel= viewModelEnSesion;
		}
		
		this.url=dto.getUrl();
	}
	
}
