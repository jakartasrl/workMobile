package com.jkt.presupuesto.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import lombok.Data;

import org.hibernate.Query;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.ListaPrecioDetalle;
import com.jkt.dominio.ListaPrecios;
import com.jkt.excepcion.JakartaException;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.varios.dominio.Moneda;

/**
 * <p>Esta operacion recibe una cadena que representa al laboratorio, por ejemplo: laboratorioQuimico, laboratorioElectrico,
 * y para este laboratorio retornar todas sus determinaciones con los costos pertenecientes a partir de la lista de precios.</p>
 * <p>Si no tiene precios devuelve la determinacion con precio 0 y la moneda por defecto del sistema.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class TraerDeterminacionesConPrecios extends HelperRecuperarDeterminacionesConPrecios {

	private Moneda monedaporDefecto;
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(LABORATORIO));

		Configuracion configuracionMonedaPorDefecto = obtenerConfiguracion(NOMBRE_PARAMETRO_MONEDA_POR_DEFECTO);
		monedaporDefecto = (Moneda) obtener(Moneda.class, Long.valueOf(configuracionMonedaPorDefecto.getValorNumero()));
		
		Configuracion configuracionLaboratorio = obtenerConfiguracion((String)aParams.get(LABORATORIO));
		long idLaboratorio=configuracionLaboratorio.getValorNumero();
		if (idLaboratorio<1) {
			throw new JakartaException("Se encontro una inconsistencia con el valor numerico de la configuración del laboratorio '"+aParams.get(LABORATORIO)+"'");
		}

		if(aParams.get(OID_LISTA_PRECIO)==null){
			mostrarNuevosElementos(idLaboratorio, new ArrayList<Long>());
			return;
		}
		
		ListaPrecios lista = (ListaPrecios) obtener(ListaPrecios.class, (String)aParams.get(OID_LISTA_PRECIO));
		
		Query hql = this.crearHQL("from Determinacion d where d.laboratorio.id = :idLaboratorio");
		hql.setParameter("idLaboratorio", idLaboratorio);
		List<Determinacion> allDets = hql.list();
		List<Long> idDeterminaciones = new ArrayList<Long>();

		List<ListaPrecioDetalle> detalles2 = lista.getDetalles();
		
		for (ListaPrecioDetalle listaPrecioDetalle : detalles2) {
			if(listaPrecioDetalle.getDeterminacion()!=null && listaPrecioDetalle.getDeterminacion().getLaboratorio().getId()==idLaboratorio){
				detalles.add(listaPrecioDetalle);
				idDeterminaciones.add(listaPrecioDetalle.getDeterminacion().getId());
			}
		}
		
		for (Determinacion determinacion : allDets) {
			if(!idDeterminaciones.contains(determinacion.getId())){
				ListaPrecioDetalle listaPrecioDetalle = new ListaPrecioDetalle();
				listaPrecioDetalle.setDeterminacion(determinacion);
				listaPrecioDetalle.setMoneda(monedaporDefecto);
				detalles.add(listaPrecioDetalle);
			}
		}
		
		/*
		List  ids = new ArrayList();
		if (lista!=null) {
			ids= mostrarDeterminaciones(idLaboratorio, lista);
		}

		//Mostrar nuevos elementos
		mostrarNuevosElementos(idLaboratorio, ids);
	
	
		//Notificar todos los objetos.
		notificarObjeto("", detalles);
		*/
		notificarObjeto("", detalles);
	}

	private List<ListaPrecioDetalle> detalles=new ArrayList<ListaPrecioDetalle>();
	
	@Override
	protected void realizarAccionSobreDetalle(ListaPrecioDetalle detalle) {
//		notificarObjeto("", detalle);
		detalles.add(detalle);
//		notificarObjeto(PRECIO_WRITER, detalle);
	}

}
