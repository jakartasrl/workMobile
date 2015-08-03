package com.jkt.pedido.operaciones;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.bouncycastle.asn1.isismtt.x509.Restriction;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Restrictions;
import org.joda.time.LocalDate;

import com.jkt.excepcion.JakartaException;
import com.jkt.grafo.DatoNodo.Estado;
import com.jkt.operaciones.Operation;
import com.jkt.pedido.dominio.TareaPedido;

/**
 * Operacion que recibe una entidad q contiene la fecha de filtro nº1, y nº2, y obligatoriamente debe contener el id del sector,
 * Para retornar una lista de tareas ordenadas por fecha.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class RecuperarTareasPorSector extends Operation {

//	private Date f1=new Date();
//	private Date f2 = new Date();
//	private long idSector;

	private static final String ID_SECTOR = "ID_SECTOR";
	private static final String FECHA_1 = "FECHA_1";
	private static final String FECHA_2 = "FECHA_2";
	private static final String ESPERA = "ESPERA";
	private static final String NO_INICIADA = "NO_INICIADA";
	private static final String EJECUCION = "EJECUCION";
	private static final String COMPLETA = "COMPLETA";
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {

//		validarFiltros(aParams);
		
		long idSector = (Long) aParams.get(ID_SECTOR);
		
		boolean enEspera = (Boolean) aParams.get(ESPERA);
		boolean noIniciada = (Boolean) aParams.get(NO_INICIADA);
		boolean enEjecucion = (Boolean) aParams.get(EJECUCION);
		boolean completa = (Boolean) aParams.get(COMPLETA);

		
		Criteria criteria = crearCriterio(TareaPedido.class);
		
		criteria.add(Restrictions.eq("sector.id", idSector));
		
		//criteria.add(Restrictions.isNotNull("pedido"));
		// eq("sector.id", idSector));
		
		
		Disjunction or = null;
		if(enEspera){
			or = Restrictions.or(Restrictions.eq("idEstado", Estado.EN_ESPERA.getValue()));
		}
		
		if(noIniciada){
			if(or==null){
				or= Restrictions.or(Restrictions.eq("idEstado", Estado.NO_INICIADO.getValue()));
			}else{
				or.add(Restrictions.eq("idEstado", Estado.NO_INICIADO.getValue()));
			}
		}

		if(enEjecucion){
			if(or==null){
				or= Restrictions.or(Restrictions.eq("idEstado", Estado.EN_EJECUCION.getValue()));
			}else{
				or.add(Restrictions.eq("idEstado", Estado.EN_EJECUCION.getValue()));
			}
		}

		List firstList = new ArrayList<TareaPedido>();
		if(or!=null){
			criteria.add(or);
			firstList = criteria.list();
		}
		

		/*
		 * Ahora se arma una nueva criteria con filtros para las tareas finalizadas entre tantas fechas
		 * TODO lo ideal seria hacer una union...
		 */
		Criteria criteriaParaFinalizados = crearCriterio(TareaPedido.class);
		
		criteriaParaFinalizados.add(Restrictions.eq("sector.id", idSector));
		criteriaParaFinalizados.add(Restrictions.isNotNull("pedido"));
		
		Date f1 = null, f2=null;
		List secondList = new ArrayList<TareaPedido>();
		if(completa){
			f1 =  (Date) aParams.get(FECHA_1);
			f2 =  (Date) aParams.get(FECHA_2);
		
			criteriaParaFinalizados.add(Restrictions.between("fechaLimite", f1, f2)) ;
			criteriaParaFinalizados.add(Restrictions.eq("idEstado", Estado.FINALIZADO.getValue()));
			
			secondList = criteriaParaFinalizados.list();
		}
		
		if(!secondList.isEmpty()){
			firstList.addAll(secondList);
		}
		
		notificarObjeto("", firstList);

	}

}


