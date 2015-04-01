package com.jkt.pedido.dominio;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.ComprobanteVentaDet;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.varios.dominio.Moneda;

/**
 * Representa a un item de un pedido.
 * <p>El item puede ser de una fabricaci�n de un nuevo producto, con lo cu�l sera tipo taller.</p>
 * <p>El item puede ser un service, es decir, se envia al cliente un grupo de trabajo.</p>
 * <p>El item puede ser una determinacion de un sector de laboratorio, laboratorio quimico o electrico.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class PedidoDet extends ComprobanteVentaDet {

	public static final char CHAR_ITEM = 'I';
	public static final char CHAR_MATERIAL = 'M';
	public static final char CHAR_ELECTRICO = 'E';
	public static final char CHAR_QUIMICO = 'Q';
	
	@NotNull(message="El item de pedido tiene que tener una moneda obligatoriamente.")
	private Moneda moneda;
	
	private char tipoDetalle;

	private Determinacion determinacion;
	private Pedido pedido;
	private List<String> plazosEntrega=new ArrayList<String>();
	private List<FormaFacturacion> formasFacturacion=new ArrayList<FormaFacturacion>();
	
	/*
	 * Getter y setters
	 */
	public char getTipoDetalle() {
		return tipoDetalle;
	}

	public Pedido getPedido() {
		return pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

	public List<String> getPlazosEntrega() {
		return plazosEntrega;
	}

	public void setPlazosEntrega(List<String> plazosEntrega) {
		this.plazosEntrega = plazosEntrega;
	}

	public List<FormaFacturacion> getFormasFacturacion() {
		return formasFacturacion;
	}

	public void setFormasFacturacion(List<FormaFacturacion> formasFacturacion) {
		this.formasFacturacion = formasFacturacion;
	}

	public void setTipoDetalle(char tipoDetalle) {
		this.tipoDetalle = tipoDetalle;
	}

	public Moneda getMoneda() {
		return moneda;
	}

	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}

	public Determinacion getDeterminacion() {
		return determinacion;
	}

	public void setDeterminacion(Determinacion determinacion) {
		this.determinacion = determinacion;
	}
	
	/*
	 * Helper methods
	 */
	public boolean isItem() {
		return CHAR_ITEM == this.tipoDetalle;
	}

	public boolean isMaterial() {
		return CHAR_MATERIAL == this.tipoDetalle;
	}

	public boolean isLaboratorioQuimico() {
		return CHAR_QUIMICO == this.tipoDetalle;
	}

	public boolean isLaboratorioElectrico() {
		return CHAR_ELECTRICO == this.tipoDetalle;
	}
	
	public void agregarPlazo(String plazo){
		if (!plazosEntrega.contains(plazo)) {
			plazosEntrega.add(plazo);
		}
	}
	
	public void agregarFormaFacturacion(FormaFacturacion f){
		if (!formasFacturacion.contains(f)) {
			formasFacturacion.add(f);
		}
	}
	
}
