package com.jkt.presupuesto.operaciones;

import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.jkt.dominio.PersistentEntity;
import com.jkt.operaciones.Operation;
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
	private static final String WRITER_DET_QUIMI= "presupdeterminacionQuimica";
	private static final String WRITER_NOTAS= "notas";
	private static final String WRITER_COND_COMERCIAL= "condicionesComerciales";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(OID));
		
		Presupuesto presupuesto=(Presupuesto) obtener(Presupuesto.class, (String)aParams.get(OID));
		notificarObjeto(WRITER_PRESUPUESTO, presupuesto);
		
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
				
				BeanUtils.copyProperties(nuevaNota, nota); //Limpieza de codigo, en este caso no llama la atencion setear mano a mano 3 campos, pero si son 10 resulta molesto.
				
//				nuevaNota.setId(nota.getId());
//				nuevaNota.setCodigo(nota.getCodigo());
//				nuevaNota.setDescripcion(nota.getDescripcion());
	
				// Ahora, si ya estaba guardada en el presupuesto actual, entonces la mando 'chequeada'
				if (notasDelPresupuesto.contains(nota)) {
					//cambio de nombre de variables!
//					nuevaNota.setIncluidaEnPresupuesto(true); 
					nuevaNota.setIncluida(true);
				}
				notificarObjeto(WRITER_NOTAS, nuevaNota);
			}
		}
		
		notificarObjetos(WRITER_COND_COMERCIAL, presupuesto.getCondicionesComerciales());
		
		notificarDetalles(presupuesto);
		
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
