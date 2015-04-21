package com.jkt.cotizador.dominio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.Data;
import scala.xml.PrettyPrinter.Item;

import com.jkt.dominio.ComprobanteVentaDet;
import com.jkt.dominio.CotizacionDet;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.varios.dominio.Moneda;

/**
 * <p>Entidad que se encarga de cotizar un item de una solititud de cotizacion.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class Cotizador extends PersistentEntity {

	private Date fecha;
	private boolean revisado;
	
	@NotNull(message="La cotizaci�n se debe realizar en base a un item existente.")
	private CotizacionDet item;
	
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
		this.codigoEstado=codigoEstado;
		
		
//		Integer idEstado = Integer.valueOf(codigoEstado);
//		CotizacionDet.Estado.getEstado(idEstado);
//		if (this.item!=null) {
//			this.item.setEstadoId(idEstado);
//		}
	}

	
	public CotizacionDet getItem() {
		return item;
	}

	public void setItem(CotizacionDet item) throws JakartaException {
		this.item = item;
		item.setCotizador(this);
		
//		if (!codigoEstado.isEmpty()) {
//			Integer idEstado = Integer.valueOf(codigoEstado);
//			CotizacionDet.Estado.getEstado(idEstado);
//			if (this.item!=null) {
//				this.item.setEstadoId(idEstado);
//			}
//		}
	}

	public Cotizador() {
		this.fecha=new Date();
		this.revisado=false;
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
			
			//Es un detalle que tiene un concepto, en caso contrario es un titulo y no se deber� guardar.
			if (detalle.getConceptoPresupuesto()!=null) {
				detalles.add(detalle);
				detalle.setCotizador(this);
			}
			
		}
		
	}

}
