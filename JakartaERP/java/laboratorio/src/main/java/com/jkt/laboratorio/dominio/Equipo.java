package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.IDescriptible;
import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.TipoProducto;
import com.jkt.erp.articulos.ValoresTablas;
import com.jkt.erp.varios.Cliente;

/**
 *	<p>Un equipo es el elemento sobre el cual se realizan los diagnosticos de laboratorio, por ejemplo, un transformador.</p>
 *	<p>Sobre este transformador (Equipo) se realizan los estudios, de por ejemplo aceites.</p>
 *
 */
public class Equipo  extends Descriptible {

	private String fluidoAislante;
	private String denominacionInterna;
	
	public String getFluidoAislante() {
		return fluidoAislante;
	}

	public void setFluidoAislante(String fluidoAislante) {
		this.fluidoAislante = fluidoAislante;
	}

	public String getDenominacionInterna() {
		return denominacionInterna;
	}

	public void setDenominacionInterna(String denominacionInterna) {
		this.denominacionInterna = denominacionInterna;
	}

	public Equipo() {
		this.setActivo(true);
	}
	
	/**
	 * Esta marca estar� en una tabla de valores. La tabla de valores ser� Marca,y los valores Czerweny, INDUSUL
	 * 
	 */
	@NotNull(message="El equipo necesita tener asignada una marca.")
	private ValoresTablas marca;
	
	@NotNull(message="El equipo debe tener un n�mero de serie.")
	private String nroSerie;
	
	@NotNull(message="El equipo tiene que tener asignado un cliente.")
	private Cliente cliente;
	
	/**
	 * Indica el tipo de producto que es el equipo. (Transformador de alta potencia, Transformador de media potencia...)
	 */
	@NotNull(message="El equipo tiene que tener un tipo de produco asignado.")
	private TipoProducto tipoDeProducto;

	private List<EquipoCaracteristica> caracteristicas=new ArrayList<EquipoCaracteristica>();

	/*
	 * Setters y getters
	 */
	public TipoProducto getTipoDeProducto() {
		return tipoDeProducto;
	}

	public void setTipoDeProducto(TipoProducto tipoDeProducto) {
		this.tipoDeProducto = tipoDeProducto;
	}

	public ValoresTablas getMarca() {
		return marca;
	}

	public void setMarca(ValoresTablas marca) {
		this.marca = marca;
	}

	public String getNroSerie() {
		return nroSerie;
	}

	public void setNroSerie(String nroSerie) {
		this.nroSerie = nroSerie;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public List<EquipoCaracteristica> getCaracteristicas() {
		return caracteristicas;
	}

	public void setCaracteristicas(List<EquipoCaracteristica> caracteristicas) {
		this.caracteristicas = caracteristicas;
	}
	
	/**
	 * Metodo de ayuda para agregar una caracteristica a la lista de caracteristicas y setear a esta caracteristicas el equipo actual.
	 */
	public void agregarCaracteristicas(EquipoCaracteristica caracteristica){
		if (!this.caracteristicas.contains(caracteristica)) {
			this.caracteristicas.add(caracteristica);
			caracteristica.setEquipo(this);
		}
	}
	
}
