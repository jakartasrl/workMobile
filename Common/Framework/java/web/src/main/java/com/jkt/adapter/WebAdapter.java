package com.jkt.adapter;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.request.EventBusiness;
import com.jkt.xmlreader.CampoEntrada;
import com.jkt.xmlreader.Input;

/**
 * 
 * Adapter para clientes desde javascript.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Component
@Qualifier("webAdapter")
@SuppressWarnings({ "rawtypes"})
public class WebAdapter extends Adapter<Map, Map> {

	public void setTest(boolean aTest) {
	}

	@Override
	protected Map adaptRequestHook(Map mapInput, EventBusiness operation) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Input> inputs = operation.getInputs();
		for (Input inputXml : inputs) {
			String typePersist = inputXml.getClase();
			Class<?> classPersistente ;
			try{
				classPersistente = Class.forName(typePersist);
			}catch(Exception e){
				throw new JakartaException("La clase persistente "+typePersist+" no se encontro");
			}
			
			String keyName = inputXml.getKeyName();
			String name=inputXml.getNameOV();
			String fieldId=inputXml.getFieldID(false);
			
			Object objetoOV;
			objetoOV=mapInput.get(name);
			
			//Recupero el objeto persistente
			PropertyDescriptor propertyDescriptor = BeanUtils.getPropertyDescriptor(objetoOV.getClass(), fieldId);
			Object id = propertyDescriptor.getReadMethod().invoke(objetoOV, new Object[]{});
			
			Object objetoPersisBD = obtainFromBD(id,classPersistente);
			
			Object objetoPersis=getObjectPersistente(objetoPersisBD,objetoOV,inputXml.getCamposDeEntrada());
			BeanUtils.copyProperties(objetoPersis, objetoPersisBD);
			map.put(keyName, objetoPersisBD);
		}
		return map;
	}


	public Object getObjectPersistente(Object objetoPersistente, Object ov, List<CampoEntrada> camposDeEntrada) throws JakartaException{

		for (CampoEntrada campoEntrada : camposDeEntrada) {
			String metodo = campoEntrada.getMetodo();
			String nombreCampoOV = campoEntrada.getPropertyOV();
			

			Method persisMethod = BeanUtils.findMethodWithMinimalParameters(objetoPersistente.getClass(), metodo);
			if(persisMethod==null){
				throw new JakartaException("Method inexistente para el campo "+nombreCampoOV+" para la clase "+objetoPersistente.getClass());
			}
			Class<?>[] parameterTypes = persisMethod.getParameterTypes();
			if(parameterTypes== null || parameterTypes.length==0){
				throw new JakartaException("Mal configurado el setter con nombre "+metodo+" para la clase "+objetoPersistente.getClass());
			}
			Class<?> classSetter= parameterTypes[0];

			if(campoEntrada.getCamposDeEntrada()!=null && !campoEntrada.getCamposDeEntrada().isEmpty()){
				Object listOVs = callGetObject(ov,nombreCampoOV);
				String fieldIDList = campoEntrada.getFieldID(false);

				for (Object objListOV : (List)listOVs) {
					Object idObjLista = callGetObject(objListOV, fieldIDList);
					
					//Obtengo la clase de lo que tengo que buscar en BD
					Object objPersistenteDeLista = obtainFromBD(idObjLista, classSetter);
					Object result = getObjectPersistente(objPersistenteDeLista, objListOV, campoEntrada.getCamposDeEntrada());
					try {
						persisMethod.invoke(objetoPersistente, result);
					} catch (Exception e) {
						throw new JakartaException("Error al guardar metodo de lista con metodo"+metodo);
					}
				}
				
//				getObjectPersistente(objetoLista, nombreCampoOV, camposDeEntrada);
				
			}else{
				//primitivo
				PropertyDescriptor propertyDescriptor = BeanUtils.getPropertyDescriptor(ov.getClass(), nombreCampoOV);
				Method readMethod ;
				if(propertyDescriptor !=null)
					readMethod= propertyDescriptor.getReadMethod();
				else
					throw new JakartaException("no se encontro el campo "+nombreCampoOV + "en la clase OV" +ov.getClass().getName());
				Object valueOV;
				try {
					valueOV = readMethod.invoke(ov, new Object[]{});
				} catch (Exception e){
					throw new JakartaException("Error al leer el campo "+nombreCampoOV+" del OV");
				}

				if(PersistentEntity.class.isAssignableFrom(classSetter)){
					//relacion de entidad
					valueOV = obtainFromBD(valueOV, classSetter);
				}
				try{
					persisMethod.invoke(objetoPersistente, valueOV);
				}catch(Exception e){
					e.printStackTrace();
					throw new JakartaException("Error leyendo el OV o escribiendo en persistente");
				}
				
			}
		}
		return objetoPersistente;
	}
	
	public Object callGetObject(Object obj,String property) throws JakartaException{
		try{
			PropertyDescriptor listPD = BeanUtils.getPropertyDescriptor(obj.getClass(), property);
			return  listPD.getReadMethod().invoke(obj, new Object[]{});
		}catch(Exception e){
			throw new JakartaException("Error ejecutando getter para el campo "+property+" para el objeto"+obj.getClass());
		}
	}

	public Class<?> getClassForSetter(Class<?> clazz,String metodo){
		Method methodoSetPersis = BeanUtils.findMethodWithMinimalParameters(clazz,metodo);
		Class<?>[] parameterTypes = methodoSetPersis.getParameterTypes();
		return parameterTypes[0];
	}
	
	private Object obtainFromBD(Object id, Class<?> classSetter) throws JakartaException {
		try {
			session = sessionProvider.getSession();
			id=session.get(classSetter,(Long) id);
		} catch (NumberFormatException e) {
			throw new JakartaException("Este valor representa un oid, pero no es numerico.");
		}
		return id;
	}
}
