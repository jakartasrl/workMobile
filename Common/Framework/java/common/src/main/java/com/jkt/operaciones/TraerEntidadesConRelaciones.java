package com.jkt.operaciones;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.xmlreader.Lista;
import com.jkt.xmlreader.PropertySolver;

/**
 * <p>Recupera todas las entidades que se indican por medio del parametro 'entidad' seteado en el archivo de operaciones(xml)</p>
 * <p>Muestra en la salida todas las entidades recuperadas desde la base, y ademas las
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerEntidadesConRelaciones extends Operation {

	private static final String KEY_ENTIDAD = "entidad";

	@Override
	@SuppressWarnings("unchecked")
	public void execute(Map<String, Object> aParams) throws Exception {
			validarEntrada(aParams.get(KEY_ENTIDAD));
		
			String nombreClase = (String)aParams.get(KEY_ENTIDAD);
			List<Lista> obtenerListas = ev.obtenerListas();
			
			Class<?> clase = Class.forName(nombreClase);
			List<PersistentEntity> elementos = obtenerTodos((Class<? extends PersistentEntity>) clase);

			for (PersistentEntity persistentEntity : elementos) {
				notificarObjecto("entidad", persistentEntity);

				for (Lista lista : obtenerListas) {
					mostrarResultados(clase, persistentEntity, lista);
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
				notificarObjecto(lista.getNombreWriter(), elementoDeLista);

				if(lista.tieneHijos()){
					for (Lista subLista : lista.getListas()) {
						mostrarResultados(elementoDeLista.getClass(), elementoDeLista, subLista);
					}
				}
			}
		}
	}
	
	
}
