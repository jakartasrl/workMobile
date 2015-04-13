package com.jkt.erp.articulos;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.Data;

import com.jkt.dominio.Descriptible;
import com.jkt.varios.dominio.UnidadMedida;

/**
 * <p>Un producto esta estrictamente relacionado a un tipo de producto.</p>
 * <p>Un tipo de producto puede ser una camisa, y el producto puede ser camisa manga larga talle XL</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 *
 */
@Data
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
	 * Helper methods
	 */
	public void addEquivalencia(ProductoEquivUniMed eq){
		if (!equivalencias.contains(eq)) {
			equivalencias.add(eq);
			eq.setProducto(this);
		}
	}

	
	/*
	 * 
	 * FIXME 
	 * Que sucede si tengo un producto con 5 detalles, y al cambiar de tipo de producto se cambian, logicamente, el espectro de caracteristicas?
	 * Para esto, uso una bandera, con lo cual, elimino la lista de detalles que existia previamente, y genero una nueva...
	 */
	private boolean flag=false;
	public void agregarDetalle(ProductoDet detalle){
		if (!flag) {
			detalles.clear();
			flag=true;
		}
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
