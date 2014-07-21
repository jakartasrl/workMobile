package com.jkt.adapter;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.jkt.request.EventBusiness;

/**
 * 
 * Adapter para clientes desde javascript.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Component
@Qualifier("webAdapter")
public class WebAdapter implements Adapter<String, Integer> {

	public String adaptRequest(Integer input, EventBusiness operation) {
		return null;
	}

}
