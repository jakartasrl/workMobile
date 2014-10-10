package com.jkt.dominio;

/**
 * <p>Entidad persistente que hace referenca a una tabla de parametros general.</p>
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Configuracion extends PersistentEntity {

	private String formulario;//Para recuperar toda la configuracion por formulario.En lugar de obtener 10 veces un registro, se obtienen todas las configuraciones.
	private String nombre;
	private String valor;
	
	public String getFormulario() {
		return formulario;
	}
	
	public void setFormulario(String formulario) {
		this.formulario = formulario;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getValor() {
		return valor;
	}
	
	public void setValor(String valor) {
		this.valor = valor;
	}
	
}
