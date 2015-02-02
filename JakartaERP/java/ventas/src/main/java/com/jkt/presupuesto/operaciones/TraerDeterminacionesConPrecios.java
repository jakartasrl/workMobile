package com.jkt.presupuesto.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.ListaPrecioDetalle;
import com.jkt.dominio.ListaPrecios;
import com.jkt.excepcion.JakartaException;
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
			throw new JakartaException("Se encontro una inconsistencia con el valor numerico de la configuraci�n del laboratorio '"+aParams.get(LABORATORIO)+"'");
		}

		List determinacionesConPrecio= obtenerDeterminacionesConPrecios(lista.getId(), idLaboratorio);
		List ids=new ArrayList<Long>();
		
		//Muestra en la salida las determinaciones con sus correspondientes precios
		ListaPrecioDetalle detalle;
		for (Object object : determinacionesConPrecio) {
			detalle=(ListaPrecioDetalle) object;
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
		String hqlDeterminacionesSinPrecio="from Determinacion d where d.laboratorio.id= :idLaboratorio";
		if (!ids.isEmpty()) {
			hqlDeterminacionesSinPrecio+=QUERY_UTILS_SPACE + "and d.id not in (:ids)";
		}
		Query qDeterminacionesSinPrecio = crearHQL(hqlDeterminacionesSinPrecio);
		qDeterminacionesSinPrecio.setParameter("idLaboratorio", idLaboratorio);
		
		if (!ids.isEmpty()) {
			qDeterminacionesSinPrecio.setParameterList("ids", ids);			
		}
		
		List<Determinacion> determinaciones= qDeterminacionesSinPrecio.list();
		
		if (!determinaciones.isEmpty()) {
			
			for (Determinacion determinacion : determinaciones) {
				if (!ids.contains(determinacion.getId())) {
					detalle = new ListaPrecioDetalle();
					detalle.setPrecio(0);
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
		String hqlDeterminaciones="from ListaPrecioDetalle precios where precios.listaPrecios.id= :idLista"
				+ QUERY_UTILS_SPACE
				+ "and precios.determinacion.laboratorio.id = :idLaboratorio";
		Query qDeterminaciones = crearHQL(hqlDeterminaciones);
		qDeterminaciones.setParameter("idLista", idLista);
		qDeterminaciones.setParameter("idLaboratorio", idLaboratorio);
		return qDeterminaciones.list();
	}

}
