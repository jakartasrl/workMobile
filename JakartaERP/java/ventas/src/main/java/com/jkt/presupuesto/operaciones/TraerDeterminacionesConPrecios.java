package com.jkt.presupuesto.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.ListaPrecioDetalle;
import com.jkt.dominio.ListaPrecios;
import com.jkt.excepcion.JakartaException;

/**
 * <p>Esta operacion recibe una cadena que representa al laboratorio, por ejemplo: laboratorioQuimico, laboratorioElectrico,
 * y para este laboratorio retornar todas sus determinaciones con los costos pertenecientes a partir de la lista de precios.</p>
 * <p>Si no tiene precios devuelve la determinacion con precio 0 y la moneda por defecto del sistema.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerDeterminacionesConPrecios extends HelperRecuperarDeterminacionesConPrecios {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(LABORATORIO));

		Configuracion configuracionLaboratorio = obtenerConfiguracion((String)aParams.get(LABORATORIO));
		long idLaboratorio=configuracionLaboratorio.getValorNumero();
		if (idLaboratorio<1) {
			throw new JakartaException("Se encontro una inconsistencia con el valor numerico de la configuración del laboratorio '"+aParams.get(LABORATORIO)+"'");
		}

		//		validarEntrada(aParams.get(OID_LISTA_PRECIO));
		if(aParams.get(OID_LISTA_PRECIO)==null){
			mostrarNuevosElementos(idLaboratorio, new ArrayList<Long>());
			return;
		}
		
		ListaPrecios lista = (ListaPrecios) obtener(ListaPrecios.class, (String)aParams.get(OID_LISTA_PRECIO));
		
		List  ids = new ArrayList();
		if (lista!=null) {
			ids= mostrarDeterminaciones(idLaboratorio, lista);
		}

		//Mostrar nuevos elementos
		mostrarNuevosElementos(idLaboratorio, ids);
	}

	@Override
	protected void realizarAccionSobreDetalle(ListaPrecioDetalle detalle) {
		notificarObjeto(PRECIO_WRITER, detalle);
	}

}
