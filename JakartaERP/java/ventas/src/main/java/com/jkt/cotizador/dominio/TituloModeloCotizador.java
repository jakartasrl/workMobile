package com.jkt.cotizador.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.Producto;

public class TituloModeloCotizador extends PersistentEntity {

	private String codigo, descripcion;
	private TituloModeloCotizador tituloPadre;
	private List<TituloModeloCotizador> titulosHijos=new ArrayList<TituloModeloCotizador>();
	private ConceptoPresupuesto concepto;
	private ModeloCotizador modeloCotizador;
	
	private int codigoInterno,codigoInternoPadre;
	private String tipo="T";//para diferenciar entre titulos y conceptos.TODO armar el mapeo de un char en DelphiAdapter...
	private CotizadorDet detalleDeConcepto;//campo transiente para mostrar la salida en la operacion de mostrar cotizador.
	private Producto producto;//campo transiente para mostrar la descripcion y demas datos a completar...
	
	
	/*
	 * setters y getters
	 */
	
//	public char getTipo() {
//		return tipo;
//	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public CotizadorDet getDetalleDeConcepto() {
		return detalleDeConcepto;
	}

	public void setDetalleDeConcepto(CotizadorDet detalleDeConcepto) {
		this.detalleDeConcepto = detalleDeConcepto;
	}

//	public void setTipo(char tipo) {
//		this.tipo = tipo;
//	}
	

	public String getCodigo() {
		return codigo;
		
		//TODO comprobar si tiene concepto, si tiene mandar el codigo del concepto y la descripcion tambien!
		
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public TituloModeloCotizador getTituloPadre() {
		return tituloPadre;
	}

	public void setTituloPadre(TituloModeloCotizador tituloPadre) {
		this.tituloPadre = tituloPadre;
	}

	public List<TituloModeloCotizador> getTitulosHijos() {
		return titulosHijos;
	}

	public void setTitulosHijos(List<TituloModeloCotizador> titulosHijos) {
		this.titulosHijos = titulosHijos;
	}

	public ConceptoPresupuesto getConcepto() {
		return concepto;
	}

	public void setConcepto(ConceptoPresupuesto concepto) {
		this.concepto = concepto;
	}

	public ModeloCotizador getModeloCotizador() {
		return modeloCotizador;
	}

	public void setModeloCotizador(ModeloCotizador modeloCotizador) {
		this.modeloCotizador = modeloCotizador;
	}

	public int getCodigoInterno() {
		return codigoInterno;
	}

	public void setCodigoInterno(int codigoInterno) {
		this.codigoInterno = codigoInterno;
	}

	public int getCodigoInternoPadre() {
		return codigoInternoPadre;
	}

	public void setCodigoInternoPadre(int codigoInternoPadre) {
		this.codigoInternoPadre = codigoInternoPadre;
	}
	
	public void agregarHijo(TituloModeloCotizador hijo){
		if (!titulosHijos.contains(hijo)) {
			titulosHijos.add(hijo);
			hijo.setTituloPadre(this);
		}
	}
	
	//	public void agregarTodosLosConceptos(List<ConceptoPresupuesto> conceptos){
//		for (ConceptoPresupuesto conceptoPresupuesto : conceptos) {
//			if (!this.conceptos.contains(conceptoPresupuesto)) {
//				this.conceptos.add(conceptoPresupuesto);
//				conceptoPresupuesto.setTitulo(this);
//			}
//		}
//	}
	
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

}
