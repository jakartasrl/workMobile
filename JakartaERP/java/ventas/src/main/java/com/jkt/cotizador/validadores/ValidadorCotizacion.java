package com.jkt.cotizador.validadores;

import com.jkt.dominio.Cotizacion;
import com.jkt.dominio.NumeradorComprobantes;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.TipoComprobante;
import com.jkt.dominio.TipoComprobante.Comportamiento;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.operaciones.ValidacionDeNegocio;

public class ValidadorCotizacion extends ValidacionDeNegocio {

	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		Cotizacion c=(Cotizacion) entity;
		if (c.getId()>0) {//es una modificacion, solo puedo adjuntar archivos.Es una validacion rara esta, creo que seria antes del adapter...
			
		}else{
			
			c.setEstado(Cotizacion.Estado.PENDIENTE.toString());
			
			NumeradorComprobantes numerador = null;
			try {
				
				TipoComprobante tipoComprobante = (TipoComprobante) serviceRepository.getByOid(TipoComprobante.class, 1L);
				c.setTipoComprobante(tipoComprobante);
				
				numerador = obtenerNumerador(c.getTipoComprobante());
			} catch (JakartaException e) {
				MostrarError(e);
			} catch (Exception e) {
				MostrarError(e);
			}
			
			c.setNro(numerador.getArgumento()+"-"+numerador.getNumero());
			
			numerador.aumentarNumero();
			
			try {
				serviceRepository.save(numerador);
			} catch (ClassNotFoundException e) {
				MostrarError(e);
			} catch (InstantiationException e) {
				MostrarError(e);
			} catch (IllegalAccessException e) {
				MostrarError(e);
			} catch (JakartaException e) {
				MostrarError(e);
			}
			
		}
	}

	protected void MostrarError(Exception e)throws ValidacionDeNegocioException {
		throw new ValidacionDeNegocioException("Error en la validacion de negocio:".concat(e.getMessage()));
	}

	/**
	 * <p>A partir del tipo de comprobante, se genera el numero de comprobante.</p>
	 * <p>Al mismo tiempo se genera una nueva instancia de numerador, aumentando en uno la cantidad de los mismos.</p>
	 * 
	 */
	private NumeradorComprobantes obtenerNumerador(TipoComprobante tipoComprobante) throws JakartaException{
		long id = tipoComprobante.getId();
		int comportamiento = tipoComprobante.getComportamiento();
		Comportamiento objetoComportamiento = TipoComprobante.Comportamiento.getComportamiento(comportamiento);
		
		String argumento=String.format("%s%s", objetoComportamiento.argumento(), String.valueOf(id));
		NumeradorComprobantes numerador = (NumeradorComprobantes)serviceRepository.getUniqueByProperty(NumeradorComprobantes.class, "argumento", argumento);
	
		if (numerador==null) {
			numerador=new NumeradorComprobantes();
			numerador.setArgumento(argumento);
			numerador.setNumero(1);
		}
		
		return numerador;
	}
	
}
