package com.jkt.validadores;

import org.hibernate.Query;

import com.jkt.dominio.Comprobante;
import com.jkt.dominio.NumeradorComprobantes;
import com.jkt.dominio.TipoComprobante;
import com.jkt.dominio.TipoComprobante.Comportamiento;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.operaciones.ValidacionDeNegocio;

/**
 * <p>Clase padre de todos los validadores de comprobantes, 
 * ya que tiene metodos para asignar numeros utilizando el numerador ya desarrollado.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class ValidadorComprobantes extends ValidacionDeNegocio {

	protected void obtenerNumerador(Comprobante comprobante) throws JakartaException, ClassNotFoundException, InstantiationException, IllegalAccessException, ValidacionDeNegocioException{

		long id = comprobante.getTipoComprobante().getId();
		int comportamiento = comprobante.getTipoComprobante().getComportamiento();
		Comportamiento objetoComportamiento = TipoComprobante.Comportamiento.getComportamiento(comportamiento);
		String numeroComprobante;
		
		if (comprobante.getComprobanteRelacionado()==null || comprobante.getComprobanteRelacionado().getId()==0) {
			comprobante.limpiarComprobantesRelacionados();
					
			//nuevo numerador
			
			Query hql = this.getServiceRepository().crearHQL("select max(numerador.numero) from NumeradorComprobantes as numerador");
			int ultimoNumerador = (Integer) hql.uniqueResult();
			
			NumeradorComprobantes numerador = new NumeradorComprobantes();
			numerador.setNumero(ultimoNumerador+1);
			serviceRepository.save(numerador);
			
			numeroComprobante=String.format("%s-%s-%s", objetoComportamiento.argumento(), String.valueOf(id), String.valueOf(numerador.getNumero()));
			comprobante.setNro(numeroComprobante);
			
		}else{

			Comportamiento comportamientoRelacionado = TipoComprobante.Comportamiento.getComportamiento(
																			comprobante.getComprobanteRelacionado().getTipoComprobante().getComportamiento()
																								);
			
			if (objetoComportamiento==comportamientoRelacionado) {
				//Inconsistencia! se puede dejar en una estado inconsistente si se continua, ya que se generarían cincuente ND-1-22 por ejemplo.
				throw new JakartaException("Un comprobante no puede estar relacionado con otro comprobante que tenga el mismo comportamiento.");
			}
			
			String[] numeroCortado = comprobante.getComprobanteRelacionado().getNro().split("-");
			int length = numeroCortado.length;
			if (length!=3) {
				throw new JakartaException("Existe una inconsistencia con el numero del comprobante relacionado.");
			}
			String numeroRelacion = numeroCortado[length-1];
			
			numeroComprobante=String.format("%s-%s-%s", objetoComportamiento.argumento(), String.valueOf(id), numeroRelacion);
			
			//Busca por si existe ya algun comprobante para el mismo comprobante objetivo, s decis, por ejemplo, dos presupuesto para la misma cotizacion
			String hql="";//="from ComprobanteVentaDet comprobante where comprobante.numero like ':numero/%' order by comprobante.numero desc";
			
			if (comprobante.isPresupuesto()) {
				hql="from Presupuesto comprobante where comprobante.nro like :numero order by comprobante.nro desc";
			}
			
			if (comprobante.isCotizacion()) {
				hql="from Cotizacion comprobante where comprobante.nro like :numero order by comprobante.nro desc";
			}
			
			if (comprobante.isPedido()) {
				hql="from Pedido comprobante where comprobante.nro like :numero order by comprobante.nro desc";
			}
			
			if (comprobante.isProtocolo()) {
				hql="from Protocolo comprobante where comprobante.nro like :numero order by comprobante.nro desc";
			}

			if (hql.isEmpty()) {
				throw new JakartaException("No es posible determinar el tipo de comprobante.");
			}
			
			Query query = this.getServiceRepository().crearHQL(hql);
			query.setParameter("numero", numeroComprobante  + "/%");
			query.setMaxResults(1);
			Comprobante comprobanteExistente = (Comprobante) query.uniqueResult();
			
			if (comprobanteExistente!=null) {
				String[] split = comprobanteExistente.getNro().split("/");
				int valor=Integer.valueOf(split[split.length-1]);
				comprobante.setNro(numeroComprobante.concat("/"+(valor+1)));
			}else{
				//Es el primer elemento.
				comprobante.setNro(numeroComprobante.concat("/1"));
			}
			
		}
		
	}
	
}
