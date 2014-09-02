package com.jkt.adapter;

import java.lang.reflect.InvocationTargetException;

import org.springframework.stereotype.Component;

import com.jkt.request.EventBusiness;
import com.jkt.service.SessionProvider;

/**
 * 
 * Adapter para realizar la transformación de las diferentes
 * entradas de los clientes a datos del contexto de los servicios
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Component
public interface Adapter<T,T2> {
	
	/**
	 * 
	 * 
	 * @param operation 
	 * 
	 * @return <T> type
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws SecurityException 
	 * @throws NoSuchMethodException 
	 * @throws InvocationTargetException 
	 * @throws IllegalArgumentException 
	 * @throws Exception 
	 */
	public T adaptRequest(T2 input, EventBusiness operation) throws ClassNotFoundException, InstantiationException, IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException, Exception;

	public void setSession(SessionProvider sessionProvider);
	public void setTest(boolean aTest);

}
