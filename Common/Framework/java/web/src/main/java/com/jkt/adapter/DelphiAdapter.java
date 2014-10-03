package com.jkt.adapter;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.validation.ConstraintViolation;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.jkt.constantes.TiposDeDato;
import com.jkt.dominio.Container;
//import com.jkt.dominio.Factura;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionException;
import com.jkt.persistencia.ISessionProvider;
import com.jkt.request.EventBusiness;
import com.jkt.service.SessionProvider;
import com.jkt.util.Campos;
import com.jkt.util.MapDS;
import com.jkt.util.Registro;
import com.jkt.util.Tabla;
import com.jkt.xmlreader.CampoEntrada;
import com.jkt.xmlreader.Input;

/**
 * Adapter para transformar las peticiones desde y hacia el cliente delphi.
 * 
 * 
 * @see Input
 * @see CampoEntrada
 * @see EventBusiness
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Component
@Qualifier("delphiAdapter")
public class DelphiAdapter implements Adapter<Map, MapDS> {

	private static final String BYTE_ARRAY_TYPE = TiposDeDato.BYTE_ARRAY_TYPE;
	private static final String STRING_TYPE = "String";
	private static final String BOOLEAN_TYPE = "Boolean";
	private static final String INTEGER_TYPE = "Integer";
	private static final String DOUBLE_TYPE = "Double";
	private static final String DATE_TYPE = "Date";

	private ISessionProvider sessionProvider;
	private Session session;
	private boolean test;
	
	/*
	 * Definici�n de estregias para el guardado de parametros.
	 * B�sicamente las estrategias definen funcionalidad para cuando el parametro a trabajar es uno solo, o es una lista de objetos.
	 * Dependiendo de la cantidad de registros recibidos desde la solicitud, se define una u otra estrategia.
	 * 
	 * Si la cantidad de registros es mayor a 1, se usa la estrategia para manejar listas, de lo contrario, se usa la estrategia para manejar un solo parametro.
	 * 
	 */
	private AdapterStrategy strategy=null;
	
	public AdapterStrategy getStrategy() {
		return strategy;
	}

	public void setStrategy(AdapterStrategy strategy) {
		this.strategy = strategy;
	}

	private abstract class AdapterStrategy{
		protected Object instance;
		protected abstract void resolverInstancia(Object instance);
		
		public Object getInstance(){
			return instance;
		}
	}
	
	private class StrategyOneInstance extends AdapterStrategy{
		@Override
		protected void resolverInstancia(Object instance) {
			this.instance=instance;
		}
	}

	private class StrategyManyInstances extends AdapterStrategy{
		public StrategyManyInstances() {
			instance=new ArrayList<Object>();
		}
		@Override
		protected void resolverInstancia(Object instance) {
			((List)this.instance).add(instance);
		}
		
	}
	/*
	 * FIN de definici�n de las estrategias.
	 * 
	 */
	
	public Map adaptRequest(MapDS input, EventBusiness operation) throws Exception,EntityNotFoundException {
		session = sessionProvider.getSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
		}catch(org.hibernate.TransactionException e){
			throw new JakartaException("Espere unos segundos mientras finaliza una operacion pendiente...Intente nuevamente en breves segundos...");
		}	
		try{
			Map map = adaptRequestHook(input, operation);
			tx.commit();
			return map;
		}catch(JakartaException e){
			tx.rollback();
			sessionProvider.destroySession();
			throw e;
		}catch(javax.validation.ConstraintViolationException e){
				Set<ConstraintViolation<?>> constraintViolations = e.getConstraintViolations();
				constraintViolations.size();
				StringBuffer buffer=new StringBuffer();
				String message = null;
				
				for (ConstraintViolation<?> constraintViolation : constraintViolations) {
					buffer.append(constraintViolation.getMessage());
					break;
				}
				
				tx.rollback();
				sessionProvider.destroySession();
				
				throw new ValidacionException(buffer.toString());
		}catch(Exception e){
			tx.rollback();
			sessionProvider.destroySession();
			
			if (e.getCause()!=null) {
				throw new JakartaException(e.getCause().getMessage());
			}else{
				throw e;
			}
		}
		
