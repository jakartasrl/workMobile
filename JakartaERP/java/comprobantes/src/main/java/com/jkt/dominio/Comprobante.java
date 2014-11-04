package com.jkt.dominio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
	private String comportamiento;
	private String letra;
	private String lugarEmision;
	private int nro;
	private boolean anulado;
	private TipoComprobante tipoComprobante;
	private Date fecha;
	private List<Especificacion> archivos=new ArrayList<Especificacion>();	
	/*
	 * variables de instancia
	 * ***********************************************
	 */
	
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

	public String getComportamiento() {
		return comportamiento;
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
	public void setComportamiento(String comportamiento) {
		this.comportamiento = comportamiento;
	}
//	public char getLetra() {
//		return letra;
//	}
//	public void setLetra(char letra) {
//		this.letra = letra;
//	}
	
	
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
	public int getNro() {
		return nro;
	}
	public void setNro(int nro) {
		this.nro = nro;
	}
	public boolean isAnulado() {
		return anulado;
	}
	public void setAnulado(boolean anulado) {
		this.anulado = anulado;
	}
	
}
