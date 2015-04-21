package com.jkt.ov;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=true)
public class CaracteristicaProductoOV extends DescriptibleOV {

	private Long idEquipoCaracteristica=0L;
	private String tipoDato;
	private String idTabla;
	private DescriptibleOV valorTabla=new DescriptibleOV(); 
	
	private int valorEntero;
	private boolean valorBoolean;
	private String valorString;
	private double valorDouble;
	
	private String idValorTabla;
	private String codigoValorTabla;
	private String descValorTabla;
	
	public String getIdValorTabla() {
		return idValorTabla;
	}

	public void setIdValorTabla(String idValorTabla) {
		this.idValorTabla = idValorTabla;
	}

	public String getCodigoValorTabla() {
		return codigoValorTabla;
	}

	public void setCodigoValorTabla(String codigoValorTabla) {
		this.codigoValorTabla = codigoValorTabla;
	}

	public String getDescValorTabla() {
		return descValorTabla;
	}

	public void setDescValorTabla(String descValorTabla) {
		this.descValorTabla = descValorTabla;
	}

	public double getValorDouble() {
		return valorDouble;
	}

	public void setValorDouble(double valorDouble) {
		this.valorDouble = valorDouble;
	}

	public String getValorString() {
		return valorString;
	}

	public void setValorString(String valorString) {
		this.valorString = valorString;
	}

	public int getValorEntero() {
		return valorEntero;
	}

	public void setValorEntero(int valorEntero) {
		this.valorEntero = valorEntero;
	}

	public boolean getValorBoolean() {
		return valorBoolean;
	}

	public void setValorBoolean(boolean valorBoolean) {
		this.valorBoolean = valorBoolean;
	}

	public Long getIdEquipoCaracteristica() {
		return idEquipoCaracteristica;
	}

	public void setIdEquipoCaracteristica(Long idEquipoCaracteristica) {
		this.idEquipoCaracteristica = idEquipoCaracteristica;
	}

	public DescriptibleOV getValorTabla() {
		return valorTabla;
	}

	public void setValorTabla(DescriptibleOV valorTabla) {
		this.valorTabla = valorTabla;
	}

	public String getTipoDato() {
		return tipoDato;
	}

	public void setTipoDato(String tipoDato) {
		this.tipoDato = tipoDato;
	}

	public String getIdTabla() {
		return idTabla;
	}

	public void setIdTabla(String idTabla) {
		this.idTabla = idTabla;
	}

}
