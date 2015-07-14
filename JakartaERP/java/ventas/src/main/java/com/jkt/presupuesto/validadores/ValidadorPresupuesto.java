package com.jkt.presupuesto.validadores;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.TipoComprobante;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.pedido.dominio.FormaFacturacion;
import com.jkt.presupuesto.dominio.Nota;
import com.jkt.presupuesto.dominio.Presupuesto;
import com.jkt.presupuesto.dominio.PresupuestoDet;
import com.jkt.presupuesto.dominio.PresupuestoHistorial;
import com.jkt.validadores.ValidadorComprobantes;
import com.jkt.varios.dominio.Contacto;
import com.jkt.varios.dominio.Especificacion;

@Service
public class ValidadorPresupuesto extends ValidadorComprobantes {

	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		
		
		Configuracion parametroTipoComportamiento =null;
		try {
			parametroTipoComportamiento = (Configuracion) serviceRepository.getUniqueByProperty(Configuracion.class, "nombre", "comportamientoPresupuesto");
			if (parametroTipoComportamiento.getValorNumero()==0) {
				throw new RuntimeException("El valor del parámetro del comportamiento de un presupuesto no puede estar vacio.");
			}
		} catch (JakartaException e) {
			MostrarError(e);
		}
		
		Presupuesto p=(Presupuesto) entity;
		if (p.getId()>0) {//es una modificacion, solo puedo adjuntar archivos.Es una validacion rara esta, creo que seria antes del adapter...
			
		}else{
			
			try {
				TipoComprobante tipoComprobante = (TipoComprobante) serviceRepository.getByOid(TipoComprobante.class, Long.valueOf(parametroTipoComportamiento.getValorNumero()));
				p.setTipoComprobante(tipoComprobante);
				obtenerNumerador(p);
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
		}
		
		/*
		PresupuestoHistorial historial = new PresupuestoHistorial();
		
		try {
			BeanUtils.copyProperties(historial, p);
		} catch (IllegalAccessException e) {
			MostrarError(e);
		} catch (InvocationTargetException e) {
			MostrarError(e);
		}
		
		historial.setArchivos(new ArrayList<Especificacion>());
		historial.setDetalles(new ArrayList<PresupuestoDet>());
		historial.setContactosReferencia(new ArrayList<Contacto>());
		historial.setNotas(new ArrayList<Nota>());
		historial.setFormasFacturacion(new ArrayList<FormaFacturacion>());
		
		for (FormaFacturacion f : p.getFormasFacturacion()) {
			historial.agregarFormaFacturacion(f);
		}

		for (Contacto c : p.getContactosReferencia()) {
			historial.getContactosReferencia().add(c);
		}

		for (Nota notas : p.getNotas()) {
			historial.agregarNota(notas);
		}

		for (Especificacion especificacion : p.getArchivos()) {
			historial.agregarEspecificacion(especificacion);
		}

		for (PresupuestoDet det : p.getDetalles()) {
			historial.agregarDetalle(det);
		}
		
		
		historial.setPresupuesto(p);
		historial.setVersion(55);
		historial.setFechaVersionado(new Date());
		try {
			historial.setId(0L);
			serviceRepository.save(historial);
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

	protected void MostrarError(Exception e)throws ValidacionDeNegocioException {
		throw new ValidacionDeNegocioException("Error en la validacion de negocio:".concat(e.getMessage()));
	}

}
