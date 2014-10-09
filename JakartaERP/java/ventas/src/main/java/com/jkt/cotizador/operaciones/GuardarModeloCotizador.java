package com.jkt.cotizador.operaciones;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.omg.CORBA.TIMEOUT;

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
		List<TituloModeloCotizador> titulos = modelo.getTitulos();
		
		//Guardo todos los titulos en un mapa para tener una referencia de la jerarquia...
		for (TituloModeloCotizador titulo : titulos) {
			mapaDetitulos.put(String.valueOf(titulo.getCodigoInterno()), titulo);
		}
		
		//armo la jerarquia retornando el primer elemento, el titulo padre.
		TituloModeloCotizador primerTitulo = establecerRelaciones(mapaDetitulos, titulos);
		
		//recupero el unico titulo hoja
		TituloModeloCotizador ultimoTitulo = obtenerTituloHoja(primerTitulo);
		
		//seteo los conceptos y establezco la relacion bidireccional
		ultimoTitulo.agregarTodosLosConceptos(modelo.getConceptos());
		
		//finalizo la conexion de objetos
		modelo.setTitulo(primerTitulo);
		
		//guardo el modelo de cotizador.
		guardar(modelo);
	}

	private TituloModeloCotizador obtenerTituloHoja(TituloModeloCotizador primerTitulo) {
		TituloModeloCotizador ultimoTitulo=primerTitulo;
		while(ultimoTitulo.getTituloHijo()!=null){
			ultimoTitulo=ultimoTitulo.getTituloHijo();
		}
		return ultimoTitulo;
	}

	private TituloModeloCotizador establecerRelaciones(Map<String, TituloModeloCotizador> mapaDetitulos,	List<TituloModeloCotizador> titulos) {
		int codigoPadre;
		TituloModeloCotizador primerTitulo = null, tituloEnMapa;
		for (TituloModeloCotizador titulo :titulos ) {
			codigoPadre = titulo.getCodigoInternoPadre();
			if (codigoPadre==0) {
				primerTitulo=titulo;
			}else{
				//buscar la referencia del padre.
				tituloEnMapa = mapaDetitulos.get(String.valueOf(codigoPadre));
				
				titulo.setTituloPadre(tituloEnMapa);
				tituloEnMapa.setTituloHijo(titulo);
			}
		}
		return primerTitulo;
	}
	
}
