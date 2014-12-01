package com.jkt.erp.validadores;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.varios.SujetoImpositivo;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.helpers.CuitValidator;
import com.jkt.operaciones.ValidacionDeNegocio;
import com.jkt.varios.dominio.Pais;


/**
 * <p>
 * 1. La property local se setea en true si el país de la dirección asociada es ARGENTINA.
 * </p>
 * 
 * <p>
 * 2. Si Local es false, se setea el cuit que esta asociado a Pais (Pais,getCuit());
 * </p>
 * 
 * <p>
 * 3. Si local es True, el cuit no debe existir en otro sujeto impositivo.
 * </p>
 */
public class ValidacionSujetoImpositivo extends ValidacionDeNegocio {

	private static final String MENSAJE_EXCEPCION = "Ocurrio un error. La entidad sujeto impositivo que se intenta guardar tiene un CUIT que ya existe en la base de datos del sistema.";

	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		SujetoImpositivo sujeto = (SujetoImpositivo) entity;

		try {
			CuitValidator.validarCuit(sujeto.getCuit());
		} catch (JakartaException e) {
			throw new ValidacionDeNegocioException(e.getMessage());//No wrappeo la excepcion, sino que solamente muestro el mensaje en la excepcion correspondiente.
			//Si en algun momento uso el validador de cuit, es normal que levante esa excepcion, en este caso considero que esta en un contexto de validaciones de negocio
		}
		
		Pais pais = sujeto.getDireccionLegal().getPais();
		if ("AR".equals(pais.getCodigo()) && "argentina".equals(pais.getDescripcion().toLowerCase())) {
			sujeto.setLocal(true);
		}

		
		if (sujeto.isLocal()) {
			//search in db if exists any subject with the same CUIT.
			PersistentEntity sujetoImpositivoRecuperado = null;
			try {
				sujetoImpositivoRecuperado = serviceRepository.getUniqueByProperty(SujetoImpositivo.class, "cuit", sujeto.getCuit());
			} catch (JakartaException e) {
				levantarExcepcion();
			}
			
			if (sujetoImpositivoRecuperado!=null) {
				levantarExcepcion();
			}
		}
	}

	/**
	 * Metodo que levanta la excepcion cada vez que es ejecutado.
	 * 
	 * @throws ValidacionDeNegocioException siempre que se ejecute este metodo se levanta esa excepcion.
	 */
	private void levantarExcepcion() throws ValidacionDeNegocioException {
		throw new ValidacionDeNegocioException(MENSAJE_EXCEPCION);
	}
}
