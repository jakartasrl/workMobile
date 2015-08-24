package com.jkt.pedido.validadores;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.TipoComprobante;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.pedido.dominio.Pedido;
import com.jkt.pedido.dominio.PedidoDet;
import com.jkt.pedido.dominio.TareaPedido;
import com.jkt.validadores.ValidadorComprobantes;

@Service
public class ValidadorPedido extends ValidadorComprobantes {

	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		
		Configuracion parametroTipoComportamiento =null;
		try {
			parametroTipoComportamiento = (Configuracion) serviceRepository.getUniqueByProperty(Configuracion.class, "nombre", "comportamientoPedido");
			if (parametroTipoComportamiento.getValorNumero()==0) {
				throw new RuntimeException("El valor del parémetro del comportamiento de un pedido no puede estar vacio.");
			}
		} catch (JakartaException e) {
			MostrarError(e);
		}
		
		Pedido p=(Pedido) entity;
		
		if (p.getFecha()==null) {
			p.setFecha(new Date());
		}
		
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
		
		List<PedidoDet> detallesFinal = new ArrayList<PedidoDet>();
		detallesFinal.addAll(p.getDetalles());
		p.getDetalles().clear();
		
		for (PedidoDet det : detallesFinal) {
		
			if (det.getCantidad()<1) {
				continue;
			}
			
			if (det.getPrecio()==0) {
				continue;
			}
			
			p.getDetalles().add(det);
			
		}
		

//		List<TareaPedido> tareas = p.getTareas();
//		for (TareaPedido tareaPedido : tareas) {
//			tareaPedido.setPedido(p);
//		}
		
//		PresupuestoHistorial historial = new PresupuestoHistorial();
//		BeanUtils.copyProperties(p, historial);
//		historial.setPresupuesto(p);
//		historial.setVersion(55);
//		historial.setFechaVersionado(new Date());
//		try {
//			serviceRepository.save(historial);
//		} catch (ClassNotFoundException e) {
//			MostrarError(e);
//		} catch (InstantiationException e) {
//			MostrarError(e);
//		} catch (IllegalAccessException e) {
//			MostrarError(e);
//		} catch (JakartaException e) {
//			MostrarError(e);
//		}
	}

	protected void MostrarError(Exception e)throws ValidacionDeNegocioException {
		throw new ValidacionDeNegocioException("Error en la validacion de negocio:".concat(e.getMessage()));
	}

}
