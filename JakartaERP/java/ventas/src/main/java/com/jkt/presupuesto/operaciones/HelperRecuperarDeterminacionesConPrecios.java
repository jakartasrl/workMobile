package com.jkt.presupuesto.operaciones;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.ListaPrecioDetalle;
import com.jkt.dominio.ListaPrecios;
import com.jkt.laboratorio.dominio.AnalisisDet;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Moneda;

/**
 * Clase d ayuda que reune metodos genericos para poder recupera determinaciones, ordenadas por analisis, para determinado laboratorio, lista de precio, etc.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class HelperRecuperarDeterminacionesConPrecios extends Operation {

	protected static final String PRECIO_WRITER = "precio";
	protected static final String OID_LISTA_PRECIO = "oid_lista_precio".toUpperCase();
	protected static final String LABORATORIO = "laboratorio".toUpperCase();
	protected static final String NOMBRE_PARAMETRO_MONEDA_POR_DEFECTO = "MonedaPorDefecto";
	
	/**
	 * <p>Aquí un closure, que ejecuta sentencias de codigo sobre un detalle.</p>
	 * Cada subclase de esta, debe implementar la funcionalidad apropiada sobre el detalle, por ejemplo, solo notificar, agregar el detalle a una lista, modificar datos, etc.
	 * 
	 */
	protected abstract void realizarAccionSobreDetalle(ListaPrecioDetalle detalle);
	
	protected List mostrarDeterminaciones(long idLaboratorio, ListaPrecios lista) {
		//Recupera las determinaciones a partir de los analisis,y buscando en la lista de precios su existencia.
		List analisisDeterminacionConPrecio= obtenerDeterminacionesConPrecios(lista.getId(), idLaboratorio);
		List ids=new ArrayList<Long>();
		
		//Muestra en la salida las determinaciones con sus correspondientes precios
		ListaPrecioDetalle detalle;
		AnalisisDet relacionAnalisisDeterminacion;
		Query qFindUnique;
		String hqlFindUnique="from ListaPrecioDetalle precio where precio.determinacion.laboratorio.id= :idLaboratorio and precio.listaPrecios.id= :idLista and precio.determinacion.id=:idDeterminacion";
		for (Object object : analisisDeterminacionConPrecio) {
			relacionAnalisisDeterminacion=(AnalisisDet) object;
			qFindUnique = crearHQL(hqlFindUnique);
			qFindUnique.setParameter("idLista", lista.getId());
			qFindUnique.setParameter("idLaboratorio", relacionAnalisisDeterminacion.getAnalisis().getLaboratorio().getId()); //el labo se lo pido o al analisis o lo tengo desde la configuracion de parametros de entrada
			qFindUnique.setParameter("idDeterminacion", relacionAnalisisDeterminacion.getDeterminacion().getId());
			detalle=(ListaPrecioDetalle) qFindUnique.uniqueResult(); //Es seguro que existe ya qe consulto antes, en el metodo #obtenerDeterminacionesConPrecios
			
			//Datos para ordenar por analisis. Todos estos analisis pertenecen al mismo laboratorio
			detalle.getDeterminacion().setDescripcionAnalisis(relacionAnalisisDeterminacion.getAnalisis().getDescripcion());
			detalle.getDeterminacion().setCodigoAnalisis(relacionAnalisisDeterminacion.getAnalisis().getCodigo());

//			detalle.setId(0L);
//			notificarObjeto(PRECIO_WRITER, detalle);
			realizarAccionSobreDetalle(detalle);
			//Guarda el id para luego poder utilizarlo para mostrar las nuevos determinaciones
			ids.add(detalle.getDeterminacion().getId());
		}
		return ids;
	}

	/**
	 * <p>Muestra los laboratorios que no estan en la lista de precios, en un formato de detalle de lista de precio para que el usuario pueda ingresar sus costos</p>
	 * FIXME creo que sta de mas, xq si la lista es vacio, tengo q mostrar tods, entonces seria un where laboratorio solamente.
	 * @throws Exception Cuando la monedapor defecto no existe
	 */
	protected void mostrarNuevosElementos(long idLaboratorio, List ids) throws Exception {
		ListaPrecioDetalle detalle;
		
		Configuracion configuracionMonedaPorDefecto = obtenerConfiguracion(NOMBRE_PARAMETRO_MONEDA_POR_DEFECTO);
		Moneda monedaporDefecto = (Moneda) obtener(Moneda.class, Long.valueOf(configuracionMonedaPorDefecto.getValorNumero()));
		
		String hqlDeterminacionesSinPrecio="select d from AnalisisDet d where d.analisis.laboratorio.id= :idLaboratorio";
//		String hqlDeterminacionesSinPrecio="from Determinacion d where d.laboratorio.id= :idLaboratorio";

		if (!ids.isEmpty()) {
			hqlDeterminacionesSinPrecio+=QUERY_UTILS_SPACE + "and d.determinacion.id not in (:ids)";
		}
		Query qDeterminacionesSinPrecio = crearHQL(hqlDeterminacionesSinPrecio);
		qDeterminacionesSinPrecio.setParameter("idLaboratorio", idLaboratorio);
		
		if (!ids.isEmpty()) {
			qDeterminacionesSinPrecio.setParameterList("ids", ids);			
		}
		
		List<AnalisisDet> analisisDeterminaciones= qDeterminacionesSinPrecio.list();
//		List<Determinacion> determinaciones= qDeterminacionesSinPrecio.list();
		
		if (!analisisDeterminaciones.isEmpty()) {
			
			Determinacion determinacion;
			for (AnalisisDet relacion : analisisDeterminaciones) {
				if (!ids.contains(relacion.getDeterminacion().getId())) {
					detalle = new ListaPrecioDetalle();

					detalle.setPrecio(0);
					detalle.setMoneda(monedaporDefecto);
					
					/*
					 * Seteo datos del analisis para poder mostrarlos con precio 0, pero con un analisis valido.
					 */
					determinacion=relacion.getDeterminacion();
					determinacion.setCodigoAnalisis(relacion.getAnalisis().getCodigo());
					determinacion.setDescripcionAnalisis(relacion.getAnalisis().getDescripcion());
					
					detalle.setDeterminacion(determinacion);
//					detalle.setId(0L);
//					notificarObjeto(PRECIO_WRITER, detalle);
					realizarAccionSobreDetalle(detalle);
				}
			}
		}
		
	}
	
	/**
	 * <p>Recupera todas los detalles de lista de precio para una lista de precio dada y un laboratorio.</p>
	 * <p>De la forma en que esta realizada la alta de nuevos datos, nunca existiran dos detalles para el mismo producto/determinacion</p>
	 * 
	 */
	protected List obtenerDeterminacionesConPrecios(long idLista, long idLaboratorio){
		
		String hqlDeterminaciones="select relacion from "

				//tabla relacion
				+ "AnalisisDet relacion" 
				
				//tabla lPrecios
				+ " where relacion.analisis.laboratorio.id =:idLaboratorio and relacion.determinacion.id in (select precios.determinacion.id as idsDeterminacion from ListaPrecioDetalle precios where precios.listaPrecios.id= :idLista and precios.determinacion.laboratorio.id= :idLaboratorio )";
		
		
		/*
		 * Consulta anterior a ver el requerimiento de agrupar por analisis.
		 * Al no tener en claro las relaciones, se tuve que generar una hql mas compleja
		 */
		/*
		String hqlDeterminaciones="from ListaPrecioDetalle precios where precios.listaPrecios.id= :idLista"
				+ QUERY_UTILS_SPACE
				+ "and precios.determinacion.laboratorio.id = :idLaboratorio";
		*/
		
		Query qDeterminaciones = crearHQL(hqlDeterminaciones);
		qDeterminaciones.setParameter("idLista", idLista);
		qDeterminaciones.setParameter("idLaboratorio", idLaboratorio);
		return qDeterminaciones.list();
	}
	
}
