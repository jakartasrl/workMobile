package com.jkt.presupuesto.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.ListaPrecioDetalle;
import com.jkt.dominio.ListaPrecios;
import com.jkt.excepcion.JakartaException;
import com.jkt.laboratorio.dominio.AnalisisDet;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.operaciones.Operation;

/**
 * <p>Esta operacion recibe una cadena que representa al laboratorio, por ejemplo: laboratorioQuimico, laboratorioElectrico,
 * y para este laboratorio retornar todas sus determinaciones con los costos pertenecientes a partir de la lista de precios.</p>
 * <p>Si no tiene precios devuelve la determinacion con precio 0 y la moneda por defecto del sistema.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerDeterminacionesConPrecios extends Operation {

	private static final String PRECIO_WRITER = "precio";
	private static final String OID_LISTA_PRECIO = "oid_lista_precio".toUpperCase();
	private static final String LABORATORIO = "laboratorio".toUpperCase();
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(LABORATORIO));
		validarEntrada(aParams.get(OID_LISTA_PRECIO));

		ListaPrecios lista = (ListaPrecios) obtener(ListaPrecios.class, (String)aParams.get(OID_LISTA_PRECIO));
		
		Configuracion configuracionLaboratorio = obtenerConfiguracion((String)aParams.get(LABORATORIO));
		long idLaboratorio=configuracionLaboratorio.getValorNumero();
		if (idLaboratorio<1) {
			throw new JakartaException("Se encontro una inconsistencia con el valor numerico de la configuración del laboratorio '"+aParams.get(LABORATORIO)+"'");
		}

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

			notificarObjeto(PRECIO_WRITER, detalle);
			//Guarda el id para luego poder utilizarlo para mostrar las nuevos determinaciones
			ids.add(detalle.getDeterminacion().getId());
		}

		//Mostrar nuevos elementos
		mostrarNuevosElementos(idLaboratorio, ids);
	}

	/**
	 * <p>Muestra los laboratorios que no estan en la lista de precios, en un formato de detalle de lista de precio para que el usuario pueda ingresar sus costos</p>
	 * FIXME creo que sta de mas, xq si la lista es vacio, tengo q mostrar tods, entonces seria un where laboratorio solamente.
	 * @throws Exception Cuando la monedapor defecto no existe
	 */
	private void mostrarNuevosElementos(long idLaboratorio, List ids) throws Exception {
		ListaPrecioDetalle detalle;
		
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
					
					/*
					 * Seteo datos del analisis para poder mostrarlos con precio 0, pero con un analisis valido.
					 */
					determinacion=relacion.getDeterminacion();
					determinacion.setCodigoAnalisis(relacion.getAnalisis().getCodigo());
					determinacion.setDescripcionAnalisis(relacion.getAnalisis().getDescripcion());
					
					detalle.setDeterminacion(determinacion);
					notificarObjeto(PRECIO_WRITER, detalle);
				}
			}
		}
		
	}
	
	/**
	 * <p>Recupera todas los detalles de lista de precio para una lista de precio dada y un laboratorio.</p>
	 * <p>De la forma en que esta realizada la alta de nuevos datos, nunca existiran dos detalles para el mismo producto/determinacion</p>
	 * 
	 */
	private List obtenerDeterminacionesConPrecios(long idLista, long idLaboratorio){
		
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
