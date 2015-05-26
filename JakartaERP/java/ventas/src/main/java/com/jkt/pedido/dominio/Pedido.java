package com.jkt.pedido.dominio;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.jkt.dominio.ComprobanteVenta;
import com.jkt.dominio.IDescriptible;
import com.jkt.dominio.ListaPrecios;
import com.jkt.presupuesto.dominio.Nota;
import com.jkt.presupuesto.dominio.Presupuesto;

/**
 * <p>Un pedido es una orden de compra que se basa en un presupuesto previamente generado.</p>
 * <p>Este pedido tendrá detalles relacionados.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class Pedido extends ComprobanteVenta implements IDescriptible{

	private ListaPrecios listaPrecios;
	private List<Nota> notas = new ArrayList<Nota>();
	private List<PedidoDet> detalles=new ArrayList<PedidoDet>();
	private List<PedidoDocumentacion> documentacion=new ArrayList<PedidoDocumentacion>();
	private List<FormaFacturacion> formasFacturacion = new ArrayList<FormaFacturacion>();

	public void agregarDocumentacion(PedidoDocumentacion documento){
		
		if (documento.getDocumentacion()==null) {
			log.warn("La relación de pedido-documentación debe estar asociado a un documento. No se generó dicha relación por que no se relaciono ningún documento.");
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
		agregarDetalle(det);
	}
	
	public void agregarDeterminacionElectrica(PedidoDet det){
		det.setTipoDetalle(PedidoDet.CHAR_ELECTRICO);
		agregarDetalle(det);
	}
	
	public void agregarDeterminacionQuimica(PedidoDet det){
		det.setTipoDetalle(PedidoDet.CHAR_QUIMICO);
		agregarDetalle(det);
	}
	
	public void agregarMaterial(PedidoDet det){
		det.setTipoDetalle(PedidoDet.CHAR_MATERIAL);
		agregarDetalle(det);
	}
	
	/*
	 * Metodos para que se puedan mostrar los pedidos como entidades descriptibles
	 */
	/*
	 * Helper methods for show data into windows of generic help.
	 */
	public String getCodigo(){
		return this.getNro();
	}
	
	public String getDescripcion(){
		return this.getCliente().getDescripcion();
//		return this.getReferencia();
//		return String.format("%s / %s",this.getClienteSucursal().getDescripcionCompleta(),this.getFecha().toString() );
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

	public String getAdicional1() {
		return this.getFecha().toString();
	}

	public String getAdicional2() {
		return "";
	}
	
	
	/*
	 * Relacionado con la agenda de tareas
	 */
	private List<TareaPedido> tareas=new ArrayList<TareaPedido>();
	private List<PlanificacionPedido> planificaciones=new ArrayList<PlanificacionPedido>();
}
	
