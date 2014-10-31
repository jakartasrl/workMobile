package com.jkt.transformers;

import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;

import org.apache.commons.codec.binary.Base64;
import org.hibernate.proxy.HibernateProxy;
import org.hibernate.proxy.LazyInitializer;
import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jkt.excepcion.JakartaException;
import com.jkt.xmlreader.CampoSalida;
import com.jkt.xmlreader.Output;

public class WebTransformer extends Transformer {

	private ServletOutputStream oos;
	private Output output;
	private Object returnObj;

	@Override
	protected void update(Notificacion arg1) {
		if (output != null) {
			Object objNotificado = arg1.getParameter();
			for (CampoSalida campoSalida : output.getCamposDeSalida()) {
				String value=campoSalida.getValue();
				String target = campoSalida.getTarget();
				
				Object objectValue;
				if(target.contains(".")){
					try {
						objectValue = solver.resolveMethodInvocation(target, objNotificado);
					} catch (Exception e) {
						throw new RuntimeException("Error al resolver valores de output "+value,e);
					}
				}else{
					try {
						PropertyDescriptor propertyDescriptor = BeanUtils.getPropertyDescriptor(objNotificado.getClass(), value);
						objectValue = propertyDescriptor.getReadMethod().invoke(objNotificado, new Object[]{});
					} catch (Exception e) {
						throw new RuntimeException("Error al resolver valores de output "+value,e);
					} 
				}
				try {
					org.apache.commons.beanutils.BeanUtils.copyProperty(returnObj, value, objectValue);
				} catch (Exception e) {
					throw new RuntimeException("Error al setteando valor de output "+value+" en el target "+target,e);
				} 
				
			}
		}

	}

	@SuppressWarnings("unchecked")
	public <T> T deproxy(T obj) {
		if (obj == null)
			return obj;
		if (obj instanceof HibernateProxy) {
			// Unwrap Proxy;
			// -- loading, if necessary.
			HibernateProxy proxy = (HibernateProxy) obj;
			LazyInitializer li = proxy.getHibernateLazyInitializer();
			return (T) li.getImplementation();
		}
		return obj;
	}

	@Override
	public void write() throws JakartaException {
		try {
			Gson gson = new GsonBuilder().create();
			oos.write(Base64.encodeBase64(gson.toJson(returnObj).getBytes()));
			oos.close();
		} catch (IOException e) {
			throw new JakartaException(
					"Error al escribir en el writer de rta html");
		}
	}

	@Override
	public void setup(ServletOutputStream outputStream, String outputName)
			throws JakartaException {
		// Cargo un map con todos los outputs para despues no tener que
		// recorrerlos
		List<Output> outputs = getEvent().getOutputs();
		if(outputs==null || outputs.size()==0){
			throw new JakartaException("No se especifico output");
		}
		output = outputs.get(0);
		// INstancio el objetoOV de retorno
		returnObj = getObjectFromClass(getEvent().getOutputOV());

		oos = outputStream;
	}

	public Object getObjectFromClass(String type) throws JakartaException {
		try {
			Class<?> clazz;
			clazz = Class.forName(type);
			Object newPersistence = clazz.newInstance();
			return newPersistence;
		} catch (Exception e) {
			throw new JakartaException(
					"Error creando el objetoOV de retorno para la clase "
							+ type);
		}
	}

}
