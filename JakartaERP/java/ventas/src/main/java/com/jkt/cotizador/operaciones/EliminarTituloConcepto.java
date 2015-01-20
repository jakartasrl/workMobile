package com.jkt.cotizador.operaciones;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.proxy.HibernateProxy;
import org.hibernate.proxy.LazyInitializer;

import com.jkt.cotizador.dominio.ConceptoPresupuesto;
import com.jkt.cotizador.dominio.TituloModeloCotizador;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;

/**
 * <p>Elimina un titulo o concepto del arbol de modelo de cotizador.</p>
 * <p>Como precondicion, es necesario que el titulo no esté siendo utilizado en ningun detale del cualquier presupuestador.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class EliminarTituloConcepto extends Operation {

	private static final String TEMPORAL_DESCRIPTION = "temporalDescription";

	private static final String OID_TITULO_CONCEPTO = "OID";
	private String descripcion;
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada((String) aParams.get(OID_TITULO_CONCEPTO));


		String id = (String) aParams.get(OID_TITULO_CONCEPTO);
		TituloModeloCotizador elementoABorrar = (TituloModeloCotizador) obtener(TituloModeloCotizador.class, id);
		
		Query query = crearConsultaParaVerificarExistencia(id);
		
		List list = query.list();
		
		if (list.isEmpty()) {
			
			TituloModeloCotizador elementoAActualizar = elementoABorrar.getTituloPadre();

			if (elementoAActualizar!=null) {
				//** Modifica un dato temporal en la entidad padre ya que sin hacer esto, la entidad queda en un estado estatico.
				descripcion=elementoAActualizar.getDescripcion();
				elementoAActualizar.setDescripcion(TEMPORAL_DESCRIPTION);
				
				//elimino al objetivo de la lista de su padre para no tener problemas de referencias en cuanto a claves foraneas (ver mapeo de la lista de hijos )
				elementoAActualizar.getTitulosHijos().remove(elementoABorrar);
				
				//Actualizo el elemento
				guardar(elementoAActualizar);
				
			}
			
			ejecutarConsultaDeBorrado(id);
			
			if (elementoAActualizar!=null) {
				//Reestablezco el estado de la entidad padre del objetivo **
				elementoAActualizar.setDescripcion(descripcion);
			}

		}else{
			throw new JakartaException("No es posible eliminar el titulo o concepto ya que ha sido utilizado en una cotización.");
		}
		
	}


	private void ejecutarConsultaDeBorrado(String id) throws JakartaException {
		//Borro la entidad objetivo
		Query queryForDelete = crearConsultaDeBorrado(id);
		int executeUpdate = queryForDelete.executeUpdate();
		if (executeUpdate==0) {
			throw new JakartaException("No se pudo realizar la operacion de borrado solicitada.");
		}
	}


	/**
	 * Crea una query de hibernate y le asigna un parametro
	 * 
	 * @param id el id de la entidad a borrar de tipo {@link TituloModeloCotizador}
	 * @return
	 */
	private Query crearConsultaDeBorrado(String id) {
		String stringQueryForDelete = "delete from TituloModeloCotizador where id=:identificador";
		Query queryForDelete = crearHQL(stringQueryForDelete);
		queryForDelete.setParameter("identificador", Long.valueOf(id));
		return queryForDelete;
	}


	/**
	 * Genera una HQL para comprobar la consistencia en cuanto a la existencia 
	 * 
	 * @param id de la entidad solicitada para comprobar que no esta siendo usada en ningun detalle de cotizador
	 * @return
	 */
	private Query crearConsultaParaVerificarExistencia(String id) {
		Query query = crearHQL("from CotizadorDet as clase where clase.tituloModeloCotizador.id = :identificador");
		query.setParameter("identificador", Long.valueOf(id));
		return query;
	}

}
