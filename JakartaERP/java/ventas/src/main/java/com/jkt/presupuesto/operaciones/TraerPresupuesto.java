package com.jkt.presupuesto.operaciones;

import static org.apache.commons.beanutils.BeanUtils.copyProperties;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.operaciones.Operation;
import com.jkt.presupuesto.dominio.CondicionComercial;
import com.jkt.presupuesto.dominio.Nota;
import com.jkt.presupuesto.dominio.Presupuesto;
import com.jkt.presupuesto.dominio.PresupuestoDet;

/**
 * Recupera un presupuesto y todas sus relaciones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 * @author Santiago Braceras - Jakarta SRL
 * 
 */
public class TraerPresupuesto extends Operation {

	private static final String OID = "oid".toUpperCase();

	private static final String WRITER_PRESUPUESTO = "presupuesto";
	private static final String WRITER_ITEMS = "items";
	private static final String WRITER_MATERIALES = "materiales";
	private static final String WRITER_DET_ELEC= "determinacionElectrica";
	private static final String WRITER_DET_QUIMI= "determinacionQuimica";
	private static final String WRITER_NOTAS= "notas";
	private static final String WRITER_COND_COMERCIAL= "condicionesComerciales";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(OID));
		
		Presupuesto presupuesto=(Presupuesto) obtener(Presupuesto.class, (String)aParams.get(OID));
		notificarObjeto(WRITER_PRESUPUESTO, presupuesto);
		
		notificarNotas(presupuesto);
		
		notificarCondiciones(presupuesto);

		notificarDetalles(presupuesto);
		
	}

	private void notificarCondiciones(Presupuesto presupuesto) throws Exception, IllegalAccessException, InvocationTargetException {
		// Obtengo todas las Condiciones...
		List<PersistentEntity> condiciones = serviceRepository.getAll(CondicionComercial.class);
		// Condiciones que tiene el presupuesto guardadas
		List<CondicionComercial> condicionesDelPresupuesto = presupuesto.getCondicionesComerciales();
		CondicionComercial condicion;
		for (PersistentEntity currentObject : condiciones) {
			condicion = (CondicionComercial) currentObject;
			// Si la Nota esta activa la notifico
			if (condicion.isActivo()) {
				CondicionComercial nuevaCondicion = new CondicionComercial();
				
				copyProperties(nuevaCondicion, condicion);
				
				// Ahora, si ya estaba guardada en el presupuesto actual, entonces la mando 'chequeada'
				if (condicionesDelPresupuesto.contains(condicion)) {
					nuevaCondicion.setIncluida(true);
				}
				notificarObjeto(WRITER_COND_COMERCIAL, nuevaCondicion);
			}
		}
	}

	private void notificarNotas(Presupuesto presupuesto) throws Exception, IllegalAccessException, InvocationTargetException {
		// Obtengo todas las Notas...
		List<PersistentEntity> notas = serviceRepository.getAll(Nota.class);
		// Notas que tiene el presupuesto guardadas
		List<Nota> notasDelPresupuesto = presupuesto.getNotas();

		
		Nota nota;
		for (PersistentEntity currentObject : notas) {
			nota = (Nota) currentObject;
			// Si la Nota esta activa la notifico
			if (nota.isActivo()) {
				Nota nuevaNota = new Nota();
				
				copyProperties(nuevaNota, nota);
				
				// Ahora, si ya estaba guardada en el presupuesto actual, entonces la mando 'chequeada'
				if (notasDelPresupuesto.contains(nota)) {
					nuevaNota.setIncluida(true);
				}
				notificarObjeto(WRITER_NOTAS, nuevaNota);
			}
		}
	}

	/**
	 * Notifica los detalles del presupuesto en el writer correspondiente segun si fue el presupuesto se baso en una cotizacion, y el tipo de detalle (labo quim,labo elec, material)
	 */
	private void notificarDetalles(Presupuesto presupuesto) {

		for (PresupuestoDet presupuestoDet : presupuesto.getDetalles()) {
			if (presupuestoDet.isItem()) {
				notificarObjeto(WRITER_ITEMS, presupuestoDet);
			}else if (presupuestoDet.isMaterial()) {
				notificarObjeto(WRITER_MATERIALES, presupuestoDet);
			}else if (presupuestoDet.isLaboratorioElectrico()) {
				notificarObjeto(WRITER_DET_ELEC, presupuestoDet);
			}else if (presupuestoDet.isLaboratorioQuimico()) {
				notificarObjeto(WRITER_DET_QUIMI, presupuestoDet);
			}else{
				log.warn(String.format("No se muestra el detalle de presupuesto con id %s por que no tiene un tipo permitido. Tipo %c no existente.",presupuestoDet.getId(), presupuestoDet.getTipoDetalle()));
			}
		}
		
	}

}
