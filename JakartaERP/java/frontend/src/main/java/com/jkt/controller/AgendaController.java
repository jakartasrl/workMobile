package com.jkt.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jkt.common.Operaciones;
import com.jkt.dto.EventoDTO;

@Controller
@RequestMapping(value = "/agenda")
public class AgendaController {

	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(method = RequestMethod.GET)
	public @ResponseBody ArrayList<EventoDTO> obtenerEventos(ServletRequest request, ServletResponse response){
		
		String serverName = request.getServerName();
		int serverPort = request.getServerPort();
		String contextPath = servletContext.getContextPath();
		
		Operaciones.url = "http://" + serverName + ":" + serverPort + "/" + contextPath + "/api/processorHTML5/xml";

//		ListDescriptibleOV result= new ListDescriptibleOV();
//		result = (ListDescriptibleOV) Operaciones.ejecutar("Login", ListDescriptibleOV.class);
//		return (ArrayList<EventoDTO>) result.getList();
		
		ArrayList<EventoDTO> result = new ArrayList<EventoDTO>();
		
		java.util.Date date = new java.util.Date(); 
		java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd");
		String fecha = sdf.format(date);
		
		
		Date a=new Date();
		Date b=new Date();
		b.setMonth(6);
		
		result.add(new EventoDTO(1L,"uno", sdf.format(a), sdf.format(a), "red", "green"));
		result.add(new EventoDTO(2L,"dos", sdf.format(a), sdf.format(b), "blue", "white"));
		result.add(new EventoDTO(3L,"tres", sdf.format(a), sdf.format(b), "black", "red"));
		
		return result;
		
	}
}
