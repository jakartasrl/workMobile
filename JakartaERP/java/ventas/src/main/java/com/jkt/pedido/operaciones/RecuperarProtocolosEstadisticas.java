package com.jkt.pedido.operaciones;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.jkt.laboratorio.dominio.Protocolo;
import com.jkt.laboratorio.dominio.ProtocoloDetalle;
import com.jkt.laboratorio.dominio.ProtocoloEstadistica;
import com.jkt.laboratorio.dominio.ProtocoloVariable;
import com.jkt.operaciones.Operation;

public class RecuperarProtocolosEstadisticas extends Operation {

	private static final String ID_EQUIPO = "ID_EQUIPO";
	private static final String FECHA_DESDE = "FECHA_DESDE";
	private static final String FECHA_HASTA = "FECHA_HASTA";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		long idEquipo = (Long) aParams.get(ID_EQUIPO);
		Date fechaDesde = (Date) aParams.get(FECHA_DESDE);
		Date fechaHasta = (Date) aParams.get(FECHA_HASTA);
				
		Query query = crearHQL("from Protocolo where equipo.id = :idEquipo and estado = :estado and fechaHoraAprobacion between :fechaDesde and :fechaHasta");
		query.setParameter("idEquipo", 	idEquipo);
		query.setParameter("fechaDesde", fechaDesde);
		query.setParameter("fechaHasta", fechaHasta);
		query.setParameter("estado", Protocolo.Estado.APROBADO.getId());
		List list = query.list();

		Protocolo protocolo = new Protocolo();
		List<ProtocoloEstadistica> lsProtocoloEstadisticas = new ArrayList<ProtocoloEstadistica>();
	
		for(Object objProt :list){
			
			protocolo = (Protocolo) objProt;
			
			for(Object objDet : protocolo.getDetalles()){
				
				ProtocoloEstadistica protocoloEstadistica = new ProtocoloEstadistica();
				
				ProtocoloDetalle det = (ProtocoloDetalle) objDet;
				
				protocoloEstadistica.setIdDeterminacion(det.getId());
				protocoloEstadistica.setDescDeterminacion(det.getDescDeterminacion());
				protocoloEstadistica.setFechaCreacion(protocolo.getFechaHoraMuestra());
				
				for(Object objVar : det.getVariables()){
					
					ProtocoloVariable protVar = (ProtocoloVariable) objVar;
					
					if (protVar.isResultadoFinal()){
						protocoloEstadistica.setResultadoExpresion(protVar.getResultadoExpresion());
					}

				}
				
				lsProtocoloEstadisticas.add(protocoloEstadistica);
				
			}
				
		}
		
		notificarObjeto("", lsProtocoloEstadisticas);
		
	}

}
