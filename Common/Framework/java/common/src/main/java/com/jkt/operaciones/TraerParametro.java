package com.jkt.operaciones;

import java.util.Map;

import com.jkt.dominio.Configuracion;
import com.jkt.excepcion.JakartaException;

///**
// * <p>Esta operacion recibe como parametro un nombre de formulario y/o un nombre de propiedad, y retorna los/el resultado al cliente</p>
// * 
// * <p>Si recibe solamente el nombre, la operacion retorna uno o cero resultados, filtrando por el nombre que deberia ser unico.</p>
// * <p>Si recibe solamente formulario, la operacion retorna 0 o N elementos, matcheados contra el nombre de formulario recibido.</p>
// * <p>Si se recibe nombre de formulario y nombre de propiedad, se asume que la misma propiedad existe en varios formularios, con lo cual se filtra por form y por propiedad</p>
// * 
// * @author Leonel Suarez - Jakarta SRL
// */
/**
 * Recupera un parametro utilizando su KEY y lo retorna.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerParametro extends Operation {

	private static final String WRITER_CONFIGURACION = "configuracion";
	
	private static final String NOMBRE = "nombreParametro".toUpperCase();
//	private static final String FORMULARIO = "formulario".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		verificarMapaVacio(aParams);
		validarEntrada(aParams.get(NOMBRE));
		
		
//		String formulario = (String) aParams.get(FORMULARIO);
		String nombre = (String) aParams.get(NOMBRE);
//		HashMap<String, Object> filtros = new HashMap<String, Object>();
		
		Configuracion configuracion = (Configuracion) serviceRepository.getUniqueByProperty(Configuracion.class, "nombre", nombre);
		if (configuracion==null) {
			throw new JakartaException("No existe el parametro solicitado.");
		}
		notificarElemento(configuracion);
//		if (!validarCampo(formulario) && validarCampo(nombre)) {
//			Configuracion configuracion = (Configuracion) serviceRepository.getUniqueByProperty(Configuracion.class, "nombre", nombre);
//			notificarElemento(configuracion);
//		}else if (validarCampo(formulario) && !validarCampo(nombre)){
//			Filtro filtro = new Filtro();
//			filtro.setCondicion("igual");
//			filtro.setValor(formulario);
//			filtro.setNombre("formulario");
//			filtro.setTipoDeDato("String");
//			
//			List<PersistentEntity> configuraciones = serviceRepository.getByProperties(Configuracion.class, Arrays.asList(filtro));
//			for (PersistentEntity persistentEntity : configuraciones) {
//				notificarElemento((Configuracion)persistentEntity);
//			}
//		}else{
//			List<PersistentEntity> configuraciones = serviceRepository.getByProperties(Configuracion.class, armarFiltroNombreYFormulario(nombre, formulario));
//			for (PersistentEntity persistentEntity : configuraciones) {
//				notificarElemento((Configuracion)persistentEntity);
//			}
//			
//		}
		
	}
	
	/**
	 * <p>Valida si un campo recibido es valido.</p>
	 * <p>Que sea valido significa que no sea nulo ni vacio.</p>
	 * 
	 * @param campo es una cadena a validar.
	 * @return true si el campo no es nulo ni vacio. false si el campo es nulo o es vacio.
	 */
//	private boolean validarCampo(String campo){
//		if (campo!=null && !campo.isEmpty()) {
//			return true;
//		}
//		return false;
//	}

	/**
	 * Arma los filtros para enviar la consulta a la base de datos
	 * 
	 * @param nombre
	 * @param formulario
	 * @return
	 */
//	private List<Filtro> armarFiltroNombreYFormulario(String nombre, String formulario) {
//
//		Filtro filtroNombre = new Filtro();
//		filtroNombre.setCondicion("igual");
//		filtroNombre.setValor(nombre);
//		filtroNombre.setNombre("nombre");
//		filtroNombre.setTipoDeDato("String");
//		
//		Filtro filtroForm = new Filtro();
//		filtroForm.setCondicion("igual");
//		filtroForm.setValor(formulario);
//		filtroForm.setNombre("formulario");
//		filtroForm.setTipoDeDato("String");
//		
//		return Arrays.asList(filtroNombre,filtroForm);
//	}


	/**
	 * Notifica un elmento de configuracion
	 * 
	 * @param config
	 */
	private void notificarElemento(Configuracion config){
		notificarObjecto(WRITER_CONFIGURACION, config);
	}
	
}
