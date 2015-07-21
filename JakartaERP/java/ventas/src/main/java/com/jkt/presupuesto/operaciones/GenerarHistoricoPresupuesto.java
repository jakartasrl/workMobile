package com.jkt.presupuesto.operaciones;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.jkt.operaciones.Operation;
import com.jkt.pedido.dominio.FormaFacturacion;
import com.jkt.presupuesto.dominio.Nota;
import com.jkt.presupuesto.dominio.Presupuesto;
import com.jkt.presupuesto.dominio.PresupuestoDet;
import com.jkt.presupuesto.dominio.PresupuestoHistorial;
import com.jkt.varios.dominio.Contacto;
import com.jkt.varios.dominio.Especificacion;

/**
 * Copia los datos de un presupuesto en su historial, y aumenta la version del Presupuesto.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class GenerarHistoricoPresupuesto extends Operation {

	private static final String KEY_OID_PRESUPUESTO = "OID_PRESUPUESTO".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		String idPresupuesto = (String) aParams.get(KEY_OID_PRESUPUESTO);
		Presupuesto p =  (Presupuesto) obtener(Presupuesto.class, idPresupuesto);
		
		PresupuestoHistorial historial = new PresupuestoHistorial();

		BeanUtils.copyProperties(historial, p);

		historial.setArchivos(new ArrayList<Especificacion>());
		historial.setDetalles(new ArrayList<PresupuestoDet>());
		historial.setContactosReferencia(new ArrayList<Contacto>());
		historial.setNotas(new ArrayList<Nota>());
		historial.setFormasFacturacion(new ArrayList<FormaFacturacion>());

		historial.getFormasFacturacion().addAll(p.getFormasFacturacion());
		historial.getContactosReferencia().addAll(p.getContactosReferencia());
		historial.getNotas().addAll(p.getNotas());
		historial.getArchivos().addAll(p.getArchivos());
		historial.getDetalles().addAll(p.getDetalles());
		
//		List<PresupuestoDet> detalles = p.getDetalles();
//		for (PresupuestoDet presupuestoDet : detalles) {
//			PresupuestoDet det = new PresupuestoDet();
//			BeanUtils.copyProperties(det, presupuestoDet);
//			det.setId(0L);
//			historial.getDetalles().add(det);
//		}
		
//		historial.getDetalles().addAll(p.getDetalles());
		

		int nuevaVersion = p.getVersion()+1;
		p.setVersion(nuevaVersion);
		p.setVersionado(true);
		
		historial.setVersion(nuevaVersion);
		historial.setFechaVersionado(new Date());
		historial.setId(0L);
		serviceRepository.save(historial);

	}

}
