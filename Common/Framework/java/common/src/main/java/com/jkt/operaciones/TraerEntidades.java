package com.jkt.operaciones;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.JakartaException;
import com.jkt.xmlreader.Lista;
import com.jkt.xmlreader.PropertySolver;

/**
 * Esta operación recupera entidades.
 * Lo mejor será utilizar dos operaciones separadas pero desde frontend solicitan esta funcionalidad.
 * Recordar que cada clase debe tener su propia y ï¿½nica responsabilidad, y en este caso la clase tiene dos responsabilidades:
 * 1-recuperar 1 entidad
 * 2-recuperar N entidades.
 * 
 * 
 * La segunda funcionalidad importante es recuperar las relaciones de cada entidad utilizando los tags LISTA y LISTAS de los archivos de operaciones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@OperacionBean
public class TraerEntidades extends Operation {

	private static final String KEY_ENTIDAD = "entidad";
	private static final String KEY_OID = "oid".toUpperCase();

	public void execute(Map<String, Object> aParams) throws Exception {
		String nombreClase = (String)aParams.get(KEY_ENTIDAD);
		String oidEntity = (String) aParams.get(KEY_OID);
		List<Lista> obtenerListas = ev.obtenerListas();
		
		List<PersistentEntity> allElements;
		if (oidEntity==null) {
			allElements = serviceRepository.getAll(Class.forName(nombreClase));
		}else if(oidEntity.isEmpty()){
			throw new JakartaException("Debe completar el campo ID.");
		}else{
			allElements = new ArrayList<PersistentEntity>();
			PersistentEntity entity = serviceRepository.getByOid(Class.forName(nombreClase), Long.valueOf(oidEntity).longValue());
			
			if (entity==null) {
				throw new EntityNotFoundException("No existe la entidad solicitada con el ID recibido.");
			}
			allElements.add(entity);
		}
		
		for (PersistentEntity persistentEntity : allElements) {
			notificarObjeto("resultado", persistentEntity);
			
			for (Lista lista : obtenerListas) {
				mostrarResultados(Class.forName(nombreClase), persistentEntity, lista);
			}
		}
		
	}
	
	/**
	 * FIXME Este metodo fue copiado desde la clase {@link PropertySolver}
	 * Estaria bueno ver la forma de utilizarlo con esta clase directamente, hacer el metodo estatico
	 * 
	 */
	private String armarMetodo(String aName) {
		String priLetra = "" + aName.charAt(0);
		String metodo = "get" + priLetra.toUpperCase() + aName.substring(1, aName.length());
		return metodo;
	}
	
	@SuppressWarnings({"unchecked","rawtypes"})
	private void mostrarResultados(Class clase, Object objeto, Lista lista) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		
		Method method = clase.getMethod(armarMetodo(lista.getNombreLista()));
		List coleccion=(List) method.invoke(objeto);
		
		for (Object elementoDeLista : coleccion) {
			if (elementoDeLista!=null) {
				notificarObjeto(lista.getNombreWriter(), elementoDeLista);

				if(lista.tieneHijos()){
					for (Lista subLista : lista.getListas()) {
						mostrarResultados(elementoDeLista.getClass(), elementoDeLista, subLista);
					}
				}
			}
		}
	}
	
}
