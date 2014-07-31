package com.jkt.dominio;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Representa a un usuario que accede al sistema y consulta su password, la
 * cambia, y consulta las empresas que tiene habilitadas.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Usuario extends PersistentEntity implements IDescriptible {

	private String codigo;
	private String userName;
	private String nombres, apellido;
	private String mail;
	private String skin;

	/**
	 * Obtiene la ultima password!
	 */
	public HistorialPassword getUltimaPassword() {
		if (historialPassword.isEmpty()) {
			return null;
		}
		int cantidadPasswords = this.historialPassword.size();
		HistorialPassword password = this.historialPassword
				.get(cantidadPasswords - 1);// Inicia desde cero
		return password;
	}

	private List<HistorialPassword> historialPassword = new ArrayList<HistorialPassword>();
	private Set<EmpresaHabilitada> empresasHabilitadas = new HashSet<EmpresaHabilitada>();

	private String password;// Elemento transiente para setear datos desde la
							// entrada de delphi¿?
	private boolean activo = true;

	/**
	 * El parser hecho anteriormente no se encargaba de los atributos booleanos,
	 * asiq es un parche temporal, Luego se verá que se hace... FIXME TODO
	 * 
	 * @return
	 */
	public boolean getActivo() {
		return isActivo();
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public Set<EmpresaHabilitada> getEmpresasHabilitadas() {
		return empresasHabilitadas;
	}

	public void setEmpresasHabilitadas(
			Set<EmpresaHabilitada> empresasHabilitadas) {
		this.empresasHabilitadas = empresasHabilitadas;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void agregarEmpresaHabilitada(EmpresaHabilitada empresaHabilitada) {
		empresaHabilitada.setHabilitada(true);
		this.empresasHabilitadas.add(empresaHabilitada);
	}

	public void addPassword(HistorialPassword password) {
		this.historialPassword.add(password);
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void ingresarNuevaPassword(HistorialPassword h) {
		this.historialPassword.add(h);
	}

	public List<HistorialPassword> getHistorialPassword() {
		return historialPassword;
	}

	public void setHistorialPassword(List<HistorialPassword> historialPassword) {
		this.historialPassword = historialPassword;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getSkin() {
		return skin;
	}

	public void setSkin(String skin) {
		this.skin = skin;
	}

	public String getCadena() {
		return this.getNombres();
	}

	public String getCadena2() {
		return this.getApellido();
	}

	public int getEntero() {
		return (int) this.getId();
	}

	public int getEntero2() {
		return 0;
	}

	public float getFloat() {
		return 0;
	}

	public float getFloat2() {
		return 0;
	}
	
	/*
	 * Metodo utilitario para recibir datos de delphi.TRANSIENT FIELD.
	 */
	private List<EmpresaHabilitada> empresasHabilitadasPlanas=new ArrayList<EmpresaHabilitada>();
	public void agregarEmpresaHabilitadaPlana(EmpresaHabilitada empresaHabilitada){
		empresasHabilitadasPlanas.add(empresaHabilitada);
	}

	public List<EmpresaHabilitada> getEmpresasHabilitadasPlanas() {
		return empresasHabilitadasPlanas;
	}

	public void setEmpresasHabilitadasPlanas(
			List<EmpresaHabilitada> empresasHabilitadasPlanas) {
		this.empresasHabilitadasPlanas = empresasHabilitadasPlanas;
	}
	

}
