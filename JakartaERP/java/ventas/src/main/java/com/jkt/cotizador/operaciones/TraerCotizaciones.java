package com.jkt.cotizador.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.constantes.TiposDeDato;
import com.jkt.dominio.ComprobanteVentaDet;
import com.jkt.dominio.Cotizacion;
import com.jkt.dominio.Filtro;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.Usuario;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Especificacion;

/**
 * Recupera las cotizaciones que cumplen con determinado filtro.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class TraerCotizaciones extends Operation {

	private static final String WRITER_COTIZACIONES = "cotizaciones";
	private static final String WRITER_DETALLES = "detalles";
	private static final String WRITER_ARCHIVOS = "archivos";

	/**
	 * @return Retorna el estado por el cual se realizará el filtro.
	 */
	protected abstract String getCondition();
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Filtro filtro = new Filtro("estado",getCondition(),"igual",TiposDeDato.STRING_TYPE);
		List<PersistentEntity> cotizaciones = serviceRepository.getByProperties(Cotizacion.class, Arrays.asList(filtro));
	
		Cotizacion cotizacion;
		long identificadorDeUsuario;
		for (PersistentEntity persistentEntity : cotizaciones) {
			cotizacion=(Cotizacion) persistentEntity;
			notificarObjeto(WRITER_COTIZACIONES, cotizacion);

			for (ComprobanteVentaDet detalle : cotizacion.getDetalles()) {
				notificarObjeto(WRITER_DETALLES, detalle);
			}
			
			for (Especificacion adjunto : cotizacion.getArchivos()) {
				identificadorDeUsuario = adjunto.getIdentificadorDeUsuario();
				Usuario usuario = (Usuario) obtener(Usuario.class, identificadorDeUsuario);
				adjunto.setNombreUsuario(usuario.getNombres().concat(" ").concat(usuario.getApellido()));
				notificarObjeto(WRITER_ARCHIVOS, adjunto);
			}
			
		}
		
	}

}
