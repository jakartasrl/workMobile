package com.jkt.pedido.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.ComprobanteVenta;
import com.jkt.grafo.IAgendable;
import com.jkt.presupuesto.dominio.Nota;

/**
 * <p>Un pedido es una orden de compra que se basa en un presupuesto previamente
 * generado.</p>
 * <p>Este pedido tendrá detalles relacionados.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Pedido extends ComprobanteVenta {

	private boolean cargaACargoDeCliente, transporteACargoDeCliente, descargaACargoDeCliente;
	private List<Nota> notas = new ArrayList<Nota>();
	
	// private boolean cargaACargoDeEmpresa, transporteACargoDeEmpresa,
	// descargaACargoDeEmpresa;

	public boolean isPedido() {
		return true;
	}

	public boolean isCargaACargoDeCliente() {
		return cargaACargoDeCliente;
	}

	public void setCargaACargoDeCliente(boolean cargaACargoDeCliente) {
		this.cargaACargoDeCliente = cargaACargoDeCliente;
	}

	public boolean isTransporteACargoDeCliente() {
		return transporteACargoDeCliente;
	}

	public void setTransporteACargoDeCliente(boolean transporteACargoDeCliente) {
		this.transporteACargoDeCliente = transporteACargoDeCliente;
	}

	public boolean isDescargaACargoDeCliente() {
		return descargaACargoDeCliente;
	}

	public void setDescargaACargoDeCliente(boolean descargaACargoDeCliente) {
		this.descargaACargoDeCliente = descargaACargoDeCliente;
	}

	public List<Nota> getNotas() {
		return notas;
	}

	public void setNotas(List<Nota> notas) {
		this.notas = notas;
	}

	/*
	 * Helper methods
	 */
	public void agregarNota(Nota n){

		if (n.isIncluida()) {
			if (!notas.contains(n)) {
				//Ya no existe en la lista y debe ser incluida, se agrega
				notas.add(n);
			}else{
				//Ya existia,no se hace nada.
			}
		}else{
			if (notas.contains(n)) {
				//Si no esta incluida y estaba en la lista, se elimina.
				notas.remove(n);
			}else{
				//Ya no existia,no se hace nada.
			}
		}
		
	}
	
	
}
