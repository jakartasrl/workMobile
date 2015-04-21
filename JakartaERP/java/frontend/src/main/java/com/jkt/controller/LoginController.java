package com.jkt.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zkoss.zk.ui.Executions;

import com.jkt.common.Operaciones;
import com.jkt.exception.LoginException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody DescriptibleOV login(ServletRequest request, ServletResponse response, @RequestBody DescriptibleOV login){
		
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(login.getCodigo());
		objetoOV.setString2(login.getDescripcion());
		
		String serverName = request.getServerName();
		int serverPort = request.getServerPort();
		String contextPath = servletContext.getContextPath();
		
		Operaciones.url = "http://" + serverName + ":" + serverPort + "/" + contextPath + "/api/processorHTML5/xml";

		DescriptibleOV result= new DescriptibleOV();
		try{
			result = (DescriptibleOV) Operaciones.ejecutar("Login", objetoOV, DescriptibleOV.class);
		}catch(Exception e){
			result.setCodigo("ERROR");
			result.setDescripcion(e.getMessage());
		}
		return result;
		
	}
}
