package com.jkt.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.joda.time.LocalDate;
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
		
		
		Date a=LocalDate.now().plusDays(2).toDate();
		Date b=LocalDate.now().plusDays(3).toDate();
		Date c=LocalDate.now().plusDays(4).toDate();
		Date d=LocalDate.now().plusDays(5).toDate();
		Date e=LocalDate.now().plusDays(14).toDate();
		Date f=LocalDate.now().plusDays(6).toDate();
		Date g=LocalDate.now().plusDays(15).toDate();
		Date h=LocalDate.now().plusDays(7).toDate();
		
		
		result.add(new EventoDTO(1L,"uno", sdf.format(a), sdf.format(a), "green", "green"));
		result.add(new EventoDTO(2L,"dos", sdf.format(a), sdf.format(b), "#3a87ad", "#3a87ad"));
		result.add(new EventoDTO(3L,"tres", sdf.format(b), sdf.format(d), "#BA88B3", "#BA88B3"));
		result.add(new EventoDTO(1L,"uno", sdf.format(a), sdf.format(h), "green", "green"));
		result.add(new EventoDTO(2L,"dos", sdf.format(a), sdf.format(b), "#3a87ad", "#3a87ad"));
		result.add(new EventoDTO(3L,"tres", sdf.format(b), sdf.format(d), "#BA88B3", "#BA88B3"));
		result.add(new EventoDTO(1L,"uno", sdf.format(b), sdf.format(e), "green", "green"));
		result.add(new EventoDTO(2L,"dos", sdf.format(a), sdf.format(e), "#3a87ad", "#3a87ad"));
		result.add(new EventoDTO(3L,"tres", sdf.format(b), sdf.format(c), "#BA88B3", "#BA88B3"));
		result.add(new EventoDTO(1L,"uno", sdf.format(a), sdf.format(f), "green", "green"));
		result.add(new EventoDTO(2L,"dos", sdf.format(a), sdf.format(g), "#3a87ad", "#3a87ad"));
		result.add(new EventoDTO(3L,"tres", sdf.format(b), sdf.format(h), "#BA88B3", "#BA88B3"));
		
		return result;
		
	}
}
