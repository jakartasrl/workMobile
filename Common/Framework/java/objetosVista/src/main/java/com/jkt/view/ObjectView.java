package com.jkt.view;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of={"id"})
public abstract class ObjectView implements Serializable {
	private long id=0L;
	private String nameOV;// Key para cando tenga mas de 2 input/envie 2 OV para una misma operacion
	private Boolean activo=Boolean.TRUE;
	
	/**
	 * Metodo para returnar una lista de FiltroOV.
	 * Al retornar una lista de filtros, esta coleccion es utilizada para enviar en el filtro generico.
	 * Por ejemplo, si se filtra por codigo descripciony campoX.
	 * Este metodo debera retornar una coleccion con filtrosov, dnd se indica e campo, la condicion, el valor y tipo de dato(necesario para hql o criteria)
	 * 
	 */
	public List obtenerFiltro() {
		return new ArrayList();
	}
	
	/**
	 * Este campo sirve para utilizar como código para el filtro en validadores y helps.
	 * Cuando la entidad no tiene el atributo codigo,se puede pisar este metodo y decirle cual es el atributo clave.
	 * En caso de la sucursal, por ejemplo, es el numero de sucursal.
	 * 
	 */
	public String getCampoClave(){
		return "id";
	};

}
