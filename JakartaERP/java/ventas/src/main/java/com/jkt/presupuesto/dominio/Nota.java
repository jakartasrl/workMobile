package com.jkt.presupuesto.dominio;

import org.apache.commons.lang.StringUtils;

import com.jkt.dominio.Actividad;
import com.jkt.dominio.Descriptible;
import com.jkt.erp.varios.DomicilioEntrega;
import com.jkt.varios.dominio.CondPagoDet;

/**
 * Esta clase representa una nota que puede ser adjunta a un presupuesto, un pedido, en definitiva a un comprobante, o entidades que así lo precisen.
 * <p>Los datos básicos a persistir son un código y una descripción.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Nota extends Descriptible {
	
	private Actividad actividad;
	
	private String adicional=StringUtils.EMPTY;

	public String getDescripcion(){
		if (adicional!=null && !adicional.isEmpty()) {
			return super.getDescripcion().concat(" ").concat(adicional);
		}
		return super.getDescripcion();
	}
	
	public Actividad getActividad() {
		return actividad;
	}


	public void setActividad(Actividad actividad) {
		this.actividad = actividad;
	}


	public String getAdicional() {
		return adicional;
	}

	public void setAdicional(String adicional) {
		this.adicional = adicional;
	}


	/*
	 * La variable transiente 'incluida' hacer referencia a si ya esta incluida en una lista existente en la base de datos.
	 * 
	 * Este campo decide si la entidad Nota se persiste o no.
	 * 
	 * En caso de incluida ser 'true', la entidad se debe persistir en la base.
	 * 
	 * En cas de que incluida es 'false', la entidad nota no se persistira en la base de datos, y si ya estaba persistida, 
	 * se debe eliminar de la relación. (NO SE BORRA LA NOTA, SINO LA RELACION ENTRE ENTIDAD-NOTA)
	 */
	private boolean incluida=false; //no incluida por defecto al momento de la creacion de la instancia.

	public boolean isIncluida() {
		return incluida;
	}

	public void setIncluida(boolean incluida) {
		this.incluida = incluida;
	}

	
	/*
	 * Metodos para el manejo de la direccion.
	 */
	 public boolean equals(Object other) {
        if (this == other) return true;
        if ( !(other instanceof Nota) ) return false;

        final Nota nota = (Nota) other;
        	
        if (nota.getId()==0) return false;
			
        if ( !(nota.getId()==getId())) return false;

        if ( !(nota.getCodigo().equals(getCodigo()))) return false;
        if ( !(nota.getDescripcion().equals(getDescripcion()))) return false;

        return true;
    }

    public int hashCode() {
        int result;
        result = (int) (29 * getId());
        return result;
    }

}
