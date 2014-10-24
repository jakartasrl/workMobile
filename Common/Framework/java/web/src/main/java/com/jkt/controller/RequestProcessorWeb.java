package com.jkt.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jkt.dominio.Descriptible;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.request.IEventBusiness;
import com.jkt.util.HashtableDS;

import demo.data.Provincia;

/**
 * Controller that will receive all request from clients javascript.
 * Controller que recibirá todas las solicitudes desde clientes javascript.
 * 
 * @author Sergio Leonel Suarez
 */
@Controller
@RequestMapping(value="/processorHTML5")
public class RequestProcessorWeb extends RequestProcessor {

	@Override
	protected String getAppRequest() {
		return RequestProcessor.CLIENTE_HTML;
	}

	@Override
	protected Map retrieveParameters(HttpServletRequest request)throws Exception {
		HashtableDS hashtable = new HashtableDS();
		hashtable.put("op", "TraerProvincia");
		return hashtable;
	}

	@Override
	protected Map adaptParameters(Object input, IEventBusiness operation) throws IOException {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		
		return hashMap;
	}
	
//	@RequestMapping(value = "/xml", method = RequestMethod.POST)

	/*
	
	@Override
	public void handleXML(HttpServletRequest request, HttpServletResponse response) throws Exception, EntityNotFoundException {

		
		setOutputStream(response.getOutputStream());//setea el writer para cuando el controller sea notificado sepa donde escribir la respuesta.

		
		Provincia provincia = new Provincia();
		provincia.setCodigo("ARG");
		provincia.setDescripcion("Argentina");

		Provincia provincia2 = new Provincia();
		provincia2.setCodigo("BRA");
		provincia2.setDescripcion("Brasil");
		
//		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ObjectOutputStream oos = new ObjectOutputStream(getOutputStream());
		oos.writeObject(Arrays.asList(provincia, provincia2, provincia));
		oos.close(); // ... preparedStatement.setBytes(i, baos.toByteArray());
//		
//		
//		.write(provincia.toString().getBytes());
		
	}
	*/
	
}
