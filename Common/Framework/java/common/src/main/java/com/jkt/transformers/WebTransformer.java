package com.jkt.transformers;

import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.servlet.ServletOutputStream;

import org.apache.commons.codec.binary.Base64;
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
			try {
				getObjectOV(objNotificado,returnObj,output.getCamposDeSalida());
			} catch (JakartaException e1) {
				throw new RuntimeException("Error al cargar objeto OV para ser retornado ",e1);
			}
		}

	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void getObjectOV(Object objNotificado,Object objectOV, List<CampoSalida> camposSalida) throws JakartaException{
		for (CampoSalida campoSalida : camposSalida) {
			Object objectValue;
			String target =campoSalida.getTarget();
			String  value=campoSalida.getValue();
			
			if (campoSalida.getCamposDeSalida() != null	&& !campoSalida.getCamposDeSalida().isEmpty()) {
				Object listObjectOV ;
				  Class<?> ovListClass;
				  Object listPers ;
				//Obtengo la clase OV a la cual lo tengo que setear
				try{
					PropertyDescriptor propertyDescriptor2 = BeanUtils.getPropertyDescriptor(objectOV.getClass(), target);
					 listObjectOV = propertyDescriptor2.getReadMethod().invoke(objectOV, new Object[]{});
					
			        Field ovListField = objectOV.getClass().getDeclaredField(target);
			        ParameterizedType obListType = (ParameterizedType) ovListField.getGenericType();
			         ovListClass = (Class<?>) obListType.getActualTypeArguments()[0];
			         PropertyDescriptor propertyDescriptor = BeanUtils.getPropertyDescriptor(objNotificado.getClass(), value);
			         listPers= propertyDescriptor.getReadMethod().invoke(objNotificado, new Object[]{});
				}catch(Exception e){
					throw new JakartaException("Error obteniendo los objetos lista y sus clases para el target "+ target);
				}

				for (Object objPersis : (List)listPers) {
					Object objOV=BeanUtils.instantiate(ovListClass);
					//Obtengo la clase de lo que tengo que buscar en BD
					getObjectOV(objPersis, objOV, campoSalida.getCamposDeSalida());
					((List)listObjectOV).add(objOV);
				}
				objectValue=listObjectOV;
			} else {
				if (target.contains(".")) {
					try {
						objectValue = solver.resolveMethodInvocation(target,objNotificado);
					} catch (Exception e) {
						throw new JakartaException("Error al resolver valores de output " + value, e);
					}
				} else {
					try {
						PropertyDescriptor propertyDescriptor = BeanUtils
								.getPropertyDescriptor(objNotificado.getClass(),
										value);
						objectValue = propertyDescriptor.getReadMethod().invoke(
								objNotificado, new Object[] {});
					} catch (Exception e) {
						throw new JakartaException(
								"Error al resolver valores de output " + value, e);
					}
				}
			}
			try {
				org.apache.commons.beanutils.BeanUtils.copyProperty(objectOV, value, objectValue);
			} catch (Exception e) {
				throw new RuntimeException("Error al setteando valor de output "+value+" en el target "+target,e);
			} 
		}
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
			return BeanUtils.instantiate(clazz);
		} catch (Exception e) {
			throw new JakartaException(
					"Error creando el objetoOV de retorno para la clase "
							+ type);
		}
	}

}
