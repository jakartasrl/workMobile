package com.jkt.dominio;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;

import org.hibernate.validator.constraints.NotBlank;

/**
 * Sirve para las entidades que contienen los campos codigo y descripcion.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
@EqualsAndHashCode(callSuper=true, of={"codigo"})
public class Descriptible extends PersistentEntity {

	@NotNull(message="El campo codigo no puede ser nulo.")
	@NotBlank(message="El campo codigo no puede estar vacio.")
	private String codigo;
	
	@NotBlank(message="La descripcion no debe estar vacia.")
	private String descripcion;

}