//		finally{
//				if (tx.isActive()) {
//					tx.commit();
//				}
//				sessionProvider.destroySession();
//		}
	}
	
	private Map adaptRequestHook(MapDS input, EventBusiness operation) throws Exception,EntityNotFoundException {
		
		final HashMap<String, Object> finalResult = new HashMap<String, Object>();
		String keyName="";
		
		List<Tabla> collection = ((MapDS)input).getCollectionOfTables();

		List<Campos> camposCollection = ((MapDS)input).getCollectionOfCampos();
		for (Campos campos : camposCollection) {
//			if (!campos.getCampos().containsKey("key")) {
//				//log this element!
//				continue;
//			}
			if (campos.getCampos().containsKey("oid") && campos.getCampos().containsKey("class") && campos.getCampos().containsKey("key")) {
				if (!test){
				   PersistentEntity objetoRecuperado = recuperarObjecto(Class.forName(campos.getCampos().get("class")), Long.valueOf(campos.getCampos().get("oid")));
				   finalResult.put((String)campos.getCampos().get("key"), objetoRecuperado);
				}
			}else{
//				finalResult.put((String)campos.getCampos().get("key"),(String)campos.getCampos().get("value"));
				
				Map<String,String> valoresDelTagCampos = campos.getCampos();
				Entry<String,String> entry=null;
				
				for (Iterator<Entry<String, String>> iterator = valoresDelTagCampos.entrySet().iterator(); iterator.hasNext();) {
					entry = (Entry<String,String>) iterator.next();
					finalResult.put(entry.getKey(), entry.getValue());
				}
			}
		}
		
		
		
		/*
		 * Recorrer todas las tablas.
		 * Por cada tabla, un parametro en el mapa final que se devuelve como resultado
		 */
		for (Tabla table : collection) {
			
			//RECUPERO EL INPUT!!
			Input inputElement = operation.getHijoInput((String) table.getAtribute("nombre"));
			keyName=inputElement.getKeyName();

			//Recupera el nombre de la variable que contendra el ID que puede servir para recuperar una entidad de la base de datos.
			final String keyParaRecuperarObjeto = inputElement.getFieldID();
			if (keyParaRecuperarObjeto == null || keyParaRecuperarObjeto.isEmpty()){
				throw new JakartaException("No esta en operaciones.xml el FieldID");
			}
			
			//Se obtiene el tipo de clase de la tabla. Todos los registros de este nivel ser�n de esta clase
			Class<?> clazz = null;
			if (! test){
			   try{
			     clazz = Class.forName(inputElement.getClase());
			   }
			   catch (ClassNotFoundException e){
				   throw new JakartaException("La clase " + inputElement.getClase() + " no existe");
			   }
			}
			//Setear la estrategia para determinar si es un objeto unico o una lista de los mismos...
			List<Registro> registros = table.getRegitros();
			if (registros.size()>1) {
				setStrategy(new StrategyManyInstances());
			}else{
				setStrategy(new StrategyOneInstance());
			}
			

			//Para cada registro que obtenga, se generar� una nueva instancia del objeto
			Object instance = null;
			MapDS mapaConCampos = null;
			long oid;
			PersistentEntity entity = null;
//			CampoEntrada campoEntrada = null;
			
			for (Registro registro : registros) {
				mapaConCampos = registro.getCampos();
				
				//Busqueda de instancia en el repositorio
				if (keyParaRecuperarObjeto==null) {
					oid=0;
				}else{
					if (! mapaConCampos.containsKey(keyParaRecuperarObjeto)){
						throw new JakartaException("El campo " + keyParaRecuperarObjeto + " no viene de delphi");
					}
					oid = Long.valueOf((String) mapaConCampos.get(keyParaRecuperarObjeto));
				}
				if (! test){
				   entity = recuperarObjecto(clazz, oid);
				}
				if(entity!=null){
					instance=entity;
				}
				//Busqueda de instancia en el repositorio
				
				
				
				List<CampoEntrada> camposDeEntrada = inputElement.getCamposDeEntrada();
				for (CampoEntrada campoEntrada : camposDeEntrada) {
					MapDS campos = null;
					Registro primerRegistro;
					CampoEntrada metaDataOfCurrentField=null; 
					Entry<Object, Object> entry=null;
					
					for (Iterator<Entry<Object, Object>> iterator = mapaConCampos.entrySet().iterator(); iterator.hasNext();) {
						entry = (Entry<Object, Object>) iterator.next();
						String key = (String)entry.getKey();
						if (keyParaRecuperarObjeto.equals(key)){
							continue;
						}
						metaDataOfCurrentField = campoEntrada.getHijo((String)entry.getKey());
						
						if (metaDataOfCurrentField==null) {
//							continue;
							throw new JakartaException("El campo: "  + (String)entry.getKey() + " no esta en operaciones.xml");
//							throw new JakartaException("El campo: "  + (String)entry.getKey() + " no esta en operaciones.xml");
						}
						
						/*
						 * La generaci�n de cada campo puede ser primitiva o compuesta.
						 * Compuesta va a ser si el valor del parametro es una tabla. En este caso se usara un metodo recursivo
						 */
						if(esTabla(entry.getValue())){
							//Creo la instancia del objeto compuesto
							Class<?> complexClazz = null;
							if (!test){
							  try{	
							   complexClazz = Class.forName(metaDataOfCurrentField.getClase());
							  
							  } catch (ClassNotFoundException e) {
								  throw new JakartaException("Clase: " + metaDataOfCurrentField.getClase() + " Inexistente");
							  }
							}
							
							Object complexInstance=null;// = complexClazz.newInstance();
							
							
							List<Registro> registross=((Tabla) entry.getValue()).getRegitros();
							Long idObject=null;
							for (Registro reg : registross) {
								
								String keyParaRecuperarObjetoHijo = metaDataOfCurrentField.getFieldID();
								
								if (keyParaRecuperarObjetoHijo==null) {
									//idObject=Long.valueOf(0);
									  throw new JakartaException(" No esta configurado el campo FieldID");
										
								}else{
									String value = (String) reg.getCampos().get(keyParaRecuperarObjetoHijo);
									if (value==null || value.isEmpty()) {
										// idObject = Long.valueOf(0);
										 throw new JakartaException("El campo: " + keyParaRecuperarObjetoHijo + " no viene en los datos que envia Delphi");
									}else{
										idObject = Long.valueOf(value);
									}
								}
							
								if (!test){
								   complexInstance = recuperarObjecto(complexClazz, idObject.longValue());
								   if (complexInstance==null) {
										complexInstance = complexClazz.newInstance();
									}
								}
								else{
									complexInstance  = new Container("test");
								}
								
								//Obtengo todos los campos que contiene el elemento actual
								campos = reg.getCampos();
								CampoEntrada childCampoEntrada=null;
								Entry<Object, Object> entryR=null;
								for (Iterator<Entry<Object, Object>> iteratorR = campos.entrySet().iterator(); iteratorR.hasNext();) {
									entryR = (Entry<Object, Object>) iteratorR.next();
									childCampoEntrada = metaDataOfCurrentField.getHijo((String)entryR.getKey());
									
									
									//TODO ESTA MAL ESTE COMPORTAMIENDO QUE HIZO DANIEL, ESTOY PASANDO EL VALOR CON =0 Y LEVANTA ESTA EXCEPCION
									/*
									if (childCampoEntrada==null){
										 throw new JakartaException("El campo: " + (String)entryR.getKey() + " no viene en los datos que envia Delphi");
									}
									*/
									if (keyParaRecuperarObjeto.equals(entry.getKey()) || childCampoEntrada==null) {
										continue;
									}
									
								
									if(esTabla(entryR.getValue())){
										resolverCampoCompuesto(complexClazz, complexInstance, childCampoEntrada, ((Tabla)entryR.getValue()).getRegitros());
									}else{
										resolvePrimitiveObject(childCampoEntrada, complexClazz, complexInstance, entryR.getValue());
									}
								}
								if (! test){
								 try{
								   Class<?> otraClase = Class.forName(metaDataOfCurrentField.getClase());
					     		   Method method = clazz.getMethod(metaDataOfCurrentField.getMetodo(), otraClase);								
								   method.invoke(instance,complexInstance);
								 }
								 catch(ClassNotFoundException e){
									throw new JakartaException("La clase " + metaDataOfCurrentField.getClase() + " no existe" );
								 }
								 catch(NoSuchMethodException e){
									 throw new JakartaException("No se puede ejecutar el metodo ".concat(metaDataOfCurrentField.getMetodo()));
								 }
								}
							}
							/*
							primerRegistro=(Registro) ((Tabla) entry.getValue()).getRegitros().get(0);//TODO Hacer para N registros
							
							//Obtengo todos los campos que contiene el elemento actual
							campos = primerRegistro.getCampos();
							CampoEntrada childCampoEntrada=null;
							Entry<Object, Object> entryR=null;
							for (Iterator<Entry<Object, Object>> iteratorR = campos.entrySet().iterator(); iteratorR.hasNext();) {
								entryR = (Entry<Object, Object>) iteratorR.next();
								childCampoEntrada = metaDataOfCurrentField.getHijo((String)entryR.getKey());
								if(esTabla(entryR.getValue())){
									resolverCampoCompuesto(complexClazz, complexInstance, childCampoEntrada, ((Tabla)entryR.getValue()).getRegitros());
								}else{
									resolvePrimitiveObject(childCampoEntrada, complexClazz, complexInstance, entryR.getValue());
								}
							}
							*/
							
						}else{
							resolvePrimitiveObject(metaDataOfCurrentField, clazz, instance, entry.getValue());
						}
					}
				}
				
//				campoEntrada = camposDeEntrada.get(0);
				
//				}
				
				strategy.resolverInstancia(instance);
			}

			/*
			ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
			Validator validator = factory.getValidator();
			
			ArrayList<PersistentEntity> lista = (ArrayList<PersistentEntity>) strategy.getInstance();
			for (PersistentEntity persistentEntity : lista) {
				Set<ConstraintViolation<PersistentEntity>> validate = validator.validate(persistentEntity);
				if (validate.size()>0) {
					throw new Exception("Ocurrio un error. Su entidad no pasa las validaciones correspondientes.");
				}
			}
			*/
			
			Object object = strategy.getInstance();
			
			finalResult.put(keyName, object);
		}
		return finalResult;
	}

	/**
	 * @param clazz
	 * @param oid
	 * @return
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws Exception
	 */
	public PersistentEntity recuperarObjecto(Class<?> clazz, long oid) throws EntityNotFoundException,InstantiationException, IllegalAccessException{
		Object newInstance;
		if (oid<1) {//Si el id buscado es 0 o negativo, se retorna una nueva instancia
			newInstance	= clazz.newInstance();
		}else{
			newInstance=session.get(clazz, oid);
			if (newInstance==null) {
				throw new EntityNotFoundException(String.format("No existe la entidad de tipo %s con oid %s.", clazz.getSimpleName(), String.valueOf(oid)));
			}
		}
		return (PersistentEntity) newInstance;
	}

	/**
	 * Creates a String or Integer(Wrapper) for given parameters received
	 * Crea una cadena o un entero(Objeto entero, no primitivo) para dados parametros recibidos
	 * 
	 * @param value
	 * @param nombreClase
	 * @return
	 * @throws S 
	 */
	private Object resolvePrimitiveType(Object value, String nombreClase) throws JakartaException{
		Object result=null;
		
		if (STRING_TYPE.equals(nombreClase)) {
			result=(String) value;
		}else if(BYTE_ARRAY_TYPE.equals(nombreClase)){
			result=((String)value).getBytes();
		}else if (BOOLEAN_TYPE.equals(nombreClase)) {
			result="false".equals(((String)value).toLowerCase())?false:true;
		}else if(INTEGER_TYPE.equals(nombreClase)){
			result=Integer.valueOf((String)value);
		}else if(DOUBLE_TYPE.equals(nombreClase)){
			result=Double.valueOf((String)value);
		}else if(DATE_TYPE.equals(nombreClase)){
//			result=Date.parse((String)value);//  Double.valueOf((String)value);
		}else{
			try {
				session = sessionProvider.getSession();
				Transaction tx = session.getTransaction();
				result=session.get(Class.forName(nombreClase), Long.valueOf((String)value));
			} catch (NumberFormatException e) {
				throw new JakartaException("Este valor representa un oid, pero no es numerico.");
			} catch (ClassNotFoundException e) {
				throw new JakartaException("No existe la clase solicitada.");
			}
		}
		return result;
	}

	
	/**
	 * 
	 * Setea un campo simple a una instancia recibida.
	 * @throws JakartaException 
	 * @throws ClassNotFoundException 
	 * 
	 */
	private void resolvePrimitiveObject(CampoEntrada campoEntrada, Class clazz,Object instance,Object valueReceived) throws SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException, ClassNotFoundException{
		if (test){
			return;
		}
		Class primitiveWrapper;
		
		if (STRING_TYPE.equals(campoEntrada.getClase())) {
			primitiveWrapper=String.class;
		}else if (BYTE_ARRAY_TYPE.equals(campoEntrada.getClase())) {
			byte[] b = "".getBytes();
			primitiveWrapper=b.getClass();
		}else if(BOOLEAN_TYPE.equals(campoEntrada.getClase())){
			primitiveWrapper=boolean.class;
		}else if(INTEGER_TYPE.equals(campoEntrada.getClase())){
			primitiveWrapper=int.class;
		}else if(DOUBLE_TYPE.equals(campoEntrada.getClase())){
			primitiveWrapper=double.class;
		}else if(DATE_TYPE.equals(campoEntrada.getClase())){
			primitiveWrapper=Date.class;
		}else{
			primitiveWrapper=Class.forName(campoEntrada.getClase());
		}
		
//		Class primitiveWrapper=STRING_TYPE.equals(campoEntrada.getClase())?String.class:Integer.class;
		try{
			Method method = clazz.getMethod(campoEntrada.getMetodo(), primitiveWrapper);
			Object value=resolvePrimitiveType(valueReceived, campoEntrada.getClase());
			method.invoke(instance,value);
		}catch(NoSuchMethodException e){
			throw new JakartaException("No se puede ejecutar el metodo ".concat(campoEntrada.getMetodo()));
		}
	}
	
	
	private void resolverCampoCompuesto(Class parentClass, Object parentObject, CampoEntrada parentMetadata, List<Registro> registros ) throws SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, ClassNotFoundException, InstantiationException, JakartaException{
		
		//Cada vez que se genera esta iteracion, creo una nueva estrategia...
//		AdapterStrategy estrategia=null;
		if (registros.size()==0) {
//			throw new JakartaException("No debe enviar estructuras vacias. Si envía una tabla, debe tener mínimamente una fila.");
			return;
		}
		
		
		//creacion de clase e instancia del objeto compuesto.
		Class<?> childClazz  = null;
		Object childInstance = null;
		
		
		
		for (Registro registro : registros) {

			
			
			
//			Registro primerRegistro=registros.get(0);//es un for esto!
			
//			if (registros.size()>1) {
//				estrategia=new StrategyManyInstances();
//			}else{
//				estrategia=new StrategyOneInstance();
//			}
			
			//Obtengo todos los campos que contiene el elemento actual
			MapDS campos = registro.getCampos();
			String keyParaRecuperarObjeto = parentMetadata.getFieldID();
			if (keyParaRecuperarObjeto == null || keyParaRecuperarObjeto.isEmpty()){
				throw new JakartaException("No esta en operaciones.xml el FieldID");
			}
			
			if (!test){
				try{
					childClazz = Class.forName(parentMetadata.getClase());
				}
				catch (ClassNotFoundException e){
					throw new JakartaException("La clase: " + parentMetadata.getClase() + " es Inexistente");
				}
				
				if (Long.valueOf((String) campos.get(keyParaRecuperarObjeto))>0) {
					childInstance=recuperarObjecto(childClazz, Long.valueOf((String) campos.get(keyParaRecuperarObjeto)));
				}else{
					childInstance = childClazz.newInstance();
				}
			}
			
			for (Iterator<Entry<Object, Object>> iteratorR = campos.entrySet().iterator(); iteratorR.hasNext();) {
				Entry<Object, Object> entryR = (Entry<Object, Object>) iteratorR.next();
				
				CampoEntrada childMetadata = parentMetadata.getHijo((String)entryR.getKey());
				
				
				if (childMetadata==null) {
					continue;
				}
//				if (keyParaRecuperarObjeto.equals(entry.getKey()) || childCampoEntrada==null) {
//					continue;
//				}
				
				if(esTabla(entryR.getValue())){
					resolverCampoCompuesto(childClazz, childInstance, childMetadata, ((Tabla)entryR.getValue()).getRegitros());
				}else{
					resolvePrimitiveObject(childMetadata, childClazz, childInstance, entryR.getValue());
				}
			}
			if (!test){
				try{
					Class<?> otraClase = Class.forName(parentMetadata.getClase());
					Method method = parentClass.getMethod(parentMetadata.getMetodo(), otraClase); //Generalmente va a ser un metodo addEntidad, agregarAlgo; hacia una coleccion
					method.invoke(parentObject,childInstance);
				}catch(NoSuchMethodException e){
					throw new JakartaException("No se puede ejecutar el metodo ".concat(parentMetadata.getMetodo()));
				}
			}
		}
		
		

	}
	
	private boolean esTabla(Object obj){
		return obj instanceof Tabla;
	}

	@Autowired
	public void setSession(SessionProvider sessionProvider) {
		this.sessionProvider=sessionProvider;
	}
	

	public void setTest(boolean aTest) {
		test = aTest;
		
	}

}
