package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Filtro;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.transformers.Notificacion;

/**
 * Operacion para recuperar un elemento dado tales filtros.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class Helper extends Operation {

	protected static final String KEY_ENTIDAD = "entidad".toUpperCase();
	protected static final String KEY_FILTROS = "filtros".toUpperCase();

	public void execute(Map<String, Object> aParams) throws Exception {
		
		validacionesDeEntrada(aParams);
		
		String nombreEntidad=(String) aParams.get(KEY_ENTIDAD);
		String className = this.getRepositorioClases().getClass(nombreEntidad);
		List objetos = recuperarObjetoUsandoKey(aParams);
		
		List<PersistentEntity> list = getServiceRepository().getByProperties(Class.forName(className), objetos);

		for (PersistentEntity persistentEntity : list) {
			this.notificarObjecto(Notificacion.getNew("resultado", persistentEntity));
		}
	}
	
	private void validacionesDeEntrada(Map<String, Object> aParams) throws JakartaException {
		verificarMapaVacio(aParams);
		validarEntrada(aParams.get(KEY_ENTIDAD));
	}

	protected List recuperarObjetoUsandoKey(Map<String, Object> aParams) throws JakartaException {
		List object;
		if (aParams.get(KEY_FILTROS.toUpperCase())  instanceof List) {
			object = (List) aParams.get(KEY_FILTROS);
		}else{
			object = new ArrayList<Object>();
			object.add(aParams.get(KEY_FILTROS));
		}
		return object;
	}
	
	protected Filtro crearFiltro(String nombre, String valor, String condicion,String tipo) {
		Filtro filtro = new Filtro();
		
		filtro.setCondicion(condicion);
		filtro.setNombre(nombre);
		filtro.setValor(valor);
		filtro.setTipoDeDato(tipo);
		
		return filtro;
	}


}
