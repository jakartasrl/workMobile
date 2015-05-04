package com.jkt.dominio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.varios.dominio.Especificacion;


/**
 * <p>Representa a un comprobante.</p>
 * <p>Esta clase sera super clase de todo tipo de comprobante.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class Comprobante extends PersistentEntity {

	/*
	 * variables de instancia
	 * ***********************************************
	 */
	
	/*
	 * Un Pedido puede estar relacionado a un presupuesto.
	 * Un Presupuesto puede estar relacionado a una cotizacion
	 */
	protected Comprobante comprobanteRelacionado;
	
	private String letra;
	private String lugarEmision;
	private String nro;
	private boolean anulado=false;
	

	@NotNull(message="Debe ingresar obligatoriamente un tipo de comprobante.")
	private TipoComprobante tipoComprobante;
	
//	@NotNull(message="El comprobante a generar debe tener obligatoriamente una fecha.")
	private Date fecha;
	
	private List<Especificacion> archivos=new ArrayList<Especificacion>();	
	/*
	 * variables de instancia
	 * ***********************************************
	 */

//	public void setComprobanteRelacionado(Comprobante comprobanteRelacionado) {
//		this.comprobanteRelacionado = comprobanteRelacionado;
//	}
	
	public Comprobante getComprobanteRelacionado() {
		return comprobanteRelacionado;
	}
	
	public Comprobante(){
		super();
		this.fecha=new Date();
	}
	
	public void agregarEspecificacion(Especificacion e){
		if (!archivos.contains(e)) {
			archivos.add(e);
		}
	}
	
	public List<Especificacion> getArchivos() {
		return archivos;
	}

	public void setArchivos(List<Especificacion> archivos) {
		this.archivos = archivos;
	}

	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public TipoComprobante getTipoComprobante() {
		return tipoComprobante;
	}
	public void setTipoComprobante(TipoComprobante tipoComprobante) {
		this.tipoComprobante = tipoComprobante;
	}
	
	public String getLugarEmision() {
		return lugarEmision;
	}
	public String getLetra() {
		return letra;
	}

	public void setLetra(String letra) {
		this.letra = letra;
	}

	public void setLugarEmision(String lugarEmision) {
		this.lugarEmision = lugarEmision;
	}
	
	public boolean isAnulado() {
		return anulado;
	}
	public String getNro() {
		return nro;
	}

	public void setNro(String nro) {
		this.nro = nro;
	}

	public void setAnulado(boolean anulado) {
		this.anulado = anulado;
	}
	
	/*
	 * Helper methods! estos seran implementados, o pisados mejor dicho en cada hijo que corresponda
	 */
	public boolean isPedido(){
		return false;
	}
	public boolean isCotizacion(){
		return false;
	}
	public boolean isPresupuesto(){
		return false;
	}
	public boolean isOrdenFabricacion(){
		return false;
	}
	
	
	
}
