package com.jkt.varios.dominio;

import com.jkt.dominio.PersistentEntity;

/**
 * Indica a cuantos dias sera el pago y el porcentaje del total que representa.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class CondPagoDet extends PersistentEntity {

	private int dias;
	private double porcentaje;
	private CondPago condicionDePago;

	public CondPago getCondicionDePago() {
		return condicionDePago;
	}

	public void setCondicionDePago(CondPago condicionDePago) {
		this.condicionDePago = condicionDePago;
	}

	public int getDias() {
		return dias;
	}

	public void setDias(int dias) {
		this.dias = dias;
	}

	public double getPorcentaje() {
		return porcentaje;
	}

	public void setPorcentaje(double porcentaje) {
		this.porcentaje = porcentaje;
	}
	
	 public boolean equals(Object other) {
	        if (this == other) return true;
	        if ( !(other instanceof CondPagoDet) ) return false;

	        final CondPagoDet condPagoDet = (CondPagoDet) other;

	        if ( !(condPagoDet.getId()==getId())) return false;
//	        if ( !cat.getMother().equals( getMother() ) ) return false;

	        return true;
	    }

	    public int hashCode() {
	        int result;
//	        result = getMother().hashCode();
	        result = (int) (29 * getId());
//	        result = 29 * result + getLitterId();
	        return result;
	    }

}
