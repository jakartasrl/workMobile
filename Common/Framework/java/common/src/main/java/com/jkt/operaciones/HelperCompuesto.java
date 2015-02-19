package com.jkt.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Filtro;
import com.jkt.dominio.IDetalle;
import com.jkt.excepcion.JakartaException;

/**
 * <p>Esta operacion retorna una lista de objetos (Del tipo que se solicita desde el parametro entidad) y los filtra utilizando su entidad padre, o el maestro.</p>
 * <p>Solamente se muestran los datos activos, ya que es solamente una operacion de consulta y no se podra modificar el estado.</p>
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class HelperCompuesto extends Helper {

	private static final String OID_ENTIDAD_MAESTRA = "oidentidadmaestra".toUpperCase();

	protected List recuperarObjetoUsandoKey(Map<String, Object> aParams) throws JakartaException {
		validarEntrada(aParams.get(OID_ENTIDAD_MAESTRA));
		
		String nombreEntidad=(String) aParams.get(KEY_ENTIDAD);
		String className = this.getRepositorioClases().getClass(nombreEntidad);
		
		Class<?> clazz;
		Object newInstance = null;
		
		try {
			clazz = Class.forName(className);
			newInstance = clazz.newInstance();
			
			if (!IDetalle.class.isAssignableFrom(clazz)) {
				throw new JakartaException(String.format("La entidad %s no es un detalle de la relacion maestro-detalle.", clazz.getSimpleName()));
			}
			
		} catch (InstantiationException e) {
			levantarExcepcion();
		} catch (IllegalAccessException e) {
			levantarExcepcion();
		} catch (ClassNotFoundException e) {
			levantarExcepcion();
		}

		String oidEntidadMaestra=(String) aParams.get(OID_ENTIDAD_MAESTRA);
		
		Filtro filtroActivo = crearFiltro("activo","true","igual","boolean");
		
		IDetalle detalle=(IDetalle) newInstance;
		
		//El filtro buscado serÃ¡ del tipo impuesto.categoria.id=55;
		Filtro filtroMaestro = crearFiltro(detalle.getNombreDeMaestro().concat(".id"),oidEntidadMaestra,"igual","integer");
//		Filtro filtroMaestro = crearFiltro(entidadMaestra.concat(".id"),oidEntidadMaestra,"igual","integer");
		
		return Arrays.asList(filtroActivo,filtroMaestro);
	}

	private void levantarExcepcion() throws JakartaException {
		throw new JakartaException("Ocurrió un error al intentar recuperar la clase solicitada.");		
	}
	
}
