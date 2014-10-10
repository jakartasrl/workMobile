package com.jkt.cotizador.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.cotizador.dominio.ConceptoPresupuesto;
import com.jkt.cotizador.dominio.ModeloCotizador;
import com.jkt.cotizador.dominio.TituloModeloCotizador;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;

/**
 * <p>Recupera el modelo de cotizador, sus titulos en forma jerarquica y los conceptos de presupuestos.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerModeloCotizador extends Operation {

	//key para recuperar del mapa, desde el cliente enviarán OID=2, por ejemplo.
	private static final String OID = "OID";

	//writers mapeados contra el archivo operaciones-ventas.xml
	private static final String WRITER_MODELO = "modelo";
	private static final String WRITER_TITULO = "titulos";
	private static final String WRITER_CONCEPTO = "conceptos";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(OID));
		
		ModeloCotizador modelo=(ModeloCotizador) obtener(ModeloCotizador.class, (String)aParams.get(OID));
		
		notificarObjecto(Notificacion.getNew(WRITER_MODELO, modelo));
		
		List<TituloModeloCotizador> titulos = modelo.getTitulos();
		for (TituloModeloCotizador tituloModeloCotizador : titulos) {
			mostrarArbol(tituloModeloCotizador,0);//El nivel de los primeros nodos es cero.
		}
		
	}

	private void mostrarArbol(TituloModeloCotizador tituloModeloCotizador, int codigoInternoPadre) {
		
		tituloModeloCotizador.setCodigoInterno((int)tituloModeloCotizador.getId());
		tituloModeloCotizador.setCodigoInternoPadre(codigoInternoPadre);

		notificarObjecto(Notificacion.getNew(WRITER_TITULO, tituloModeloCotizador));

		//Recursividad, o muestreo de concepto.
		List<TituloModeloCotizador> titulosHijos = tituloModeloCotizador.getTitulosHijos();
		if (titulosHijos.isEmpty()) {
			//Significa que puede llegar a tener conceptos, xq es de ultimo nivel.Verificamos esto.
			ConceptoPresupuesto concepto = tituloModeloCotizador.getConcepto();
			if (concepto!=null) {
				notificarObjecto(Notificacion.getNew(WRITER_CONCEPTO, concepto));
			}
			
		}else{
			for (TituloModeloCotizador subTitulo : titulosHijos) {
				mostrarArbol(subTitulo, tituloModeloCotizador.getCodigoInterno());//se le envia el codigo interno actual (id de base) a cada hijo
			}
		}
		
	}

}
