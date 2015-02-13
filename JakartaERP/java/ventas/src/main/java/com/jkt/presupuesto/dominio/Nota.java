package com.jkt.presupuesto.dominio;

import com.jkt.dominio.Descriptible;

public class Nota extends Descriptible {
	
	private boolean incluidaEnPresupuesto;

	public boolean isIncluidaEnPresupuesto() {
		return incluidaEnPresupuesto;
	}

	public void setIncluidaEnPresupuesto(boolean incluidaEnPresupuesto) {
		this.incluidaEnPresupuesto = incluidaEnPresupuesto;
	}

}
