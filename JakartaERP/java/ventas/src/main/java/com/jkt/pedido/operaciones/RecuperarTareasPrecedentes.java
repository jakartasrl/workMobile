package com.jkt.pedido.operaciones;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.joda.time.LocalDate;

import com.jkt.excepcion.JakartaException;
import com.jkt.grafo.NodoGenerico;
import com.jkt.operaciones.Operation;
import com.jkt.pedido.dominio.Pedido;
import com.jkt.pedido.dominio.PlanificacionPedido;
import com.jkt.pedido.dominio.TareaPedido;

/**
 * Operacion que recibe una entidad q contiene la fecha de filtro nº1, y nº2, y obligatoriamente debe contener el id del sector,
 * Para retornar una lista de tareas ordenadas por fecha.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class RecuperarTareasPrecedentes extends Operation {

//	private Date f1=new Date();
//	private Date f2 = new Date();
//	private long idSector;
	
	
	
//	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {

		String idPedido = (String) aParams.get("ID_PEDIDO");
		String idTarea = (String) aParams.get("ID_TAREA");

		Pedido p = (Pedido) obtener(Pedido.class, idPedido);
		List<PlanificacionPedido> planificaciones = p.getPlanificaciones();
		PlanificacionPedido planificacionBuscada=null;
		for (PlanificacionPedido planificacionPedido : planificaciones) {
			if(planificacionPedido.getDato().getId()==Long.valueOf(idTarea)){
				planificacionBuscada=planificacionPedido;
				break;
			}
		}
		
		if(planificacionBuscada==null){
			throw new JakartaException("La tarea seleccionada no esta planificada en el pedido.");
		}
		
		List<NodoGenerico<TareaPedido>> precedentes = planificacionBuscada.getPrecedentes();
		List<TareaPedido> tareas=new ArrayList<TareaPedido>();
		for (NodoGenerico<TareaPedido> nodoGenerico : precedentes) {
			tareas.add(nodoGenerico.getDato());
		}
		
		notificarObjeto("", tareas);
		
//		validarFiltros(aParams);
//		
//		Query consultaHQL = crearHQL("from TareaPedido as t where t.sector.id = :sector AND t.fechaLimite BETWEEN :f1 and :f2 AND t.pedido is not null order by t.fechaLimite");
//		
//		consultaHQL.setParameter("f1", this.f1);
//		consultaHQL.setParameter("f2", this.f2);
//		consultaHQL.setParameter("sector", this.idSector);
//		
//		List list = consultaHQL.list();
//		notificarObjeto("", list);
	}
//
//	/**
//	 * Valida que si o si exista el filtro de sector, y asigna fechas en caso de q las fechas vengan vacias.
//	 * 
//	 */
//	private void validarFiltros(Map<String, Object> aParams) throws JakartaException {
//		TareaPedido t = (TareaPedido) aParams.get("objeto");
//		if (t==null) {
//			throw new JakartaException("Debe completar los filtros. Minimamente debe ingresar un sector.");
//		}
//
//		Date fecha1,fecha2 = new Date();
//		
//		if(t.getIdSector()==0L){
//			throw new JakartaException("Mínimamente debe ingresar un sector.");
//		}
//		this.idSector = t.getIdSector();
//
//		fecha1 = t.getFechaFiltro1()==null?LocalDate.now().toDate():t.getFechaFiltro1();
//		
//		if (t.getFechaFiltro2()==null) {
//			if (t.getFechaFiltro1()==null) {
//				fecha2 = LocalDate.now().plusDays(10).toDate(); //A la fecha de hoy se le suman 10 dias
//			}else{
//				LocalDate fromDateFields = LocalDate.fromDateFields(fecha1);
//				fecha2 = fromDateFields.plusDays(10).toDate();//a la fecha ingresada como fecha1, se le suman 10 dias
//			}
//		}else{
//			fecha2 = t.getFechaFiltro2();
//		}
//
//		this.f1 = fecha1;
//		this.f2 = fecha2;
//
//	}

}


