package com.jkt.ov;

import com.jkt.pedido.dominio.Pedido;
import com.jkt.view.ObjectView;

/**
 * <p>ObjectView correspondiente a la entidad {@link Pedido}</p>
 * <p>Mapea los atributos que se envian y generarán o actualizarán un {@link Pedido}</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class PedidoOV extends ObjectView {

	
	private String letra;
	private String lugarEmision;
	private String nro;
	private boolean anulado = false;

	public String getLetra() {
		return letra;
	}

	public void setLetra(String letra) {
		this.letra = letra;
	}

	public String getLugarEmision() {
		return lugarEmision;
	}

	public void setLugarEmision(String lugarEmision) {
		this.lugarEmision = lugarEmision;
	}

	public String getNro() {
		return nro;
	}

	public void setNro(String nro) {
		this.nro = nro;
	}

	public boolean isAnulado() {
		return anulado;
	}

	public void setAnulado(boolean anulado) {
		this.anulado = anulado;
	}

}
