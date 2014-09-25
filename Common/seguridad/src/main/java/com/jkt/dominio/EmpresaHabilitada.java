package com.jkt.dominio;

/**
 * Esta clase es una relacion entre un usuario y todas las empresas, guardando
 * su relacion, es decir, para el usuario X la empresa Y esta habilitada. Para
 * el usuario X a empresa Z NO esta habilitada
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class EmpresaHabilitada extends PersistentEntity {

	private Usuario usuario;
	private Empresa empresa;
	
	private boolean habilitada = false;
	private boolean porDefecto = false; // Dentro de cada usuario, que tiene una
										// lista de empresas habilitadas, una y
										// solamente una debe ser la empresa por
										// defecto.

	private String oidEmpresa;
	private String oidUsuario;

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Empresa getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}

	public boolean isHabilitada() {
		return habilitada;
	}

	public void setHabilitada(boolean habilitada) {
		this.habilitada = habilitada;
	}

	public boolean isPorDefecto() {
		return porDefecto;
	}

	public void setPorDefecto(boolean porDefecto) {
		this.porDefecto = porDefecto;
	}

	public String getOidEmpresa() {
		return oidEmpresa;
	}

	public void setOidEmpresa(String oidEmpresa) {
		this.oidEmpresa = oidEmpresa;
	}

	public String getOidUsuario() {
		return oidUsuario;
	}

	public void setOidUsuario(String oidUsuario) {
		this.oidUsuario = oidUsuario;
	}
	
	
	/*
	 * Nuevamente...parche para que consulte campos booleanos...
	 * 
	 */

	public boolean getHabilitada(){
		return isHabilitada();
	}
	public boolean getPorDefecto(){
		return isPorDefecto();
	}

}

