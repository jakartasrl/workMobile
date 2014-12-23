package com.jkt.controller;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jkt.adapter.Adapter;
import com.jkt.excepcion.JakartaException;
import com.jkt.request.EventBusiness;
import com.jkt.request.IEventBusiness;
import com.jkt.view.ContainerOV;

/**
 * Controller that will receive all request from clients javascript. Controller
 * que recibirá todas las solicitudes desde clientes javascript.
 * 
 * @author Sergio Leonel Suarez
 */
@Controller
@RequestMapping(value = "/processorHTML5")
@SuppressWarnings("rawtypes")
public class RequestProcessorWeb extends RequestProcessor {

	@Autowired(required=true)
	@Qualifier("webAdapter")
	private Adapter<Map, Map> webAdapter;

	@PostConstruct
	public void inyectarSessionEnAdapter(){
		webAdapter.setSession(sessionProvider);
	}
	
	
	@Override
	protected String getAppRequest() {
		return RequestProcessor.CLIENTE_HTML;
	}

	@Override
	protected Map retrieveParameters(HttpServletRequest request)throws Exception {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		if(eventBusinessOperation.getInputOV()!=null){
			String type = eventBusinessOperation.getInputOV();
			Class<?> clazz;
			try{
				clazz = Class.forName(type);
			}catch(Exception e){
				throw new JakartaException("Error al querer recuperar la clase "+type);
			}
		    //aca recupero el class eventBusinessOperation.get();
		    Gson gson = new GsonBuilder().create();
		    String json= new String(Base64.decodeBase64( IOUtils.toByteArray(request.getInputStream())));
		    Object ob= gson.fromJson(json,clazz);
	    	if(ContainerOV.class.isAssignableFrom(clazz)){
	    		ContainerOV container = (ContainerOV) BeanUtils.instantiate(clazz);
	    		for (String keyMap : container.keySet()) {
					Object objectView = container.get(keyMap);
					Method readMethod = BeanUtils.getPropertyDescriptor(objectView.getClass(), "nameOV").getReadMethod();
					String nameOV= (String) readMethod.invoke(objectView, new Object[]{});
					hashMap.put(nameOV, objectView);
				}
	    	}else{
	    		String keyOV=null;
	    		if( BeanUtils.getPropertyDescriptor(ob.getClass(), "nameOV")!=null){
					Method readMethod = BeanUtils.getPropertyDescriptor(ob.getClass(), "nameOV").getReadMethod();
					keyOV= (String) readMethod.invoke(ob, new Object[]{});
	    		}
				if(keyOV != null && keyOV.length()>0)
					hashMap.put(keyOV, ob);
				else
					hashMap.put("OV", ob);
	    	}
		}
		return hashMap;
	}

	@Override
	protected Map adaptParameters(Object map, IEventBusiness operation)	throws Exception {
		Map result=(Map)this.webAdapter.adaptRequest((Map) map, (EventBusiness)operation);																
		return result;
	}

	@Override
	public Map getParameters(HttpServletRequest request, String operationName)
			throws Exception {
		operationName= request.getHeader("op");

		getEventBusinessOperation(operationName);
		Map parameters = retrieveParameters(request);
		return parameters;
	}
}
