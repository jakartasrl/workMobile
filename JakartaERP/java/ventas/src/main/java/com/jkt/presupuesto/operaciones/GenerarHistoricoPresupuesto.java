package com.jkt.presupuesto.operaciones;

import java.util.ArrayList;
import java.util.Date;
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

		
		//TODO REEMPLAZAR FOREACHS POR ADDALL
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

		int nuevaVersion = p.getVersion()+1;
		p.setVersion(nuevaVersion);
		p.setVersionado(true);
		
//		historial.setPresupuesto(p);
		historial.setVersion(nuevaVersion);
		historial.setFechaVersionado(new Date());
		historial.setId(0L);
		serviceRepository.save(historial);

	}

}
