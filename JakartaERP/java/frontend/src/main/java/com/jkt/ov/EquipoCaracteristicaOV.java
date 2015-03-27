package com.jkt.ov;

public class EquipoCaracteristicaOV extends DescriptibleOV {

	private Long idCaracteristica;
	
	private int valorEntero;
	private boolean valorBoolean;
	private String valorString;
	private double valorDouble;
	private Long idValor;
	
	private String idValorTabla;
	private String codigoValorTabla;
	private String descValorTabla;
	private DescriptibleOV valorTabla= new DescriptibleOV();

	
	public DescriptibleOV getValorTabla() {
		return valorTabla;
	}

	public void setValorTabla(DescriptibleOV valorTabla) {
		this.valorTabla = valorTabla;
	}

	private CaracteristicaProductoOV caracteristicaProductoOV = new CaracteristicaProductoOV();
	
	public CaracteristicaProductoOV getCaracteristicaProductoOV() {
		return caracteristicaProductoOV;
	}

	public void setCaracteristicaProductoOV(
			CaracteristicaProductoOV caracteristicaProductoOV) {
		this.caracteristicaProductoOV = caracteristicaProductoOV;
	}

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

	public Long getIdValor() {
		return idValor;
	}

	public void setIdValor(Long idValor) {
		this.idValor = idValor;
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

	public boolean isValorBoolean() {
		return valorBoolean;
	}

	public boolean getValorBoolean() {
		return valorBoolean;
	}

	public void setValorBoolean(boolean valorBoolean) {
		this.valorBoolean = valorBoolean;
	}

	public Long getIdCaracteristica() {
		return idCaracteristica;
	}

	public void setIdCaracteristica(Long idCaracteristica) {
		this.idCaracteristica = idCaracteristica;
	}

}
