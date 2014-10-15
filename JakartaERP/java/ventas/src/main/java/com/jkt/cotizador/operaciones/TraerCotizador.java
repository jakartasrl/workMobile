package com.jkt.cotizador.operaciones;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jkt.cotizador.dominio.Cotizador;
import com.jkt.cotizador.dominio.CotizadorDet;
import com.jkt.cotizador.dominio.ModeloCotizador;
import com.jkt.cotizador.dominio.TituloModeloCotizador;
import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;

/**
 * <p><b>Recupera un cotizador previamente dado de alta.</b></p>
 * <p><b>Los pasos que realiza, en resumen, son los siguientes:</b></p>
 * 
 * <p>1-Recupera el cotizador</p>
 * <p>2-Recupera el modelo de cotizador</p>
 * <p>3-Renderiza modelo de cotizador (dibuja el arbol)</p>
 * <p>4-Mapea cada concepto del modelo con los detalles del cotizador guardado previamente</p>
 * <p>5-Notifica el arbol completo, y en cada nodo, se verán los datos del cotizador.Por presupuesto, un detalle(unidades en cantidad, precios, moneda, unidad de medida, etc)</p>
 * 
 * @see ModeloCotizador
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerCotizador extends Operation {

	private static final String OID = "oid".toUpperCase();
	private static final String WRITER_MODELO = "modelo";
	private static final String WRITER_TITULO = "titulos";

	
	private Map<String, CotizadorDet> detallesDeCotizador=new HashMap<String, CotizadorDet>();
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(OID));
		
		Cotizador cotizador = (Cotizador) obtener(Cotizador.class, (String)aParams.get(OID));

		completarMapaDeDetalles(cotizador);
		
		//Mostrar datos de cotizador.
		
		ModeloCotizador modelo = cotizador.getModelo();
		
		notificarObjecto(Notificacion.getNew(WRITER_MODELO, modelo));
		
		List<TituloModeloCotizador> titulos = modelo.getTitulos();
		for (TituloModeloCotizador tituloModeloCotizador : titulos) {
			mostrarArbol(tituloModeloCotizador,0);//El nivel de los primeros nodos es cero.
		}
	}
	
	/**
	 * 
	 * <p>Este metodo tiene la funcion de recibir un cotizador y completar en un mapa sus detalles.</p>
	 * <p>Esto sirve para posteriormente, a partir de los conceptos, poder recuperar el correspondiente detalle del cotizador.</p>
	 * 
	 * @param cotizador para extraer sus detalles
	 */
	private void completarMapaDeDetalles(Cotizador cotizador) {
		List<CotizadorDet> detalles = cotizador.getDetalles();
		for (CotizadorDet cotizadorDet : detalles) {
			detallesDeCotizador.put(String.valueOf(cotizadorDet.getConceptoPresupuesto().getId()), cotizadorDet);
		}
	}

	/**
	 * <p>Este metodo recibe un titulo y un numero de nivel padre, y muestra en la salida de la operacion el titulo proporcionado, con su correspondiente nivel, 
	 * y recursivamente sus hijos.</p>
	 * 
	 * @param tituloModeloCotizador
	 * @param codigoInternoPadre
	 * @throws JakartaException Si existe alguna inconsistencia con los titulos y conceptos. Alguna inconsistencia puede ser que 
	 * un titulo no tenga hijos, y si es así, tiene que tener una referencia a un concepto, y ademas 
	 * (si la var pideArticulo es true) un componenteValor asociado.
	 */
	private void mostrarArbol(TituloModeloCotizador tituloModeloCotizador, int codigoInternoPadre) throws JakartaException {
		
		tituloModeloCotizador.setCodigoInterno((int)tituloModeloCotizador.getId());
		tituloModeloCotizador.setCodigoInternoPadre(codigoInternoPadre);

		List<TituloModeloCotizador> titulosHijos = tituloModeloCotizador.getTitulosHijos();
		boolean tieneHijos=!titulosHijos.isEmpty();

		
		CotizadorDet cotizadorDet = detallesDeCotizador.get(String.valueOf(tituloModeloCotizador.getId()));
		//Si tiene hijos es un titulo, si no tiene hijos es un concepto.
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
		
		
		/*
		 * IMPORTANTE. El objetivo de este metodo es armar el arbol del modelo, pero en cada concepto, sus datos completos en cuanto 
		 * al cotizador, es decir:
		 * 
		 * si la jerarquia tiene un padre y dos hijos conceptos, estos conceptos tienen datos relacionados cuando se habla de cotizador.
		 * datos como unidad de medida, cantidad, precio, moneda, estan relacionados a este detalle de cotizador, que esta fuertemente
		 * relacionado con el concepto.
		 * 
		 * Es por eso que decidi usar una variable transiente para poder mostrar a partir del concepto, los detalles del cotizador cargado.
		 */
		tituloModeloCotizador.setDetalleDeConcepto(cotizadorDet);
		notificarObjecto(Notificacion.getNew(WRITER_TITULO, tituloModeloCotizador));

		//Recursividad, o muestreo de concepto.
		if (tieneHijos) {
			for (TituloModeloCotizador subTitulo : titulosHijos) {
				mostrarArbol(subTitulo, tituloModeloCotizador.getCodigoInterno());//se le envia el codigo interno actual (id de base) a cada hijo
			}
		}
		
	}
	

}
