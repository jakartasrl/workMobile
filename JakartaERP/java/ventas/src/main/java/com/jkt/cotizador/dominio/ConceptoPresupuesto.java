package com.jkt.cotizador.dominio;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.PrecioCosto;
import com.jkt.varios.dominio.ComponenteValor;
import com.jkt.varios.dominio.Moneda;
import com.jkt.varios.dominio.UnidadMedida;

public class ConceptoPresupuesto extends Descriptible {

//	instance vars
	private TituloModeloCotizador titulo;
	private boolean pideArticulo;
	private ComponenteValor componenteValor;
	
	@NotNull(message="El concepto debe tener una moneda por defecto.")
	private Moneda monedaPorDefecto;
	
	@NotNull(message="El concepto debe tener una unidad de medida por defecto.")
	private UnidadMedida unidadDeMedidaPorDefecto;
	
	private List<PrecioCosto> preciosDeCosto=new ArrayList<PrecioCosto>();
	
//	getters and setters
	public boolean isPideArticulo() {
		return pideArticulo;
	}
	public List<PrecioCosto> getPreciosDeCosto() {
		return preciosDeCosto;
	}
	public void setPreciosDeCosto(List<PrecioCosto> preciosDeCosto) {
		this.preciosDeCosto = preciosDeCosto;
	}
	public Moneda getMonedaPorDefecto() {
		return monedaPorDefecto;
	}
	public void setMonedaPorDefecto(Moneda monedaPorDefecto) {
		this.monedaPorDefecto = monedaPorDefecto;
	}
	public UnidadMedida getUnidadDeMedidaPorDefecto() {
		return unidadDeMedidaPorDefecto;
	}
	public void setUnidadDeMedidaPorDefecto(UnidadMedida unidadDeMedidaPorDefecto) {
		this.unidadDeMedidaPorDefecto = unidadDeMedidaPorDefecto;
	}
	public TituloModeloCotizador getTitulo() {
		return titulo;
	}
	public void setTitulo(TituloModeloCotizador titulo) {
		this.titulo = titulo;
	}
	public void setPideArticulo(boolean pideArticulo) {
		this.pideArticulo = pideArticulo;
	}
	public ComponenteValor getComponenteValor() {
		return componenteValor;
	}
	public void setComponenteValor(ComponenteValor componenteValor) {
		this.componenteValor = componenteValor;
	}
	
//	Helper methods for precioCosto list
	public void agregarPrecio(PrecioCosto precio){
		this.preciosDeCosto.add(precio);
	}
	
}
