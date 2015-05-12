package com.jkt.cotizador.dominio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.Producto;
import com.jkt.varios.dominio.Moneda;


/**
 * <p>Representa un elemento del arbol de modelo de cotizador. Es un nodo, q puede ser titulo o concepto.</p>
 * <p>En caso de ser concepto, estará como hoja del arbol, y puede o no tener un articulo relacionado.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class TituloModeloCotizador extends PersistentEntity {


	/*
	 * Variable transiente para mostar informacion
	 */
	private int identificadorDetalle=0;
	
	/*
	 * Variable transiente para mostar informacion
	 */
	
	
	
	private String codigo, descripcion;
	private TituloModeloCotizador tituloPadre;
	private List<TituloModeloCotizador> titulosHijos=new ArrayList<TituloModeloCotizador>();
	private ConceptoPresupuesto concepto;
	private ModeloCotizador modeloCotizador;
	
	private int codigoInterno,codigoInternoPadre;
	private String tipo="T";//para diferenciar entre titulos y conceptos.TODO armar el mapeo de un char en DelphiAdapter...
	private CotizadorDet detalleDeConcepto;//campo transiente para mostrar la salida en la operacion de mostrar cotizador.
	private Producto producto;//campo transiente para mostrar la descripcion y demas datos a completar...
	
	
	public void agregarHijo(TituloModeloCotizador hijo){
		if (!titulosHijos.contains(hijo)) {
			titulosHijos.add(hijo);
			hijo.setTituloPadre(this);
		}
	}
	

	/*
	 * Estos dos metodos son helpers que solucionan el tema de diferenciar titulos y conceptos.
	 * Un titulo cuando tiene tipo C, tendra relacionado un concepto si o si.
	 * Cuando ocurre esto, el codigo y la descripcion se toma del concepto y no de titulo.
	 * 
	 */
	public String getCodigoReal(){
		if (concepto==null) {
			return this.codigo;
		}else{
			return this.concepto.getCodigo();
		}
		
	}
	public String getDescripcionReal(){
		if (concepto==null) {
			return this.descripcion;
		}else{
			return this.concepto.getDescripcion();
		}
	}
	
	/*
	 * Campos transientes que sirven para depositar el precio y la moneda.
	 * 
	 */
	private Moneda moneda;
	private double precio;
	private Date fechaPrecioCosto;
	
}
