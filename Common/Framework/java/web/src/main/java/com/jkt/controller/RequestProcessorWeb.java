package com.jkt.controller;

import java.util.Map;
import java.util.Observable;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jkt.adapter.Adapter;
import com.jkt.request.IEventBusiness;
import com.jkt.util.MapDS;

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
		return "HTML";
	}

	@Override
	protected Map retrieveParameters(HttpServletRequest request)throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Map adaptParameters(Object input, IEventBusiness operation) {
		// TODO Auto-generated method stub
		return null;
	}

}
