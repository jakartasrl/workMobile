package com.jkt.presupuesto.operaciones;

import static org.apache.commons.beanutils.BeanUtils.copyProperties;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.ListaPrecioDetalle;
import com.jkt.dominio.PersistentEntity;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.laboratorio.dominio.Laboratorio;
import com.jkt.presupuesto.dominio.Nota;
import com.jkt.presupuesto.dominio.Presupuesto;
import com.jkt.presupuesto.dominio.PresupuestoDet;
import com.jkt.presupuesto.dominio.PresupuestoHistorial;
import com.jkt.varios.dominio.Moneda;

/**
 * Recupera un presupuesto y todas sus relaciones utilizando las versiones finales solamente.
 * 
 * @author Leonel Suarez - Jakarta SRL
 * 
 */
public class TraerPresupuestoFinalWeb extends HelperRecuperarDeterminacionesConPrecios {

	private static final String LABORATORIO_ELECTRICO = "LaboratorioElectrico";
	private static final String LABORATORIO_QUIMICO = "LaboratorioQuimico";

	private static final String OID = "oid".toUpperCase();
	private Moneda monedaporDefecto ;
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(OID));
		
		Configuracion configuracionMonedaPorDefecto = obtenerConfiguracion(NOMBRE_PARAMETRO_MONEDA_POR_DEFECTO);
		monedaporDefecto = (Moneda) obtener(Moneda.class, Long.valueOf(configuracionMonedaPorDefecto.getValorNumero()));
		obtenerLaboratorios();
		
		
		Presupuesto presupuesto=(Presupuesto) obtener(Presupuesto.class, (String)aParams.get(OID));
		if(presupuesto.isVersionado()){
			asignarNotas(presupuesto);
			asignarDeterminaciones(presupuesto, PresupuestoDet.CHAR_QUIMICO, laboQuimico.getId());
			asignarDeterminaciones(presupuesto, PresupuestoDet.CHAR_ELECTRICO, laboElectrico.getId());
			notificarObjeto("", presupuesto);
		}else{
			Query hql = this.crearHQL("from PresupuestoHistorial p where p.nro = :numero order by p.fechaVersionado desc");// p where p.nro = :numero order by p.fechaVersionado"); 
			hql.setString("numero", presupuesto.getNro());
			List historial = hql.list();
			PresupuestoHistorial p = (PresupuestoHistorial) historial.get(0);
			asignarNotas(p);
			asignarDeterminaciones(presupuesto, PresupuestoDet.CHAR_QUIMICO, laboQuimico.getId());
			asignarDeterminaciones(presupuesto, PresupuestoDet.CHAR_ELECTRICO, laboElectrico.getId());
			notificarObjeto("", p);
			
		}

	}

	private void asignarDeterminaciones(Presupuesto presupuesto, char tipoDetalle, long idLaboratorio) {
		Query hql = this.crearHQL("from Determinacion d where d.laboratorio.id = :idLaboratorio");
		hql.setParameter("idLaboratorio", idLaboratorio);
		List<Determinacion> allDets = hql.list();
		
		List<PresupuestoDet> allDetails = presupuesto.getDetalles();
		List<Long> idDeterminaciones = new ArrayList<Long>();

		for (PresupuestoDet presupuestoDet : allDetails) {
			if(presupuestoDet.getTipoDetalle()==tipoDetalle){
				idDeterminaciones.add(presupuestoDet.getDeterminacion().getId());
			}
		}
		
		for (Determinacion determinacion : allDets) {
			if(!idDeterminaciones.contains(determinacion.getId())){
				PresupuestoDet presupuestoDet = new PresupuestoDet();
				presupuestoDet.setDeterminacion(determinacion);
				presupuestoDet.setTipoDetalle(tipoDetalle);
				presupuestoDet.setMoneda(monedaporDefecto);
				presupuesto.getDetalles().add(presupuestoDet);
			}
		}
		
	}

	Laboratorio laboQuimico, laboElectrico;
	
	private void obtenerLaboratorios() throws Exception {
		Configuracion obtenerConfiguracion = obtenerConfiguracion(LABORATORIO_QUIMICO);
		int idLaboQ = obtenerConfiguracion.getValorNumero();
		laboQuimico = (Laboratorio) obtener(Laboratorio.class, Long.valueOf(idLaboQ));
		
		Configuracion obtenerConfiguracionElec = obtenerConfiguracion(LABORATORIO_ELECTRICO);
		int idLaboE = obtenerConfiguracionElec.getValorNumero();
		laboElectrico = (Laboratorio) obtener(Laboratorio.class, Long.valueOf(idLaboE));
		
	}

	private void asignarNotas(Presupuesto presupuesto) throws Exception, IllegalAccessException, InvocationTargetException {
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
			
				presupuesto.agregarNotaTransiente(nuevaNota);
			}
		}
	}

	/**
	 * Notifica los detalles del presupuesto en el writer correspondiente segun si fue el presupuesto se baso en una cotizacion, y el tipo de detalle (labo quim,labo elec, material)
	 * @throws Exception 
	 */
	private void notificarDetalles(Presupuesto presupuesto) throws Exception {

		return;
		
//		List idsDeterQuim=new ArrayList();
//		List idsDeterElect=new ArrayList();
//		
//		for (PresupuestoDet presupuestoDet : presupuesto.getDetalles()) {
//			if (presupuestoDet.isItem()) {
//				notificarObjeto(WRITER_ITEMS, presupuestoDet);
//			}else if (presupuestoDet.isMaterial()) {
//				notificarObjeto(WRITER_MATERIALES, presupuestoDet);
//			}else if (presupuestoDet.isLaboratorioElectrico()) {
//				notificarObjeto(WRITER_DET_ELEC, presupuestoDet);
//				idsDeterElect.add(presupuestoDet.getDeterminacion().getId());
//			}else if (presupuestoDet.isLaboratorioQuimico()) {
//				idsDeterQuim.add(presupuestoDet.getDeterminacion().getId());
//				notificarObjeto(WRITER_DET_QUIMI, presupuestoDet);
//			}else{
//				log.warn(String.format("No se muestra el detalle de presupuesto con id %s por que no tiene un tipo permitido. Tipo %c no existente.",presupuestoDet.getId(), presupuestoDet.getTipoDetalle()));
//			}
//		}
//		
//		
//		/*
//		 * EL loop no distingue de tipos de items, con lo cual voy agregando a dos listas diferentes
//		 */
//		
//		laboratorioQuimico=true;
//		List determinacionesEnLista;
//		if (presupuesto.getListaPrecios()==null) {
//			determinacionesEnLista = new ArrayList();
//		}else{
//			determinacionesEnLista = mostrarDeterminaciones(laboQuimico.getId(), presupuesto.getListaPrecios());
//		}
//			
//		mostrarNuevosElementos(laboQuimico.getId(), determinacionesEnLista);
//		/*
//		 * Por cada uno de estos elementos de esta lista, se habra ejecutado el metodo realizarAccionSobreDetalle.
//		 * 
//		 * Para saber que labo es, agregao una variable de estado, la cual es solamente de este objeto.
//		 */
//		laboratorioQuimico=false;
//		if (presupuesto.getListaPrecios()==null) {
//			determinacionesEnLista = new ArrayList();
//		}else{
//			determinacionesEnLista = mostrarDeterminaciones(laboElectrico.getId(), presupuesto.getListaPrecios());
//		}
//		mostrarNuevosElementos(laboElectrico.getId(), determinacionesEnLista);
//		
//		/*
//		 * Una vez que tome todas las determinaciones de ambos laboratorios, y cada elemento esta en su correspondiente lista, muestro haciendo un disjunction...
//		 */
//		
//		mostrarDeterminacionesQuimicasNuevas(idsDeterQuim, detallesLaboratorioQuimico);
//		mostrarDeterminacionesElectricasNuevas(idsDeterElect, detallesLaboratorioElectrico);
//		
		
	}

