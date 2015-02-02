package com.jkt.presupuesto.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.ComprobanteVenta;
import com.jkt.varios.dominio.Moneda;

/**
 * <p>Representa a un presupuesto. El presupuesto contendra una determinada
 * cantidad de items donde cada uno tiene su propios presupuestos, reflejados en
 * el precio, la unidad de medida, la cantidad... </p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Presupuesto extends ComprobanteVenta {

	// Ver en los padres, vendedor, representante, cliente, clienteSucursal, condPago, comprobanteRelacionado

	private List<CondicionComercial> condicionesComerciales = new ArrayList<CondicionComercial>();
	private List<Nota> notas = new ArrayList<Nota>();
	private List<PresupuestoDet> detalles = new ArrayList<PresupuestoDet>();
	private Moneda moneda;//De la lista de precio, o en su defecto, parametrizada como moneda por defecto del sistema.
	private String nombreListaPrecio; //Como referencia solamente
	
	public Moneda getMoneda() {
		return moneda;
	}

	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}

	public String getNombreListaPrecio() {
		return nombreListaPrecio;
	}

	public void setNombreListaPrecio(String nombreListaPrecio) {
		this.nombreListaPrecio = nombreListaPrecio;
	}

	public List<CondicionComercial> getCondicionesComerciales() {
		return condicionesComerciales;
	}

	public void setCondicionesComerciales(
			List<CondicionComercial> condicionesComerciales) {
		this.condicionesComerciales = condicionesComerciales;
	}

	public List<Nota> getNotas() {
		return notas;
	}

	public void setNotas(List<Nota> notas) {
		this.notas = notas;
	}

	public List<PresupuestoDet> getDetalles() {
		return detalles;
	}

	public void setDetalles(List<PresupuestoDet> detalles) {
		this.detalles = detalles;
	}

	/*
	 * Helper methods.
	 */
	public void agregarNota(Nota n){
		if (!notas.contains(n)) {
			notas.add(n);
		}
	}
	public void agregarCondicionComercial(CondicionComercial condicion){
		if (!condicionesComerciales.contains(condicion)) {
			condicionesComerciales.add(condicion);
		}
	}
	public void agregarDetalle(PresupuestoDet det){
		if (!detalles.contains(det)) {
			detalles.add(det);
			det.setPresupuesto(this);
		}
	}
	
}
