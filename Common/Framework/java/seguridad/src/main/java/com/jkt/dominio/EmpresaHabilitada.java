package com.jkt.dominio;

/**
 * Esta clase es una relacion entre un usuario y todas las empresas, guardando
 * su relacion, es decir, para el usuario X la empresa Y esta habilitada. Para
 * el usuario X a empresa Z NO esta habilitada
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class EmpresaHabilitada extends PersistentEntity {

	private static final long serialVersionUID = -2782650488978062493L;

	private Empresa empresa;
	private boolean habilitada;

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

}