//	private void mostrarDeterminacionesElectricasNuevas(List idsDeterElect, List<ListaPrecioDetalle> detallesLaboratorioElectrico2) {
//		mostrarDeterminaciones(detallesLaboratorioElectrico2,idsDeterElect, WRITER_DET_ELEC);
//	}
//
//	private void mostrarDeterminacionesQuimicasNuevas(List idsDeterQuim, List<ListaPrecioDetalle> detallesLaboratorioQuimico2) {
//		mostrarDeterminaciones(detallesLaboratorioQuimico2,idsDeterQuim, WRITER_DET_QUIMI);
//	}
	
	private void mostrarDeterminaciones(List<ListaPrecioDetalle> detalles,List ids, String writer){
		PresupuestoDet presupuestoDet;
		
		for (ListaPrecioDetalle listaPrecioDetalle : detalles) {
			if (!ids.contains(listaPrecioDetalle.getDeterminacion().getId())) {
				presupuestoDet = new PresupuestoDet();
				presupuestoDet.setDeterminacion(listaPrecioDetalle.getDeterminacion());
				presupuestoDet.setMoneda(listaPrecioDetalle.getMoneda());
				notificarObjeto(writer, presupuestoDet);
			}
		}
		
	}

	private boolean laboratorioQuimico=false;
	private List<ListaPrecioDetalle> detallesLaboratorioQuimico=new ArrayList<ListaPrecioDetalle>();
	private List<ListaPrecioDetalle> detallesLaboratorioElectrico=new ArrayList<ListaPrecioDetalle>();
	
	
	@Override
	protected void realizarAccionSobreDetalle(ListaPrecioDetalle detalle) {
		if (laboratorioQuimico) {
			detallesLaboratorioQuimico.add(detalle);
		}else{
			detallesLaboratorioElectrico.add(detalle);
		}
	}

}
