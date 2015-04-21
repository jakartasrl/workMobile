package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;

import org.zkoss.bind.BindUtils;

import com.jkt.excepcion.JakartaException;

public interface IBasicOperations {

	void guardar() throws JakartaException;
	void nuevo() throws JakartaException;
	void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;

}
