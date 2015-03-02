package com.jkt.pedido.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.ComprobanteVenta;
import com.jkt.presupuesto.dominio.Nota;
import com.jkt.presupuesto.dominio.Presupuesto;

/**
 * <p>Un pedido es una orden de compra que se basa en un presupuesto previamente generado.</p>
 * <p>Este pedido tendrá detalles relacionados.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Pedido extends ComprobanteVenta {

	private boolean cargaACargoDeCliente, transporteACargoDeCliente, descargaACargoDeCliente;
	private List<Nota> notas = new ArrayList<Nota>();
	private List<PedidoDet> detalles=new ArrayList<PedidoDet>();
	private List<PedidoDocumentacion> documentacion=new ArrayList<PedidoDocumentacion>();
	
	public void agregarDocumentacion(PedidoDocumentacion documento){
		
		if (documento.getDocumentacion()==null) {
			log.warn("La relación de pedido-documentación debe estar asociado a un documento. No se generá dicha relación por que no se relaciono ningún documento.");
			return;
		}
		
		if (!documentacion.contains(documento)) {
			documentacion.add(documento);
			documento.setPedido(this);
		}
		
		/*
		 * Si ya existia en la lista, de todos modos es modificado el pedido(Se modifica el elemento de la coleccion perteneciente al pedido).
		 */
		
	}
	
	public boolean isPedido() {
		return true;
	}

	public List<PedidoDocumentacion> getDocumentacion() {
		return documentacion;
	}

	public void setDocumentacion(List<PedidoDocumentacion> documentacion) {
		this.documentacion = documentacion;
	}

	public List<PedidoDet> getDetalles() {
		return detalles;
	}

	public void setDetalles(List<PedidoDet> detalles) {
		this.detalles = detalles;
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
	
	public void setComprobanteRelacionado(Presupuesto comprobanteRelacionado) {
		this.comprobanteRelacionado = comprobanteRelacionado;
	}
	
	/**
	 * <p>Agrega un detalle al presupuesto.</p>
	 * <p>Si el detalle tiene cantidad 0, no se persistira.</p>
	 * 
	 */
	public void agregarDetalle(PedidoDet det){
		
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
			log.info(String.format("Se agrega un nuevo item de pedido al pedido."));
			detalles.add(det);
			det.setPedido(this);
		}
	}
	
	public void agregarItem(PedidoDet det){
		det.setTipoDetalle(PedidoDet.CHAR_ITEM);
		this.agregarDetalle(det);
	}
	
	public void agregarDeterminacionElectrica(PedidoDet det){
		det.setTipoDetalle(PedidoDet.CHAR_ELECTRICO);
		this.agregarDetalle(det);
	}
	
	public void agregarDeterminacionQuimica(PedidoDet det){
		det.setTipoDetalle(PedidoDet.CHAR_QUIMICO);
		this.agregarDetalle(det);
	}
	
	public void agregarMaterial(PedidoDet det){
		det.setTipoDetalle(PedidoDet.CHAR_MATERIAL);
		this.agregarDetalle(det);
	}
	
}
