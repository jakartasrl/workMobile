package com.jkt.cotizador.dominio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import scala.xml.PrettyPrinter.Item;

import com.jkt.dominio.ComprobanteVentaDet;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.varios.dominio.Moneda;

/**
 * <p>Entidad que se encarga de cotizar un item de una solititud de cotizacion.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Cotizador extends PersistentEntity {

	private Date fecha;
	private boolean revisado;
	
	@NotNull(message="La cotización se debe realizar en base a un item existente.")
	private ComprobanteVentaDet item;
	
	private String usuarioCreacion;
	
	private Moneda monedaExpresada;
	private String usuarioRevision;
	private Date fechaRevision;
	private ModeloCotizador modelo;
//	private boolean autorizado;
	private String codigoEstado;
	private List<CotizadorDet> detalles=new ArrayList<CotizadorDet>();
	
	public String getCodigoEstado(){
		return this.codigoEstado;
	}
	
	/**
	 * Como precondicion, debe estar cargado el {@link Item}
	 * Tener cuidado, ya que el framework debera setearlo en orden, es decir, que se puede dar la siguiente situacion.
	 * 
	 * 1-setear item
	 * 2-setear estado
	 * 
	 * 1-setear estado
	 * 2-setear item
	 * 
	 * Entonces se cambia el estado de un item incorrecto.
	 * 
	 * @throws JakartaException Cuando el estado no existe.
	 */
	public void setCodigoEstado(String codigoEstado) throws JakartaException {
		Integer idEstado = Integer.valueOf(codigoEstado);
		ComprobanteVentaDet.Estado.getEstado(idEstado);
		if (this.item!=null) {
			this.item.setEstadoId(idEstado);
		}
	}

	
	public ComprobanteVentaDet getItem() {
		return item;
	}

	public void setItem(ComprobanteVentaDet item) {
		this.item = item;
		item.setCotizador(this);
	}

//	public boolean isAutorizado() {
//		return autorizado;
//	}
//
//	public void setAutorizado(boolean autorizado) {
//		this.autorizado = autorizado;
//	}
	

	public Cotizador() {
		this.fecha=new Date();
		this.revisado=false;
//		this.autorizado=false;
		this.usuarioCreacion="Anonimo";
	}
	
	public void agregarDetalle(CotizadorDet detalle){

		/*
		 * Si es titulo no se guarda
		 */
		if (detalle.getConceptoPresupuesto()==null) {
			return;
		}

		/*
		 * Si el detalle no tiene cantidad, no se guarda
		 */
		if (detalle.getCantidad()==0) {
			return;
		}
		
		if (!detalles.contains(detalle)) {

//			if(detalle.getCantidad()==0 || detalle.getPrecioUnitario()==0){
				//No se guarda nada ya que no se consideran cantidades vacias o cantidades con precio 0.
//				return;
//			}
			
			//Es un detalle que tiene un concepto, en caso contrario es un titulo y no se deberá guardar.
			if (detalle.getConceptoPresupuesto()!=null) {
				detalles.add(detalle);
				detalle.setCotizador(this);
			}
			
		}
		
		
	}
	
	public Moneda getMonedaExpresada() {
		return monedaExpresada;
	}

	public void setMonedaExpresada(Moneda monedaExpresada) {
		this.monedaExpresada = monedaExpresada;
	}

	public List<CotizadorDet> getDetalles() {
		return detalles;
	}
	public void setDetalles(List<CotizadorDet> detalles) {
		this.detalles = detalles;
	}
	public ModeloCotizador getModelo() {
		return modelo;
	}
	public void setModelo(ModeloCotizador modelo) {
		this.modelo = modelo;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public boolean isRevisado() {
		return revisado;
	}
	public void setRevisado(boolean revisado) {
		this.revisado = revisado;
	}
	public String getUsuarioCreacion() {
		return usuarioCreacion;
	}
	public void setUsuarioCreacion(String usuarioCreacion) {
		this.usuarioCreacion = usuarioCreacion;
	}
	public String getUsuarioRevision() {
		return usuarioRevision;
	}
	public void setUsuarioRevision(String usuarioRevision) {
		this.usuarioRevision = usuarioRevision;
	}
	public Date getFechaRevision() {
		return fechaRevision;
	}
	public void setFechaRevision(Date fechaRevision) {
		this.fechaRevision = fechaRevision;
	}
	
}
