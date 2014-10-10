package com.jkt.cotizador.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.Descriptible;
import com.jkt.varios.dominio.ComponenteValor;

public class TituloConcepto extends Descriptible {

	private TituloConcepto tituloPadre, tituloHijo;
	private List<TituloConcepto> conceptos=new ArrayList<TituloConcepto>();
	private ModeloCotizador modeloCotizador;
	
	/*
	 * Cuando pideArticulo es true, esta entidad deberá tener seteado un valor de componente
	 */
	private boolean pideArticulo;
	private ComponenteValor componenteValor;
	
	/*
	 * atributos transientes para el manejo de jerarquia en arbol cuando el tipo de concepto es 'T', de Titulo
	 */
	private int codigoInterno,codigoInternoPadre;
	private char tipoEntidad; //Si recibo C es un concepto. Cuando es T es un titulo y deberé crear la estructura jerarquica.
	
}
