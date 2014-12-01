package com.jkt.dominio;

import com.jkt.excepcion.JakartaException;


/**
 * Representa al tipo de un comprobante. Cada instancia de esta clase, son los
 * posibles tipos.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TipoComprobante extends PersistentEntity {

	/*
	 * Variables de instancia
	 */
	private String descripcion;
	private int comportamiento;
	
	/*
	 * Getters y setters
	 */
	public int getComportamiento() {
		return comportamiento;
	}

	public void setComportamiento(int comportamiento) {
		this.comportamiento = comportamiento;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	/*
	 * Comportamiento ENUM
	 */
	public enum Comportamiento { 
		
		NOTA_DEBITO(1) {
			@Override
			public String descripcion() {
				return "Nota de debito";
			}

			@Override
			public String argumento() {
				return "ND-";
			}
		}, 
		
		
		NOTA_CREDITO(2) {
			@Override
			public String descripcion() {
				return "Nota de credito";
			}

			@Override
			public String argumento() {
				return "NC-";
			}
		},
		
		ORDEN_FABRICACION(3) {
			@Override
			public String descripcion() {
				return "Orden de fabricación";
			}

			@Override
			public String argumento() {
				return "OR-";
			}
		},
		
		PEDIDO(4) {
			@Override
			public String descripcion() {
				return "Pedido";
			}

			@Override
			public String argumento() {
				return "PD-";
			}
		};
		
		private int value;
		public abstract String descripcion();
		public abstract String argumento();

		private Comportamiento (int value){
			this.value=value;
		}
		
		public int getValue(){
			return this.value;
		}
		
		/**
		 * Obtiene un elemento de la enumeracion recibiendo un entero.
		 * 
		 */
		public static Comportamiento getComportamiento(int value) throws JakartaException{
			Comportamiento[] values = values();
			Comportamiento c = null;
			for (Comportamiento comportamiento : values) {
				if(comportamiento.getValue()==value){
					c=comportamiento;
					break; 
				}
			}
			if (c==null) {
				throw new JakartaException("No existe un comportamiento para la solicitud recibida.");
			}
			return c;
		}
        
	};

}
