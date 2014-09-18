package com.jkt.erp.varios;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.Descriptible;
import com.jkt.varios.dominio.ComponenteValor;
import com.jkt.varios.dominio.CondPago;
import com.jkt.varios.dominio.Idioma;

/**
 * <p>Representa los Clientes de la empresa</p>
 * <p>Se utilizará en el ingreso  pedidos, cotizaciones, facturas, etc</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Cliente extends Descriptible {

	/*
	 * ***********************************************************************************************
	 * Variables de instancia
	 */
	
//	String codigo heredado de descriptible
//	String nombreComercial es la descripcion
	
//	@NotNull(message="El Sujeto impositivo no debe ser nulo.")
	private SujetoImpositivo sujetoImpositivo;
	
	private String telefono;
	
//	@NotNull(message="El idioma no debe ser nulo.")
	private Idioma idioma;//Idioma en el que se mostraran los productos o servicios en la documentacion del cliente
	
	private List<EsquemaPreciosCliente> listaEsquemaPrecios=new ArrayList<EsquemaPreciosCliente>();
	
	private List<ClienteSucursal> listaSucursales=new ArrayList<ClienteSucursal>();
	
	private List<ClienteClasificador> listaClasificadores=new ArrayList<ClienteClasificador>();
	
	@NotNull(message="El cliente debe tener una condicion de pago.")
	private CondPago condPago;
	
	/*
	 * Variables de instancia
	 * ***********************************************************************************************
	 */
	
	public SujetoImpositivo getSujetoImpositivo() {
		return sujetoImpositivo;
	}

	public List<ClienteClasificador> getListaClasificadores() {
		return listaClasificadores;
	}

	public void setListaClasificadores(List<ClienteClasificador> listaClasificadores) {
		this.listaClasificadores = listaClasificadores;
	}

	public CondPago getCondPago() {
		return condPago;
	}

	public void setCondPago(CondPago condPago) {
		this.condPago = condPago;
	}

	public void setSujetoImpositivo(SujetoImpositivo sujetoImpositivo) {
		this.sujetoImpositivo = sujetoImpositivo;
		this.sujetoImpositivo.setCliente(this);
	}

	public Idioma getIdioma() {
		return idioma;
	}

	public void setIdioma(Idioma idioma) {
		this.idioma = idioma;
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

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	/*
	 * helper methods
	 */
	public void addClienteSucursal(ClienteSucursal clienteSucursal){
		if(!listaSucursales.contains(clienteSucursal)){
			listaSucursales.add(clienteSucursal);
			clienteSucursal.setCliente(this);
		}
	}
	
	public void addEsquemaPrecios(EsquemaPreciosCliente precioCliente){
		agregarObjectoAColeccion(listaEsquemaPrecios, precioCliente);
	}
	
	public void addValorClasificador(ComponenteValor componenteValor){
		agregarObjectoAColeccion(listaClasificadores, componenteValor);
	}
	
	public void deleteValorClasificador(ComponenteValor componenteValor){
		borrarObjetoDeColeccion(listaClasificadores, componenteValor);
	}

	/*
	 * helper methods
	 */
	
}
