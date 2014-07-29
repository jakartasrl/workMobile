package com.jkt.adapter;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.JakartaException;
import com.jkt.persistencia.IServiceRepository;
import com.jkt.request.EventBusiness;
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

	private static final String BYTE_ARRAY_TYPE = "ByteArray";
	private static final String STRING_TYPE = "String";
	private static final String BOOLEAN_TYPE = "Boolean";

	@Autowired
	private IServiceRepository repository;

	
	public IServiceRepository getRepository() {
		return repository;
	}

	public void setRepository(IServiceRepository repository) {
		this.repository = repository;
	}

	/*
	 * Definición de estregias para el guardado de parametros.
	 * Básicamente las estrategias definen funcionalidad para cuando el parametro a trabajar es uno solo, o es una lista de objetos.
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
	 * FIN de definición de las estrategias.
	 * 
	 */
	
	public Map adaptRequest(MapDS input, EventBusiness operation) throws Exception,EntityNotFoundException {
		
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
				PersistentEntity objetoRecuperado = recuperarObjecto(Class.forName(campos.getCampos().get("class")), Long.valueOf(campos.getCampos().get("oid")));
				finalResult.put((String)campos.getCampos().get("key"), objetoRecuperado);
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
			
			//Se obtiene el tipo de clase de la tabla. Todos los registros de este nivel serán de esta clase
			Class<?> clazz = Class.forName(inputElement.getClase());
			
			//Setear la estrategia para determinar si es un objeto unico o una lista de los mismos...
			List<Registro> registros = table.getRegitros();
			if (registros.size()>1) {
				setStrategy(new StrategyManyInstances());
			}else{
				setStrategy(new StrategyOneInstance());
			}
			

			//Para cada registro que obtenga, se generará una nueva instancia del objeto
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
					oid = Long.valueOf((String) mapaConCampos.get(keyParaRecuperarObjeto));
				}
				entity = recuperarObjecto(clazz, oid);
				
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
						
						metaDataOfCurrentField = campoEntrada.getHijo((String)entry.getKey());
						
						if (metaDataOfCurrentField==null) { continue; }
						
						/*
						 * La generación de cada campo puede ser primitiva o compuesta.
						 * Compuesta va a ser si el valor del parametro es una tabla. En este caso se usara un metodo recursivo
						 */
						if(esTabla(entry.getValue())){
							//Creo la instancia del objeto compuesto
							Class<?> complexClazz = Class.forName(metaDataOfCurrentField.getClase());
							
							
							Object complexInstance=null;// = complexClazz.newInstance();
							
							
							List<Registro> registross=((Tabla) entry.getValue()).getRegitros();
							Long idObject=null;
							for (Registro reg : registross) {
								
								if (keyParaRecuperarObjeto==null) {
									idObject=Long.valueOf(0);
								}else{
									String value = (String) reg.getCampos().get(keyParaRecuperarObjeto);
									if (value==null || value.isEmpty()) {
										idObject = Long.valueOf(0);
									}else{
										idObject = Long.valueOf(value);
									}
								}
							
								complexInstance = recuperarObjecto(complexClazz, idObject.longValue());
								
								if (complexInstance==null) {
									complexInstance = complexClazz.newInstance();
								}
								//Obtengo todos los campos que contiene el elemento actual
								campos = reg.getCampos();
								CampoEntrada childCampoEntrada=null;
								Entry<Object, Object> entryR=null;
								for (Iterator<Entry<Object, Object>> iteratorR = campos.entrySet().iterator(); iteratorR.hasNext();) {
									entryR = (Entry<Object, Object>) iteratorR.next();
									childCampoEntrada = metaDataOfCurrentField.getHijo((String)entryR.getKey());
									
									if (keyParaRecuperarObjeto.equals(entry.getKey()) || childCampoEntrada==null) {
										continue;
									}
									
									if(esTabla(entryR.getValue())){
										resolverCampoCompuesto(complexClazz, complexInstance, childCampoEntrada, ((Tabla)entryR.getValue()).getRegitros());
									}else{
										resolvePrimitiveObject(childCampoEntrada, complexClazz, complexInstance, entryR.getValue());
									}
								}
								
								Class<?> otraClase = Class.forName(metaDataOfCurrentField.getClase());
								Method method = clazz.getMethod(metaDataOfCurrentField.getMetodo(), otraClase);
								
								/*
								 * PROXY INITIALIZATION EXCEPTION
								 */
								if (idObject>0) {
									//ejecuta transaccionalmente el metodo!
									this.repository.executeMethodTransactional(method, instance, complexInstance);
									
								}else{
									method.invoke(instance,complexInstance);
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
			
			ArrayList<Factura> lista = (ArrayList<Factura>) strategy.getInstance();
			Factura factura = lista.get(0);
			Set<ConstraintViolation<Factura>> validate = validator.validate(factura);
			if (validate.size()>0) {
				throw new RuntimeException("Valide su entidad");
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
			try{
				newInstance=repository.getByOid(clazz, oid);
			}catch(Exception e){
				throw new EntityNotFoundException(String.format("No existe la entidad de tipo %s con oid %s.", clazz, String.valueOf(oid)));
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
	 */
	private Object resolvePrimitiveType(Object value, String nombreClase){
		Object result=null;
		
		if (STRING_TYPE.equals(nombreClase)) {
			result=(String) value;
		}else if(BYTE_ARRAY_TYPE.equals(nombreClase)){
			result=((String)value).getBytes();
		}else if (BOOLEAN_TYPE.equals(nombreClase)) {
			result="true".equals(((String)value).toLowerCase())?true:false;
		}else{
			result=Integer.valueOf((String)value);
		}
		return result;
	}

	
	/**
	 * 
	 * Setea un campo simple a una instancia recibida.
	 * 
	 */
	private void resolvePrimitiveObject(CampoEntrada campoEntrada, Class clazz,Object instance,Object valueReceived) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		
		Class primitiveWrapper;
		
		if (STRING_TYPE.equals(campoEntrada.getClase())) {
			primitiveWrapper=String.class;
		}else if (BYTE_ARRAY_TYPE.equals(campoEntrada.getClase())) {
			byte[] b = "".getBytes();
			primitiveWrapper=b.getClass();
		}else if(BOOLEAN_TYPE.equals(campoEntrada.getClase())){
			primitiveWrapper=boolean.class;
		}else{
			primitiveWrapper=Integer.class;
		}
		
//		Class primitiveWrapper=STRING_TYPE.equals(campoEntrada.getClase())?String.class:Integer.class;
		Method method = clazz.getMethod(campoEntrada.getMetodo(), primitiveWrapper);
		Object value=resolvePrimitiveType(valueReceived, campoEntrada.getClase());
		method.invoke(instance,value);
	}
	
	
	private void resolverCampoCompuesto(Class parentClass, Object parentObject, CampoEntrada parentMetadata, List<Registro> registros ) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, ClassNotFoundException, InstantiationException{
		
		//Cada vez que se genera esta iteracion, creo una nueva estrategia...
//		AdapterStrategy estrategia=null;
		
		
		//creacion de clase e instancia del objeto compuesto.
		Class<?> childClazz = Class.forName(parentMetadata.getClase());
		Object childInstance = childClazz.newInstance();
		
		Registro primerRegistro=registros.get(0);//es un for esto carajo!
		
//		if (registros.size()>1) {
//			estrategia=new StrategyManyInstances();
//		}else{
//			estrategia=new StrategyOneInstance();
//		}
		
		//Obtengo todos los campos que contiene el elemento actual
		MapDS campos = primerRegistro.getCampos();
		
		for (Iterator<Entry<Object, Object>> iteratorR = campos.entrySet().iterator(); iteratorR.hasNext();) {
			Entry<Object, Object> entryR = (Entry<Object, Object>) iteratorR.next();
			
			CampoEntrada childMetadata = parentMetadata.getHijo((String)entryR.getKey());
			
			if(esTabla(entryR.getValue())){
				resolverCampoCompuesto(childClazz, childInstance, childMetadata, ((Tabla)entryR.getValue()).getRegitros());
			}else{
				resolvePrimitiveObject(childMetadata, childClazz, childInstance, entryR.getValue());
			}
		}
		
		Class<?> otraClase = Class.forName(parentMetadata.getClase());
		Method method = parentClass.getMethod(parentMetadata.getMetodo(), otraClase);
		method.invoke(parentObject,childInstance);
	}
	
	private boolean esTabla(Object obj){
		return obj instanceof Tabla;
	}

}
