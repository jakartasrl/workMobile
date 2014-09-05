package com.jkt.erp.varios;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.jkt.dominio.Descriptible;
import com.jkt.erp.impuestos.dominio.SujetoImpositivo;
import com.jkt.varios.dominio.ComponenteValor;
import com.jkt.varios.dominio.Idioma;

/**
 * <p>Representa los Clientes de la empresa</p>
 * <p>Se utilizará en el ingreso  pedidos, cotizaciones, facturas, etc</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Cliente extends Descriptible {

//	String codigo heredado de descriptible
//	String nombreComercial es la descripcion
	
	@NotNull
	private SujetoImpositivo sujetoImpositivo;
	
	/**
	 * Idioma en el que se mostraran los productos o servicios en la documentacion del cliente
	 */
	@NotNull
	private Idioma idioma;
	
	/**
	 * Lista de las condicines de pago vigentes que tuvo el cliente
	 */
	private List<CondPagoCliente> listaCondicionPago=new ArrayList<CondPagoCliente>();
	
	/**
	 * JKT Pendiente 
	 */
	private List<EsquemaPreciosCliente> listaEsquemaPrecios=new ArrayList<EsquemaPreciosCliente>();
	
	private List<ClienteSucursal> listaSucursales=new ArrayList<ClienteSucursal>();
	
	private List<ComponenteValor> listaClasificadores=new ArrayList<ComponenteValor>();
	
	@NotEmpty
	private List<ClienteCtaCte> listaCtaCte=new ArrayList<ClienteCtaCte>();

	public SujetoImpositivo getSujetoImpositivo() {
		return sujetoImpositivo;
	}

	public void setSujetoImpositivo(SujetoImpositivo sujetoImpositivo) {
		this.sujetoImpositivo = sujetoImpositivo;
	}

	public Idioma getIdioma() {
		return idioma;
	}

	public void setIdioma(Idioma idioma) {
		this.idioma = idioma;
	}

	public List<CondPagoCliente> getListaCondicionPago() {
		return listaCondicionPago;
	}

	public void setListaCondicionPago(List<CondPagoCliente> listaCondicionPago) {
		this.listaCondicionPago = listaCondicionPago;
	}

	public List<EsquemaPreciosCliente> getListaEsquemaPrecios() {
		return listaEsquemaPrecios;
	}

	public void setListaEsquemaPrecios(
			List<EsquemaPreciosCliente> listaEsquemaPrecios) {
		this.listaEsquemaPrecios = listaEsquemaPrecios;
	}

	public List<ClienteSucursal> getListaSucursales() {
		return listaSucursales;
	}

	public void setListaSucursales(List<ClienteSucursal> listaSucursales) {
		this.listaSucursales = listaSucursales;
	}

	public List<ComponenteValor> getListaClasificadores() {
		return listaClasificadores;
	}

	public void setListaClasificadores(List<ComponenteValor> listaClasificadores) {
		this.listaClasificadores = listaClasificadores;
	}

	public List<ClienteCtaCte> getListaCtaCte() {
		return listaCtaCte;
	}

	public void setListaCtaCte(List<ClienteCtaCte> listaCtaCte) {
		this.listaCtaCte = listaCtaCte;
	}
	
	
	
	
	
}
