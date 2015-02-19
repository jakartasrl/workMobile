package com.jkt.cotizador.validadores;

import org.springframework.stereotype.Service;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.Cotizacion;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.TipoComprobante;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.validadores.ValidadorComprobantes;

@Service
public class ValidadorCotizacion extends ValidadorComprobantes {

//	@Autowired
//	private HelperNumerador helperNumerador;
//	
//	public HelperNumerador getHelperNumerador() {
//		return helperNumerador;
//	}
//
//	public void setHelperNumerador(HelperNumerador helperNumerador) {
//		this.helperNumerador = helperNumerador;
//	}

	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		
		
		Configuracion parametroTipoComportamiento =null;
		try {
			parametroTipoComportamiento = (Configuracion) serviceRepository.getUniqueByProperty(Configuracion.class, "nombre", "comportamientoCotizacion");
			if (parametroTipoComportamiento.getValorNumero()==0) {
				throw new RuntimeException("El valor del parametro del comportamiento de una cotización no puede estar vacio.");
			}
		} catch (JakartaException e) {
			MostrarError(e);
		}
		
		Cotizacion c=(Cotizacion) entity;
		if (c.getId()>0) {//es una modificacion, solo puedo adjuntar archivos.Es una validacion rara esta, creo que seria antes del adapter...
			
		}else{
			
			c.setEstado(Cotizacion.Estado.PENDIENTE.toString());
			
			try {
				TipoComprobante tipoComprobante = (TipoComprobante) serviceRepository.getByOid(TipoComprobante.class, Long.valueOf(parametroTipoComportamiento.getValorNumero()));
				c.setTipoComprobante(tipoComprobante);
				obtenerNumerador(c);
			} catch (ClassNotFoundException e) {
				MostrarError(e);
			} catch (InstantiationException e) {
				MostrarError(e);
			} catch (IllegalAccessException e) {
				MostrarError(e);
			} catch (JakartaException e) {
				MostrarError(e);
			} catch (Exception e) {
				MostrarError(e);
			}
			
			/*
			NumeradorComprobantes numerador = null;
			try {
				
				TipoComprobante tipoComprobante = (TipoComprobante) serviceRepository.getByOid(TipoComprobante.class, Long.valueOf(parametroTipoComportamiento.getValorNumero()));
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
			
			*/
			
		}
	}

	/*
	@SuppressWarnings({"resource","unused"})
	private void levantarBean() {
//		ApplicationContext applicationContext = 
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("/comprobantes-context.xml");
		HelperNumerador numerador = (HelperNumerador) applicationContext.getBean("HelperNumerador");
		Object retornarAlgo = numerador.retornarAlgo();
		System.out.println();

	}
	*/

	protected void MostrarError(Exception e)throws ValidacionDeNegocioException {
		throw new ValidacionDeNegocioException("Error en la validación de negocio:".concat(e.getMessage()));
	}

	/*
	/**
	 * <p>A partir del tipo de comprobante, se genera el numero de comprobante.</p>
	 * 
	 */
	
	/*
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
	*/
	
}
