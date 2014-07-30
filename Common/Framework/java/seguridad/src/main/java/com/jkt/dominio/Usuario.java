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
public class Usuario extends PersistentEntity implements IDescriptible{

	private String codigo;
	private String userName;
	private String nombres, apellido;
	private String mail;
	private String skin;
	
	private List<HistorialPassword> historialPassword = new ArrayList<HistorialPassword>();
	private Set<Empresa> empresasPermitidas = new HashSet<Empresa>();

	private String password;//Elemento transiente para setear datos desde la entrada de delphi¿?
	
	
	private boolean activo=true;

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
	
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public void addEmpresa(Empresa e) {
		this.empresasPermitidas.add(e);
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

	public Set<Empresa> getEmpresasPermitidas() {
		return empresasPermitidas;
	}

	public void setEmpresasPermitidas(Set<Empresa> empresasPermitidas) {
		this.empresasPermitidas = empresasPermitidas;
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
		return this.getApellido();
	}

	public String getCadena2() {
		return this.getNombres();
	}

	public int getEntero() {
		return (int) this.getId();
	}

	public int getEntero2() {
		// TODO Auto-generated method stub
		return 0;
	}

	public float getFloat() {
		// TODO Auto-generated method stub
		return 0;
	}

	public float getFloat2() {
		// TODO Auto-generated method stub
		return 0;
	}

}
