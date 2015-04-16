package com.jkt.presupuesto.dominio;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.jkt.dominio.ComprobanteVenta;
import com.jkt.dominio.ListaPrecios;
import com.jkt.pedido.dominio.FormaFacturacion;

/**
 * <p>Representa a un presupuesto. El presupuesto contendra una determinada
 * cantidad de items donde cada uno tiene su propios presupuestos, reflejados en
 * el precio, la unidad de medida, la cantidad... </p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class Presupuesto extends ComprobanteVenta {

	// Ver en los padres, vendedor, representante, cliente, clienteSucursal, condPago, comprobanteRelacionado

//	private List<CondicionComercial> condicionesComerciales = new ArrayList<CondicionComercial>();
	private List<FormaFacturacion> formasFacturacion = new ArrayList<FormaFacturacion>();
	private List<Nota> notas = new ArrayList<Nota>();
	private List<PresupuestoDet> detalles = new ArrayList<PresupuestoDet>();
	private ListaPrecios listaPrecios;

	/*
	 * Helper methods.
	 */
	/**
	 * Resuelve cuáles notas se actualizan, se insertan o se eliminan de la lista de notas del presupuesto
	 * 
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
	
	public void agregarFormaFacturacion(FormaFacturacion f){
		if (!formasFacturacion.contains(f)) {
			formasFacturacion.add(f);
		}
	}
	
//	public void agregarCondicionComercial(CondicionComercial n){
//		
//		if (n.isIncluida()) {
//			if (!condicionesComerciales.contains(n)) {
//				//Ya no existe en la lista y debe ser incluida, se agrega
//				condicionesComerciales.add(n);
//			}else{
//				//Ya existia,no se hace nada.
//			}
//		}else{
//			if (condicionesComerciales.contains(n)) {
//				//Si no esta incluida y estaba en la lista, se elimina.
//				condicionesComerciales.remove(n);
//			}else{
//				//Ya no existia,no se hace nada.
//			}
//		}
//		
//	}
	
	
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
		
		if (det.getPrecio()==0) {
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
	
	public boolean isPresupuesto(){
		return true;
	}
	
	
	/*
	 * Helper methods for show data into windows of generic help.
	 */
	public String getCodigo(){
		return this.getNro();
	}
	
	public String getDescripcion(){
		return String.format("%s / %s / %s",this.getVendedor().getApellido(), this.getRepresentante().getDescripcion(), this.getFecha().toString() );
//		return this.getReferencia();
	}
	
	
	/*
	 * Solamente sirve para mostrar datos en la pantalla.
	 * No se deberia tocar la variable notas, ya que al finalizar la operación se ejecuta un commit, 
	 * de este modo, si se modifica la lista de notas, se modifica en la base de mismo modo.
	 */
	private List<Nota> notasTransientes=new ArrayList<Nota>();

	public void agregarNotaTransiente(Nota n){
		if (!notasTransientes.contains(n)) {
			this.notasTransientes.add(n);
		}
	}
	
}
