package com.jkt.dominio;

public class Cotizacion extends ComprobanteVenta {

	public enum Estado { PENDIENTE, INICIADA};
	
	private String estado;

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getDescripcion(){
		return String.format("%s/%s",this.getFecha().toString(), this.getClienteSucursal().getDescripcion());
//		return String.format("Cotizacion numero %d para cliente %s, fecha de creacion %s.",this.getNro(),this.getClienteSucursal().getCliente().getDescripcion(),this.getFecha().toString());
	}
	
	public String getCodigo(){
		return String.valueOf(this.getNro());
	}
	
}
