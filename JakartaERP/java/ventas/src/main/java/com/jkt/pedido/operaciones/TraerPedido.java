package com.jkt.pedido.operaciones;

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
import com.jkt.pedido.dominio.Pedido;
import com.jkt.pedido.dominio.PedidoDet;
import com.jkt.presupuesto.dominio.CondicionComercial;
import com.jkt.presupuesto.dominio.Nota;
import com.jkt.presupuesto.dominio.Presupuesto;
import com.jkt.presupuesto.dominio.PresupuestoDet;
import com.jkt.presupuesto.operaciones.HelperRecuperarDeterminacionesConPrecios;
import com.jkt.varios.dominio.Moneda;

/**
 * Recupera un presupuesto y todas sus relaciones.
 * <p>Recupera las notas del presupuesto, y las notas totales sin chequear.</p>
 * <p>De la misma forma que con las notas, las condiciones comerciales.</p>
 * <p>Recupera todos los items, sean del sector de taller, de labo electrico, labo quimico o service.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 * @author Santiago Braceras - Jakarta SRL
 * 
 */
public class TraerPedido extends HelperRecuperarDeterminacionesConPrecios {

	private static final String LABORATORIO_ELECTRICO = "LaboratorioElectrico";

	private static final String LABORATORIO_QUIMICO = "LaboratorioQuimico";

	private static final String OID = "oid".toUpperCase();

	private static final String WRITER_PEDIDO = "pedido";
	private static final String WRITER_ITEMS = "items";
	private static final String WRITER_MATERIALES = "materiales";
	private static final String WRITER_DET_ELEC= "determinacionElectrica";
	private static final String WRITER_DET_QUIMI= "determinacionQuimica";
	private static final String WRITER_NOTAS= "notas";
	private static final String WRITER_COND_COMERCIAL= "condicionesComerciales";

	private Moneda monedaporDefecto ;
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(OID));
		
		Configuracion configuracionMonedaPorDefecto = obtenerConfiguracion(NOMBRE_PARAMETRO_MONEDA_POR_DEFECTO);
		monedaporDefecto = (Moneda) obtener(Moneda.class, Long.valueOf(configuracionMonedaPorDefecto.getValorNumero()));
		
		obtenerLaboratorios();
		
		Pedido pedido=(Pedido) obtener(Pedido.class, (String)aParams.get(OID));

		asignarNotas(pedido);
		
		asignarDeterminaciones(pedido, PresupuestoDet.CHAR_QUIMICO, laboQuimico.getId());
		asignarDeterminaciones(pedido, PresupuestoDet.CHAR_ELECTRICO, laboElectrico.getId());
		
		asignarDetalles(pedido);		

		asignarDocs(pedido);		

		notificarObjeto("", pedido);

	}

	private void asignarDeterminaciones(Pedido pedido, char tipoDetalle, long idLaboratorio) {
		Query hql = this.crearHQL("from Determinacion d where d.laboratorio.id = :idLaboratorio");
		hql.setParameter("idLaboratorio", idLaboratorio);
		List<Determinacion> allDets = hql.list();
		
		List<PedidoDet> allDetails = pedido.getDetalles();
		List<Long> idDeterminaciones = new ArrayList<Long>();

		for (PedidoDet pedidoDet : allDetails) {
			if(pedidoDet.getTipoDetalle()==tipoDetalle){
				idDeterminaciones.add(pedidoDet.getDeterminacion().getId());
			}
		}
		
		for (Determinacion determinacion : allDets) {
			if(!idDeterminaciones.contains(determinacion.getId())){
				PedidoDet pedidoDet = new PedidoDet();
				pedidoDet.setDeterminacion(determinacion);
				pedidoDet.setTipoDetalle(tipoDetalle);
				pedidoDet.setMoneda(monedaporDefecto);
				pedido.getDetalles().add(pedidoDet);
			}
		}
		
	}
	
	private void asignarDocs(Pedido pedido) {
		
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

	private void asignarNotas(Pedido pedido) throws Exception, IllegalAccessException, InvocationTargetException {
		// Obtengo todas las Notas...
		List<PersistentEntity> notas = serviceRepository.getAll(Nota.class);
		// Notas que tiene el presupuesto guardadas
		List<Nota> notasDelPedido = pedido.getNotas();

		
		Nota nota;
		for (PersistentEntity currentObject : notas) {
			nota = (Nota) currentObject;
			// Si la Nota esta activa la notifico
			if (nota.isActivo()) {
				Nota nuevaNota = new Nota();
				
				copyProperties(nuevaNota, nota);
				
				// Ahora, si ya estaba guardada en el presupuesto actual, entonces la mando 'chequeada'
				if (notasDelPedido.contains(nota)) {
					nuevaNota.setIncluida(true);
				}
				pedido.agregarNotaTransiente(nuevaNota);
			}
		}
	}

	/**
	 * Notifica los detalles del presupuesto en el writer correspondiente segun si fue el presupuesto se baso en una cotizacion, y el tipo de detalle (labo quim,labo elec, material)
	 * @throws Exception 
	 */
	private void asignarDetalles(Pedido pedido) throws Exception {
		
		return;
		
		/*
		 * El bucle no distingue de tipos de items, con lo cual voy agregando a dos listas diferentes
		 */
		
//		laboratorioQuimico=true;
//		List determinacionesEnLista;
//		if (pedido.getListaPrecios()==null) {
//			determinacionesEnLista = new ArrayList();
//		}else{
//			determinacionesEnLista = mostrarDeterminaciones(laboQuimico.getId(), pedido.getListaPrecios());
//		}
			
//		mostrarNuevosElementos(laboQuimico.getId(), determinacionesEnLista);
		/*
		 * Por cada uno de estos elementos de esta lista, se habra ejecutado el metodo realizarAccionSobreDetalle.
		 * 
		 * Para saber que labo es, agregao una variable de estado, la cual es solamente de este objeto.
		 */
//		laboratorioQuimico=false;
//		if (pedido.getListaPrecios()==null) {
//			determinacionesEnLista = new ArrayList();
//		}else{
//			determinacionesEnLista = mostrarDeterminaciones(laboElectrico.getId(), pedido.getListaPrecios());
//		}
//		mostrarNuevosElementos(laboElectrico.getId(), determinacionesEnLista);
		
		/*
		 * Una vez que tome todas las determinaciones de ambos laboratorios, y cada elemento esta en su correspondiente lista, muestro haciendo un disjunction...
		 */
		
//		mostrarDeterminacionesQuimicasNuevas(idsDeterQuim, detallesLaboratorioQuimico);
//		mostrarDeterminacionesElectricasNuevas(idsDeterElect, detallesLaboratorioElectrico);
	}

	private void mostrarDeterminacionesElectricasNuevas(List idsDeterElect, List<ListaPrecioDetalle> detallesLaboratorioElectrico2) {
		mostrarDeterminaciones(detallesLaboratorioElectrico2,idsDeterElect, WRITER_DET_ELEC);
	}

	private void mostrarDeterminacionesQuimicasNuevas(List idsDeterQuim, List<ListaPrecioDetalle> detallesLaboratorioQuimico2) {
		mostrarDeterminaciones(detallesLaboratorioQuimico2,idsDeterQuim, WRITER_DET_QUIMI);
	}
	
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
