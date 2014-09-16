package com.jkt.erp.varios;

import java.util.ArrayList;
import java.util.List;

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

	/*
	 * ***********************************************************************************************
	 * Variables de instancia
	 */
	
//	String codigo heredado de descriptible
//	String nombreComercial es la descripcion
	
//	@NotNull(message="El Sujeto impositivo no debe ser nulo.")
	private SujetoImpositivo sujetoImpositivo;
	
//	@NotNull(message="El idioma no debe ser nulo.")
	private Idioma idioma;//Idioma en el que se mostraran los productos o servicios en la documentacion del cliente
	
	private List<CondPagoCliente> listaCondicionPago=new ArrayList<CondPagoCliente>();//Lista de las condicines de pago vigentes que tuvo el cliente
	
	private List<EsquemaPreciosCliente> listaEsquemaPrecios=new ArrayList<EsquemaPreciosCliente>();
	
	private List<ClienteSucursal> listaSucursales=new ArrayList<ClienteSucursal>();
	
	private List<ClienteClasificador> listaClasificadores=new ArrayList<ClienteClasificador>();
	
	/*
	 * Variables de instancia
	 * ***********************************************************************************************
	 */
	
	
	
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

	public List<ClienteClasificador> getListaClasificadores() {
		return listaClasificadores;
	}

	public void setListaClasificadores(List<ClienteClasificador> listaClasificadores) {
		this.listaClasificadores = listaClasificadores;
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
	
	public void addCondPago(CondPagoCliente cpCliente){
		if(!listaCondicionPago.contains(cpCliente)){
			listaCondicionPago.add(cpCliente);
			cpCliente.setCliente(this);
		}
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
