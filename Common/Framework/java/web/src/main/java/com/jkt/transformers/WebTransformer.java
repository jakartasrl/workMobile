package com.jkt.transformers;


import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletOutputStream;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jkt.excepcion.JakartaException;
import com.jkt.view.ListOV;
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
				getObjectOV(objNotificado, returnObj,
						output.getCamposDeSalida());
			} catch (JakartaException e1) {
				throw new RuntimeException(
						"Error al cargar objeto OV para ser retornado: "+e1.getMessage(), e1);
			}
		}

	}

	@SuppressWarnings({ "rawtypes"})
	public void getObjectOV(Object objNotificado, Object objectOV,
			List<CampoSalida> camposSalida) throws JakartaException {
		if(ListOV.class.isAssignableFrom(objectOV.getClass())){
			if(List.class.isAssignableFrom(objNotificado.getClass())){
				updateListObjectView((List)objNotificado, (ListOV)objectOV, camposSalida);
			}
		}else{
			updateObjectView(objNotificado, objectOV, camposSalida);
		}
		
	}

	@SuppressWarnings("unchecked")
	private void updateListObjectView(List objNotificado, ListOV objectOV,List<CampoSalida> camposSalida) throws JakartaException {
		Object listObjectOV;
		Class<?> ovListClass;
		// Obtengo la clase OV a la cual lo tengo que setear
		String targetProperty;
		try {
			targetProperty =  "list";
			PropertyDescriptor propertyDescriptor2 = BeanUtils
					.getPropertyDescriptor(objectOV.getClass(), targetProperty);
			listObjectOV = propertyDescriptor2.getReadMethod().invoke(
					objectOV, new Object[] {});

			Field ovListField = objectOV.getClass().getDeclaredField(
					targetProperty);
			ParameterizedType obListType = (ParameterizedType) ovListField
					.getGenericType();
			ovListClass = (Class<?>) obListType
					.getActualTypeArguments()[0];
		} catch (Exception e) {
			throw new JakartaException("Error obteniendo los objetos lista y sus clases para el target ");
		}

		for (Object objPersis : (List) objNotificado) {
			Object objOV = BeanUtils.instantiate(ovListClass);
			if(objPersis!=null){
				// Obtengo la clase de lo que tengo que buscar en BD
				getObjectOV(objPersis, objOV,camposSalida);
				((List) listObjectOV).add(objOV);
			}
		}
	}

	private void updateObjectView(Object objNotificado, Object objectOV,
			List<CampoSalida> camposSalida) throws JakartaException {
		Boolean isMap=false;
		HashMap    mapNotificado=new HashMap();
		if(HashMap.class.isAssignableFrom(objNotificado.getClass())){
			isMap=true;
			mapNotificado=(HashMap) objNotificado;
		}
		for (CampoSalida campoSalida : camposSalida) {
			Object objectValue;
			String target = campoSalida.getTarget();
			String value = campoSalida.getValue();

			if (campoSalida.getCamposDeSalida() != null	&& !campoSalida.getCamposDeSalida().isEmpty()) {
				Object listObjectOV;
				Class<?> ovListClass;
				Object listPers;
				// Obtengo la clase OV a la cual lo tengo que setear
				try {
					PropertyDescriptor propertyDescriptor2 = BeanUtils
							.getPropertyDescriptor(objectOV.getClass(), value);
					listObjectOV = propertyDescriptor2.getReadMethod().invoke(
							objectOV, new Object[] {});

					Field ovListField = objectOV.getClass().getDeclaredField(
							value);
					ParameterizedType obListType = (ParameterizedType) ovListField
							.getGenericType();
					ovListClass = (Class<?>) obListType.getActualTypeArguments()[0];
					
					if(!isMap){
						PropertyDescriptor propertyDescriptor = BeanUtils.getPropertyDescriptor(objNotificado.getClass(),target);
						listPers = propertyDescriptor.getReadMethod().invoke(
								objNotificado, new Object[] {});
					}else{
						listPers=mapNotificado.get(target);
					}
				} catch (Exception e) {
					throw new JakartaException(
							"Error obteniendo los objetos lista y sus clases para el target "
									+ target);
				}

				if(List.class.isAssignableFrom(listPers.getClass())){
					for (Object objPersis : (List) listPers) {
						Object objOV = BeanUtils.instantiate(ovListClass);
						if(objPersis!=null){
							// Obtengo la clase de lo que tengo que buscar en BD
							getObjectOV(objPersis, objOV,campoSalida.getCamposDeSalida());
							((List) listObjectOV).add(objOV);
						}
					}
				}else{
					if(Set.class.isAssignableFrom(listPers.getClass())){
						for (Object objPersis : (Set) listPers) {
							Object objOV = BeanUtils.instantiate(ovListClass);
							if(objPersis!=null){
								// Obtengo la clase de lo que tengo que buscar en BD
								getObjectOV(objPersis, objOV,campoSalida.getCamposDeSalida());
								((Set) listObjectOV).add(objOV);
							}
						}
					}
				}
				objectValue = listObjectOV;
			} else {
				if (target.contains(".")) {
					try {
						objectValue = solver.resolveMethodInvocation(target,
								objNotificado);
					} catch (Exception e) {
						throw new JakartaException(
								"Error al resolver valores de output " + value,
								e);
					}
				} else {
					try {
						if(!isMap){
							PropertyDescriptor propertyDescriptor = BeanUtils
									.getPropertyDescriptor(
											objNotificado.getClass(), target);
							objectValue = propertyDescriptor.getReadMethod()
								.invoke(objNotificado, new Object[] {});
						}else{
							objectValue = mapNotificado.get(target);
						}
					} catch (Exception e) {
						throw new JakartaException(
								"Error al resolver valores de output " + value,
								e);
					}
				}
			}
			try {
				org.apache.commons.beanutils.BeanUtils.copyProperty(objectOV,
						value, objectValue);
			} catch (Exception e) {
				throw new RuntimeException(
						"Error al setteando valor de output " + value
								+ " en el target " + target, e);
			}
		}
	}

	@Override
	public void write() throws JakartaException {
		try {
			if (returnObj != null) {
				Gson gson = new GsonBuilder().create();
				oos.write(Base64.encodeBase64(gson.toJson(returnObj).getBytes()));
				oos.close();
			}
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
		if (outputs != null &&  outputs.size() >0) {
			output = outputs.get(0);
			// INstancio el objetoOV de retorno
			returnObj = getObjectFromClass(getEvent().getOutputOV());
		}
		oos = outputStream;
	}

	public Object getObjectFromClass(String type) throws JakartaException {
		try {
			Class<?> clazz;
			clazz = Class.forName(type);
			return BeanUtils.instantiate(clazz);
		} catch (Exception e) {
			throw new JakartaException(
					"Error instanciando el objetoOV de retorno para la clase "
							+ type);
		}
	}

}
