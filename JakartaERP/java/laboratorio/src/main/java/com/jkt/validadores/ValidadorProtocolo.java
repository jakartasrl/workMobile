package com.jkt.validadores;

import org.hibernate.Query;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.TipoComprobante;
import com.jkt.erp.varios.Cliente;
import com.jkt.erp.varios.ClienteSucursal;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.laboratorio.dominio.Protocolo;
import com.jkt.operaciones.ValidacionDeNegocio;

public class ValidadorProtocolo extends ValidacionDeNegocio {

	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		
		Protocolo p =  (Protocolo) entity;
		
		
		Query crearHQL = this.serviceRepository.crearHQL("select p.cliente from Pedido p where p.id = :idPedido");
		crearHQL.setParameter("idPedido", p.getIdPedido());
		
		Cliente c = (Cliente) crearHQL.uniqueResult();
		ClienteSucursal s = c.getListaSucursales().get(0);
		
		p.setCliente(c);
		p.setClienteSucursal(s);
		
		Configuracion parametroTipoComportamiento =null;
		try {
			parametroTipoComportamiento = (Configuracion) serviceRepository.getUniqueByProperty(Configuracion.class, "nombre", "comportamientoProtocolo");
			if (parametroTipoComportamiento.getValorNumero()==0) {
				throw new RuntimeException("El valor del parámetro del comportamiento de un protocolo no puede estar vacio.");
			}
		} catch (JakartaException e) {
			throw new RuntimeException(e);
		}
		
		TipoComprobante tipoComprobante;
		try {
			tipoComprobante = (TipoComprobante) serviceRepository.getByOid(TipoComprobante.class, Long.valueOf(parametroTipoComportamiento.getValorNumero()));
			p.setTipoComprobante(tipoComprobante);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}

}
