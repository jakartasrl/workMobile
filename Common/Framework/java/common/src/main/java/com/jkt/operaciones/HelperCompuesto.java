package com.jkt.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Filtro;
import com.jkt.excepcion.JakartaException;

/**
 * <p>Esta operacion retorna una lista de objetos (Del tipo que se solicita desde el parametro entidad) y los filtra utilizando su entidad padre, o el maestro.</p>
 * <p>Solamente se muestran los datos activos, ya que es solamente una operacion de consulta y no se podra modificar el estado.</p>
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class HelperCompuesto extends Helper {

	private static final String ENTIDAD_MAESTRA = "entidadmaestra".toUpperCase();
	private static final String OID_ENTIDAD_MAESTRA = "oidentidadmaestra".toUpperCase();

	protected List recuperarObjetoUsandoKey(Map<String, Object> aParams) throws JakartaException {
		
		validarEntrada(aParams.get(ENTIDAD_MAESTRA));
		validarEntrada(aParams.get(OID_ENTIDAD_MAESTRA));

		String entidadMaestra=(String) aParams.get(ENTIDAD_MAESTRA);
		String oidEntidadMaestra=(String) aParams.get(OID_ENTIDAD_MAESTRA);
		
		
		Filtro filtroActivo = crearFiltro("activo","true","igual","boolean");
		
		//El filtro buscado será del tipo impuesto.categoria.id=55;
		Filtro filtroMaestro = crearFiltro(entidadMaestra.concat(".id"),oidEntidadMaestra,"igual","integer");
		
		return Arrays.asList(filtroActivo,filtroMaestro);
	}
	
}
