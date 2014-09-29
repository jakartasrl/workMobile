package com.jkt.erp.articulos;

import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.constantes.TiposDeDato;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.transformers.Notificacion;

public class ProductoDet extends PersistentEntity {

	/*
	 * Campo casi principal de la clase.
	 * La caracteristica define el tipo, que son los 5 o 6 atributos restantes.
	 */
	@NotNull(message="El detalle del producto debe tener asociada una caracteristica.")
	private CaracteristicaProducto caracProducto;
	
	private ValoresTablas valorTabla;
	private String valorString;
	private int valorEntero;
	private double valorDoble;
	private boolean valorBoolean;
	
	@NotNull
	private Producto producto;

	/*
	 * Campo transiente que sera utilizado como objetivo para setear el valor real.
	 * Sea lo que sea el tipo de la carateristica, se seteará en este campo, y posteriormente se copiará al verdadero atributo.
	 * 
	 */
	private String campoTransiente;

	public String getCampoTransiente() {
		return campoTransiente;
	}
	
	public void setCampoTransiente(String campoTransiente) throws JakartaException {
		this.campoTransiente = campoTransiente;
		
		if(getCaracProducto()==null){
			throw new JakartaException("No se encuentra la informacion de la caracteristica en este detalle de producto.(Identificador:"+this.getId()+")");
		}
		
		String tipoDato = getCaracProducto().getTipoDato();
		
		
		if (TiposDeDato.TABLA_VALORES_TYPE.equals(tipoDato)) {
			List<ValoresTablas> valores = getCaracProducto().getTabla().getValores();
			boolean existeElValor=false;
			for (ValoresTablas valorTabla : valores) {
				if (valorTabla.getCodigo().equals(campoTransiente)) {
					this.setValorTabla(valorTabla);
					existeElValor=true;
					break;
				}
			}
			if (!existeElValor) {
				throw new JakartaException(String.format("No existe el valor %s en la tabla de valores de la caracteristica %s(%s).", campoTransiente, getCaracProducto().getCodigo(), getCaracProducto().getDescripcion()));
			}
		}else if (TiposDeDato.STRING_TYPE.equals(tipoDato)) {
			if (campoTransiente.trim().isEmpty()) {
				throw new JakartaException("El valor no debe ser vacio.");
			}
			setValorString(campoTransiente);
		}else if (TiposDeDato.INTEGER_TYPE.equals(tipoDato)) {
			try{
				Integer.valueOf(campoTransiente);
			}catch(NumberFormatException e){
				throw new JakartaException("El valor debe ser un entero.");
			}
			setValorEntero(Integer.valueOf(campoTransiente));
		}else if (TiposDeDato.DOUBLE_TYPE.equals(tipoDato)) {
			try{
				Double.valueOf(campoTransiente);
			}catch(NumberFormatException e){
				throw new JakartaException("El valor debe ser de tipo 'double'.");
			}
			setValorDoble(Double.valueOf(campoTransiente));
		}else if (TiposDeDato.BOOLEAN_TYPE.equals(tipoDato)) {
			if (campoTransiente.toLowerCase().equals("true") || campoTransiente.toLowerCase().equals("false")) {
				
				if(campoTransiente.toLowerCase().equals("true")){
					setValorBoolean(true);
				}else{
					setValorBoolean(false);
				}
				
			}else{
				throw new JakartaException("El valor booleano debe ser 'true' o 'false'.");
			}
		}
		
		
	}
	
	/*
	 * Setters y getters
	 */
	public CaracteristicaProducto getCaracProducto() {
		return caracProducto;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public void setCaracProducto(CaracteristicaProducto caracProducto) {
		this.caracProducto = caracProducto;
	}

	public String getValorString() {
		return valorString;
	}

	public void setValorString(String valorString) {
		this.valorString = valorString;
	}

	public int getValorEntero() {
		return valorEntero;
	}

	public void setValorEntero(int valorEntero) {
		this.valorEntero = valorEntero;
	}

	public double getValorDoble() {
		return valorDoble;
	}

	public void setValorDoble(double valorDoble) {
		this.valorDoble = valorDoble;
	}

	public boolean isValorBoolean() {
		return valorBoolean;
	}

	public void setValorBoolean(boolean valorBoolean) {
		this.valorBoolean = valorBoolean;
	}

	public ValoresTablas getValorTabla() {
		return valorTabla;
	}

	public void setValorTabla(ValoresTablas valorTabla) {
		this.valorTabla = valorTabla;
	}
	
}
