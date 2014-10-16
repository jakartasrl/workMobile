package com.jkt.cotizador.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.cotizador.dominio.ModeloCotizador;
import com.jkt.cotizador.dominio.TituloModeloCotizador;
import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;

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
//	private static final String WRITER_CONCEPTO = "conceptos";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(OID));
		
		ModeloCotizador modelo=(ModeloCotizador) obtener(ModeloCotizador.class, (String)aParams.get(OID));
		
		notificarObjeto(WRITER_MODELO, modelo);
		
		List<TituloModeloCotizador> titulos = modelo.getTitulos();
		for (TituloModeloCotizador tituloModeloCotizador : titulos) {
			mostrarArbol(tituloModeloCotizador,0);//El nivel de los primeros nodos es cero.
		}
		
	}

	private void mostrarArbol(TituloModeloCotizador tituloModeloCotizador, int codigoInternoPadre) throws JakartaException {
		
		tituloModeloCotizador.setCodigoInterno((int)tituloModeloCotizador.getId());
		tituloModeloCotizador.setCodigoInternoPadre(codigoInternoPadre);


		//Recursividad, o muestreo de concepto.
		List<TituloModeloCotizador> titulosHijos = tituloModeloCotizador.getTitulosHijos();
		boolean tieneHijos=!titulosHijos.isEmpty();

		if (!tieneHijos) {
			if(tituloModeloCotizador.getConcepto()==null){
				throw new JakartaException("El titulo no tiene un concepto relacionado.");
			}
			
			if (tituloModeloCotizador.getConcepto().isPideArticulo()) {
				if (tituloModeloCotizador.getConcepto().getComponenteValor()==null) {
					throw new JakartaException("Si el concepto relacionado al titulo, pide articulo, debe obligatoriamente tener relacionado un valor de clasificador.");
				}
			}
			
			tituloModeloCotizador.setTipo('C');//Solamente para retornar correctamente un tipo y que sea mas simple desde el cliente la lectura.
		}
		notificarObjeto(WRITER_TITULO, tituloModeloCotizador);
		
		if (tieneHijos) {
			for (TituloModeloCotizador subTitulo : titulosHijos) {
				mostrarArbol(subTitulo, tituloModeloCotizador.getCodigoInterno());//se le envia el codigo interno actual (id de base de datos) a cada hijo
			}
		}
		
	}

}
