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

	/*
	 * ***********************************************************************************************
	 * Variables de instancia
	 */
	
	
//	String codigo heredado de descriptible
//	String nombreComercial es la descripcion
	
	@NotNull(message="El Sujeto impositivo no debe ser nulo.")
	private SujetoImpositivo sujetoImpositivo;
	
	@NotNull(message="El idioma no debe ser nulo.")
	private Idioma idioma;//Idioma en el que se mostraran los productos o servicios en la documentacion del cliente
	
	private List<CondPagoCliente> listaCondicionPago=new ArrayList<CondPagoCliente>();//Lista de las condicines de pago vigentes que tuvo el cliente
	
	/**
	 * JKT Pendiente 
	 */
	private List<EsquemaPreciosCliente> listaEsquemaPrecios=new ArrayList<EsquemaPreciosCliente>();
	
	private List<ClienteSucursal> listaSucursales=new ArrayList<ClienteSucursal>();
	
	private List<ComponenteValor> listaClasificadores=new ArrayList<ComponenteValor>();
	
	@NotEmpty(message="El cliente debe tener como minimo una cuenta corriente.")
	private List<ClienteCtaCte> listaCtaCte=new ArrayList<ClienteCtaCte>();

	
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
	
	/*
	 * helper methods
	 */

	public void addClienteSucursal(ClienteSucursal clienteSucursal){
		agregarObjectoAColeccion(listaSucursales, clienteSucursal);
	}
	
	public void addEsquemaPrecios(EsquemaPreciosCliente precioCliente){
		agregarObjectoAColeccion(listaEsquemaPrecios, precioCliente);
	}
	
	public void addCondPago(CondPagoCliente cpCliente){
		agregarObjectoAColeccion(listaCondicionPago, cpCliente);
	}
	
	public void addCtaCte(ClienteCtaCte cuenta){
		agregarObjectoAColeccion(listaCtaCte, cuenta);
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
