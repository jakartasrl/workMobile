package com.jkt.cotizador.operaciones;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jkt.cotizador.dominio.ModeloCotizador;
import com.jkt.cotizador.dominio.TituloModeloCotizador;
import com.jkt.operaciones.Operation;

/**
 * <p>Guardar un modelo de cotizador.</p>
 * <p>Establece la jerarquia de titulos, y le asigna los conceptos recibidos al titulo de ultimo nivel</p>
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class GuardarModeloCotizador extends Operation {

	private static final String KEY_OBJECT = "modelo";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		ModeloCotizador modelo = (ModeloCotizador) aParams.get(KEY_OBJECT);
		
		Map<String, TituloModeloCotizador> mapaDetitulos=new HashMap<String, TituloModeloCotizador>();
		List<TituloModeloCotizador> titulos = modelo.getTitulosTransientes();
		
		//Guardo todos los titulos en un mapa para tener una referencia de la jerarquia...
		for (TituloModeloCotizador titulo : titulos) {
			mapaDetitulos.put(String.valueOf(titulo.getCodigoInterno()), titulo);
		}
		
		//armo la jerarquia retornando el primer elemento, el titulo padre.
		establecerRelaciones(modelo, mapaDetitulos, titulos);

		
		//guardo el modelo de cotizador.
		guardar(modelo);
	}

	/**
	 * Establece la jerarquia entre los titulos y asigna al modelo su titulo principal.
	 * 
	 * @param modelo Para setear el primer titulo
	 * @param mapaDetitulos donde estan depositados todos los titulos desordenados pero con una referencia a su codigo interno
	 * @param titulos los titulos totalmente desordenados
	 */
	private void establecerRelaciones(ModeloCotizador modelo, Map<String, TituloModeloCotizador> mapaDetitulos, List<TituloModeloCotizador> titulos) {
		int codigoPadre;
		TituloModeloCotizador tituloEnMapa;
		for (TituloModeloCotizador titulo :titulos ) {
			
			codigoPadre = titulo.getCodigoInternoPadre();
			if (codigoPadre==0) {
				modelo.agregarTitulo(titulo);//es el nivel mas alto.
			}else{
				//buscar la referencia del padre.
				tituloEnMapa = mapaDetitulos.get(String.valueOf(codigoPadre));
				
				titulo.setTituloPadre(tituloEnMapa);
				tituloEnMapa.agregarHijo(titulo);
				
				//TODO FIXME titulo tipo, si titulo tipo es C verifico pedir articulo y si tiene el valor del componente
			}
		}
	}


}
