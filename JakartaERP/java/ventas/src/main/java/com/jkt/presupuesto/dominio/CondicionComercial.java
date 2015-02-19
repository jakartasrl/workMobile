package com.jkt.presupuesto.dominio;

import com.jkt.dominio.Descriptible;

public class CondicionComercial extends Descriptible {

	private boolean incluida=false; //no incluida por defecto al momento de la creacion de la instancia.

	public boolean isIncluida() {
		return incluida;
	}

	public void setIncluida(boolean incluida) {
		this.incluida = incluida;
	}
	
	public boolean equals(Object other) {
        if (this == other) return true;
        if ( !(other instanceof CondicionComercial) ) return false;

        final CondicionComercial condComercial = (CondicionComercial) other;
        	
        if (condComercial.getId()==0) return false;
			
        if ( !(condComercial.getId()==getId())) return false;

        if ( !(condComercial.getCodigo().equals(getCodigo()))) return false;
        if ( !(condComercial.getDescripcion().equals(getDescripcion()))) return false;

        return true;
    }

    public int hashCode() {
        int result;
        result = (int) (29 * getId());
        return result;
    }

	
}
