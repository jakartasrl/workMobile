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
import com.jkt.operaciones.TraerEntidadesConRelaciones;
import com.jkt.varios.dominio.Especificacion;

/**
 * Recupera una cotizacion.
 * No se utilizo el metodo de las listas porque era necesario r a buscar a la base el usuario.
 * 
 * FIXME si se traen datos del cliente desde delphi o html no es necesaria esta clase, utilizariamos la de traer entidades con relaciones {@link TraerEntidadesConRelaciones}
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerCotizacion extends Operation {

	private static final String WRITER_COTIZACIONES = "cotizaciones";
	private static final String WRITER_DETALLES = "detalles";
	private static final String WRITER_ARCHIVOS = "archivos";
	private static final String OID = "oid".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		validarEntrada(aParams.get(OID));
		
		Cotizacion cotizacion = (Cotizacion) obtener(Cotizacion.class,(String)aParams.get(OID));
		
		
		if (this.tipoCliente.equals(this.CLIENTE_DELPHI)) {
			long identificadorDeUsuario;
			
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
		}else{
			notificarObjeto(WRITER_COTIZACIONES, cotizacion);
		}
			
	}

}
