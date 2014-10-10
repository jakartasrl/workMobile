package com.jkt.operaciones;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.Filtro;
import com.jkt.dominio.PersistentEntity;
import com.jkt.transformers.Notificacion;

/**
 * <p>Esta operacion recibe como parametro un nombre de formulario y/o un nombre de propiedad, y retorna los/el resultado al cliente</p>
 * 
 * <p>Si recibe solamente el nombre, la operacion retorna uno o cero resultados, filtrando por el nombre que deberia ser unico.</p>
 * <p>Si recibe solamente formulario, la operacion retorna 0 o N elementos, matcheados contra el nombre de formulario recibido.</p>
 * <p>Si se recibe nombre de formulario y nombre de propiedad, se asume que la misma propiedad existe en varios formularios, con lo cual se filtra por form y por propiedad</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerConfiguracionEspecifica extends Operation {

	private static final String WRITER_CONFIGURACION = "configuracion";
	private static final String NOMBRE = "nombre".toUpperCase();
	private static final String FORMULARIO = "formulario".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		verificarMapaVacio(aParams);
		
		String formulario = (String) aParams.get(FORMULARIO);
		String nombre = (String) aParams.get(NOMBRE);
		HashMap<String, Object> filtros = new HashMap<String, Object>();
		
		if (!validarCampo(formulario) && validarCampo(nombre)) {
			Configuracion configuracion = (Configuracion) serviceRepository.getUniqueByProperty(Configuracion.class, "nombre", nombre);
			notificarElemento(configuracion);
		}else if (validarCampo(formulario) && !validarCampo(nombre)){
			Filtro filtro = new Filtro();
			filtro.setCondicion("igual");
			filtro.setValor(formulario);
			filtro.setNombre("formulario");
			filtro.setTipoDeDato("String");
			
			List<PersistentEntity> configuraciones = serviceRepository.getByProperties(Configuracion.class, Arrays.asList(filtro));
			for (PersistentEntity persistentEntity : configuraciones) {
				notificarElemento((Configuracion)persistentEntity);
			}
		}else{
			List<PersistentEntity> configuraciones = serviceRepository.getByProperties(Configuracion.class, armarFiltroNombreYFormulario(nombre, formulario));
			for (PersistentEntity persistentEntity : configuraciones) {
				notificarElemento((Configuracion)persistentEntity);
			}
			
		}
		
	}
	
	private boolean validarCampo(String campo){
		if (campo!=null && !campo.isEmpty()) {
			return true;
		}
		return false;
	}

	/**
	 * Arma los filtros para enviar la consulta a la base de datos
	 * 
	 * @param nombre
	 * @param formulario
	 * @return
	 */
	private List<Filtro> armarFiltroNombreYFormulario(String nombre, String formulario) {

		Filtro filtroNombre = new Filtro();
		filtroNombre.setCondicion("igual");
		filtroNombre.setValor(nombre);
		filtroNombre.setNombre("nombre");
		filtroNombre.setTipoDeDato("String");
		
		Filtro filtroForm = new Filtro();
		filtroForm.setCondicion("igual");
		filtroForm.setValor(formulario);
		filtroForm.setNombre("formulario");
		filtroForm.setTipoDeDato("String");
		
		return Arrays.asList(filtroNombre,filtroForm);
	}


	/**
	 * Notifica un elmento de configuracion
	 * 
	 * @param config
	 */
	private void notificarElemento(Configuracion config){
		notificarObjecto(Notificacion.getNew(WRITER_CONFIGURACION, config));
	}
	
}
