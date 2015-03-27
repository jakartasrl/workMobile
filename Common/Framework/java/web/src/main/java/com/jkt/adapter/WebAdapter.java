package com.jkt.adapter;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.mapping.Collection;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.request.EventBusiness;
import com.jkt.view.ListOV;
import com.jkt.view.ObjectView;
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
			
			String keyName = inputXml.getKeyName();
			String name=inputXml.getNameOV();
			String fieldId=inputXml.getFieldID(false);

			Object objetoOV;
			objetoOV=mapInput.get(name);
			
			if(typePersist!=null){
				Class<?> classPersistente ;
				try{
					classPersistente = Class.forName(typePersist);
				}catch(Exception e){
					throw new JakartaException("La clase persistente "+typePersist+" no se encontro");
				}
				
				if(ListOV.class.isAssignableFrom(objetoOV.getClass())){
						ListOV listOV= (ListOV) objetoOV;
						List result=new ArrayList();
						for(Object obj : listOV.getList()){
							Object objetoPersisBD = recuperarPersistente((ObjectView) obj,classPersistente,fieldId);
							getObjectPersistente(objetoPersisBD,obj,inputXml.getCamposDeEntrada(),map);
							result.add(objetoPersisBD);
						}
						map.put(keyName,result);
				}else{
					Object objetoPersisBD = recuperarPersistente((ObjectView) objetoOV,classPersistente,fieldId);
					getObjectPersistente(objetoPersisBD,objetoOV,inputXml.getCamposDeEntrada(),map);
					map.put(keyName, objetoPersisBD);
				}
			}else{
				for(CampoEntrada campEntrada : inputXml.getCamposDeEntrada()){
					if(campEntrada.getName()!=null){
						//Recupero el value del OV y lo cargo en el map con el nombre seteado en el atributo name del operaciones.xml
						PropertyDescriptor propertyDescriptor = BeanUtils.getPropertyDescriptor(objetoOV.getClass(), campEntrada.getPropertyOV());
						Object value = propertyDescriptor.getReadMethod().invoke(objetoOV, new Object[]{});
						map.put(campEntrada.getName(), value);
					}
				}
			}
		}
		return map;
	}


	public void getObjectPersistente(Object objetoPersistente, Object ov, List<CampoEntrada> camposDeEntrada, Map<String, Object> map) throws JakartaException{

		for (CampoEntrada campoEntrada : camposDeEntrada) {
			String metodo = campoEntrada.getMetodo();
			String nombreCampoOV = campoEntrada.getPropertyOV();
			String name=campoEntrada.getName();
			
			//Si lo tengo que setear en el metodo del persistente
			if(metodo!=null){
				if(campoEntrada.getCamposDeEntrada()!=null && !campoEntrada.getCamposDeEntrada().isEmpty()){
					Class<?> classSetter=null;
					Method method ;
					Object listOVs = callGetObject(ov,nombreCampoOV);
					try{
				
						if(Set.class.isAssignableFrom(listOVs.getClass())){
							method = objetoPersistente.getClass().getMethod(metodo, Set.class);
						}else{
							method = objetoPersistente.getClass().getMethod(metodo, List.class);
						}
						
						Type[] genericParameterTypes = method.getGenericParameterTypes();
	
						for(Type genericParameterType : genericParameterTypes){
						    if(genericParameterType instanceof ParameterizedType){
						        ParameterizedType aType = (ParameterizedType) genericParameterType;
						        classSetter= (Class<?>) aType.getActualTypeArguments()[0];
						    }	
						}
					}catch(Exception e){
						throw new JakartaException("error leyendo setter del metodo "+metodo+" del tipo lista");
					}
					if(classSetter==null){
						throw new JakartaException("Error al obtener la clase de la lista");
					}
					
					String fieldIDList = campoEntrada.getFieldID(false);
					
					Object value=null;
					if(List.class.isAssignableFrom(listOVs.getClass())){
						List list=new ArrayList();
						for (Object objListOV : (List)listOVs) {
							//Obtengo la clase de lo que tengo que buscar en BD
							Object objPersistenteDeLista = recuperarPersistente((ObjectView) objListOV, classSetter,fieldIDList);
							getObjectPersistente(objPersistenteDeLista, objListOV, campoEntrada.getCamposDeEntrada(),map);
							list.add(objPersistenteDeLista);
						}
						value=list;
					}else{
						if(Set.class.isAssignableFrom(listOVs.getClass())){
							Set set=new HashSet();
							for (Object objListOV : (Set)listOVs) {
								//Obtengo la clase de lo que tengo que buscar en BD
								Object objPersistenteDeLista = recuperarPersistente((ObjectView) objListOV, classSetter,fieldIDList);
								getObjectPersistente(objPersistenteDeLista, objListOV, campoEntrada.getCamposDeEntrada(),map);
								set.add(objPersistenteDeLista);
							}
							value=set;
						}
					}
					
					try {
						method.invoke(objetoPersistente, value);
					} catch (Exception e) {
						throw new JakartaException("Error al guardar metodo de lista con metodo"+metodo,e);
					}
				
				}else{
					Method persisMethod = BeanUtils.findMethodWithMinimalParameters(objetoPersistente.getClass(), metodo);
					if(persisMethod==null){
						throw new JakartaException("Method inexistente para el campo "+nombreCampoOV+" para la clase "+objetoPersistente.getClass());
					}
					Class<?>[] parameterTypes = persisMethod.getParameterTypes();
					if(parameterTypes== null || parameterTypes.length==0){
						throw new JakartaException("Mal configurado el setter con nombre "+metodo+" para la clase "+objetoPersistente.getClass());
					}
					Class<?> classSetter= parameterTypes[0];
					
					//primitivo
					PropertyDescriptor propertyDescriptor = BeanUtils.getPropertyDescriptor(ov.getClass(), nombreCampoOV);
					Method readMethod ;
					if(propertyDescriptor !=null)
						readMethod= propertyDescriptor.getReadMethod();
					else
						throw new JakartaException("no se encontro el campo "+nombreCampoOV + " en la clase OV " +ov.getClass().getName());
					Object valueOV;
					try {
						valueOV = readMethod.invoke(ov, new Object[]{});
					} catch (Exception e){
						throw new JakartaException("Error al leer el campo "+nombreCampoOV+" del OV" +ov.getClass().getName());
					}
	
					if(PersistentEntity.class.isAssignableFrom(classSetter)){
						long idLong= valueOV==null ? -1 : (Long)valueOV;
	
						//relacion de entidad, lo que me guarda es el id del objeto
						valueOV = recuperarPersistente(idLong, classSetter);
					}
					try{
						persisMethod.invoke(objetoPersistente, valueOV);
					}catch(Exception e){
						e.printStackTrace();
						throw new JakartaException("Error leyendo el OV o escribiendo en persistente");
					}
					
				}
			}
			if(name!=null){
				try{
					//Recupero el value del OV y lo cargo en el map con el nombre seteado en el atributo name del operaciones.xml
					PropertyDescriptor propertyDescriptor = BeanUtils.getPropertyDescriptor(ov.getClass(), campoEntrada.getPropertyOV());
					Object value = propertyDescriptor.getReadMethod().invoke(ov, new Object[]{});
					map.put(campoEntrada.getName(), value);
				}catch(Exception e){
					throw new JakartaException("Error al querer cargar el atributo "+campoEntrada.getPropertyOV()+ " al map",e);
				}
			}
		}
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
	
	private Object recuperarPersistente(ObjectView objetoOV, Class<?> persistClass,String fieldId) throws JakartaException {
		try {
			//Recupero el objeto persistente
			PropertyDescriptor propertyDescriptor = BeanUtils.getPropertyDescriptor(objetoOV.getClass(), fieldId);
			Object id = propertyDescriptor.getReadMethod().invoke(objetoOV, new Object[]{});
			long idLong= id==null ? -1 : (Long)id;

			if (idLong < 1) {
				return BeanUtils.instantiate(persistClass);
			} else {
				session = sessionProvider.getSession();
				return session.get(persistClass, (Long) id);
			}
		} catch (Exception e) {
			throw new RuntimeException(
					"Error recuperando persistente",e);
		}
	}
	
	private Object recuperarPersistente(long id, Class<?> classSetter) throws JakartaException {
		try {
			if (id == 0) {
				return BeanUtils.instantiate(classSetter);
			} else if(id < 1){
				return null;
			} else {
				session = sessionProvider.getSession();
				return session.get(classSetter, (Long) id);
			}
		} catch (Exception e) {
			throw new JakartaException(
					"Error recuperando persistente");
		}
	}
}
