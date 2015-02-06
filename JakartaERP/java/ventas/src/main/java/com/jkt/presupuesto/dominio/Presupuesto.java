package com.jkt.presupuesto.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.Comprobante;
import com.jkt.dominio.ComprobanteVenta;
import com.jkt.dominio.Cotizacion;
import com.jkt.dominio.ListaPrecios;

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
	private ListaPrecios listaPrecios;
	
	public void setComprobanteRelacionado(Cotizacion comprobanteRelacionado) {
		this.comprobanteRelacionado = comprobanteRelacionado;
	}
	
	public ListaPrecios getListaPrecios() {
		return listaPrecios;
	}

	public void setListaPrecios(ListaPrecios listaPrecios) {
		this.listaPrecios = listaPrecios;
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
	
	
	/**
	 * <p>Agrega un detalle al presupuesto.</p>
	 * <p>Si el detalle tiene cantidad 0, no se persistira.</p>
	 * 
	 */
	public void agregarDetalle(PresupuestoDet det){
		
		if (det.getCantidad()<1) {
			//No guardar el detalle
			log.warn(String.format("No se agrego el detalle %s ya que no se le asigno una cantida mayor a cero.", det.getDescripcion()));
			return;
		}
		
		if (!detalles.contains(det)) {
			detalles.add(det);
			det.setPresupuesto(this);
		}
	}
	
	public void agregarItem(PresupuestoDet det){
		det.setTipoDetalle(PresupuestoDet.CHAR_ITEM);
		this.agregarDetalle(det);
	}
	
	public void agregarDeterminacionElectrica(PresupuestoDet det){
		det.setTipoDetalle(PresupuestoDet.CHAR_ELECTRICO);
		this.agregarDetalle(det);
	}
	
	public void agregarDeterminacionQuimica(PresupuestoDet det){
		det.setTipoDetalle(PresupuestoDet.CHAR_QUIMICO);
		this.agregarDetalle(det);
	}
	
	public void agregarMaterial(PresupuestoDet det){
		det.setTipoDetalle(PresupuestoDet.CHAR_MATERIAL);
		this.agregarDetalle(det);
	}
	
}
