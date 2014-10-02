package com.jkt.erp.articulos;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.Descriptible;
import com.jkt.varios.dominio.UnidadMedida;

/**
 * <p>Un producto esta estrictamente relacionado a un tipo de producto.</p>
 * <p>Un tipo de producto puede ser una camisa, y el producto puede ser camisa manga larga talle XL</p>
 * 
 * @author ssuarez
 *
 */
public class Producto extends Descriptible {

	/*
	 * **********************************************************************************************
	 * Variables de instancia
	 */
	
	private String descripcionAbrev;// descripcion abreviada
	private boolean comprable;
	private boolean vendible;
	private boolean stockeable;
	private boolean prodPropia;
	private boolean bien;

	@NotNull(message="Es necesario que el producto tenga una unidad de medida principal.")
	private UnidadMedida uniMedPrin;
	
	private UnidadMedida uniMedSec;
	private UnidadMedida uniMedTerc;
	
	
	private UnidadMedida unidadVenta;
	private UnidadMedida unidadProduccion;
	private UnidadMedida unidadCompra;
	
	private List<ProductoEquivUniMed> equivalencias=new ArrayList<ProductoEquivUniMed>();
	private List<ProductoClasificador> clasificadores = new ArrayList<ProductoClasificador>();
	private TipoProducto tipoProducto;
	private List<ArticuloStock> articulosStock=new ArrayList<ArticuloStock>();
	private List<ProductoDet> detalles=new ArrayList<ProductoDet>();
	
	
	
	/*
	 * Variables de instancia
	 * **********************************************************************************************
	 */
	
	public List<ArticuloStock> getArticulosStock() {
		return articulosStock;
	}

	public List<ProductoDet> getDetalles() {
		return detalles;
	}

	public void setDetalles(List<ProductoDet> detalles) {
		this.detalles = detalles;
	}

	public List<ProductoEquivUniMed> getEquivalencias() {
		return equivalencias;
	}

	public void setEquivalencias(List<ProductoEquivUniMed> equivalencias) {
		this.equivalencias = equivalencias;
	}

	public void setArticulosStock(List<ArticuloStock> articulosStock) {
		this.articulosStock = articulosStock;
	}

	public List<ProductoClasificador> getClasificadores() {
		return clasificadores;
	}

	public void setClasificadores(List<ProductoClasificador> clasificadores) {
		this.clasificadores = clasificadores;
	}

	public String getDescripcionAbrev() {
		return descripcionAbrev;
	}

	public void setDescripcionAbrev(String descripcionAbrev) {
		this.descripcionAbrev = descripcionAbrev;
	}

	public boolean isComprable() {
		return comprable;
	}

	public void setComprable(boolean comprable) {
		this.comprable = comprable;
	}

	/*
	 * TODO ver bien esto!!
	 */
	public void setServicio(boolean servicio) {
		this.bien = !servicio;
	}
	
	public boolean isVendible() {
		return vendible;
	}

	public void setVendible(boolean vendible) {
		this.vendible = vendible;
	}

	public boolean isStockeable() {
		return stockeable;
	}
	
	public boolean isServicio() {
		return !bien;
	}

	public void setStockeable(boolean stockeable) {
		this.stockeable = stockeable;
	}

	public boolean isProdPropia() {
		return prodPropia;
	}

	public void setProdPropia(boolean prodPropia) {
		this.prodPropia = prodPropia;
	}

	public boolean isBien() {
		return bien;
	}

	public void setBien(boolean bien) {
		this.bien = bien;
	}

	public TipoProducto getTipoProducto() {
		return tipoProducto;
	}

	public void setTipoProducto(TipoProducto tipoProducto) {
		this.tipoProducto = tipoProducto;
	}

	public UnidadMedida getUniMedPrin() {
		return uniMedPrin;
	}

	public void setUniMedPrin(UnidadMedida uniMedPrin) {
		this.uniMedPrin = uniMedPrin;
	}

	public UnidadMedida getUniMedSec() {
		return uniMedSec;
	}

	public void setUniMedSec(UnidadMedida uniMedSec) {
		this.uniMedSec = uniMedSec;
	}

	public UnidadMedida getUniMedTerc() {
		return uniMedTerc;
	}

	public void setUniMedTerc(UnidadMedida uniMedTerc) {
		this.uniMedTerc = uniMedTerc;
	}

	public UnidadMedida getUnidadVenta() {
		return unidadVenta;
	}

	public void setUnidadVenta(UnidadMedida unidadVenta) {
		this.unidadVenta = unidadVenta;
	}

	public UnidadMedida getUnidadProduccion() {
		return unidadProduccion;
	}

	public void setUnidadProduccion(UnidadMedida unidadProduccion) {
		this.unidadProduccion = unidadProduccion;
	}

	public UnidadMedida getUnidadCompra() {
		return unidadCompra;
	}

	public void setUnidadCompra(UnidadMedida unidadCompra) {
		this.unidadCompra = unidadCompra;
	}

	
	/*
	 * Helper methods
	 */
	public void addEquivalencia(ProductoEquivUniMed eq){
		if (!equivalencias.contains(eq)) {
			equivalencias.add(eq);
			eq.setProducto(this);
		}
	}

	
	/*
	 * Que sucede si tengo un producto con 5 detalles, y al cambiar de tipo de producto se cambian, logicamente, el espectro de caracteristicas?
	 * Para esto, uso una bandera, con lo cual, elimino la lista de detalles que existia previamente, y genero una nueva...
	 */
	private boolean flag=false;
	public void agregarDetalle(ProductoDet detalle){
//		if (!flag) {
//			detalles.clear();
//			flag=true;
//		}
		if(!detalles.contains(detalle)){
			detalles.add(detalle);
			detalle.setProducto(this);
		}
	}
	
	public void addValorClasificador(ProductoClasificador pClasificador){
		if (pClasificador!=null && pClasificador.getComponenteValor()!=null) {
			if(!clasificadores.contains(pClasificador)){
				clasificadores.add(pClasificador);
				pClasificador.setProducto(this);
			}
		}
	}
	
}
