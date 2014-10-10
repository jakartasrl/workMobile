package com.jkt.erp.articulos;

import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.constantes.TiposDeDato;
import com.jkt.dominio.IDetalle;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;

/**
 * Esta clase representa al detalle de un {@link Producto}
 * 
 * @see Producto
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ProductoDet extends PersistentEntity implements IDetalle{

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
	 * Sea lo que sea el tipo de la carateristica, se setear� en este campo, y posteriormente se copiar� al verdadero atributo.
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
//			List<ValoresTablas> valores = getCaracProducto().getTabla().getValoresDeTabla();
//			boolean existeElValor=false;
//			for (ValoresTablas valorTabla : valores) {
//				if (valorTabla.getCodigo().equals(campoTransiente)) {
//					this.setValorTabla(valorTabla);
//					existeElValor=true;
//					break;
//				}
//			}
//			if (!existeElValor) {
//				throw new JakartaException(String.format("No existe el valor %s en la tabla de valores de la caracteristica %s(%s).", campoTransiente, getCaracProducto().getCodigo(), getCaracProducto().getDescripcion()));
//			}
			
			//TODO Ver bien esto! Se esta guardando mal la referencia.
			
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

	
	/**
	 * Metodo de ayuda para ser llamado desde el cliente, sin enterarse que tipo de dato debe recuperar. 
	 * @return
	 * @throws JakartaException
	 */
	public String getValorDeDato() throws JakartaException{
		String tipoDato = this.getCaracProducto().getTipoDato();
		if (TiposDeDato.BOOLEAN_TYPE.equals(tipoDato)) {
			return String.valueOf(valorBoolean);
		}else if(TiposDeDato.DOUBLE_TYPE.equals(tipoDato)){
			return String.valueOf(valorDoble);
		}else if(TiposDeDato.INTEGER_TYPE.equals(tipoDato)){
			return String.valueOf(valorEntero);
		}else if(TiposDeDato.STRING_TYPE.equals(tipoDato)){
			return valorString;
		}else if(TiposDeDato.TABLA_VALORES_TYPE.equals(tipoDato)){
			return String.valueOf(valorTabla.getCodigo());
		}else{
			throw new JakartaException("El tipo de dato configurado en la caracteristica es inconsistente.");
		}
	}
	
	public String getDescripcionDeDato(){
		if (valorTabla!=null) {
			return valorTabla.getDescripcion();
		}else{
			return "";
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

	public String getNombreDeMaestro() {
		return "producto";
	}
	
	
	public boolean equals(Object other) {
		if (this == other)
			return true;
		if (!(other instanceof ProductoDet))
			return false;

		final ProductoDet det = (ProductoDet) other;

		if (det.getId() == 0)
			return false;

		if (!(det.getId() == getId()))
			return false;

		return true;
	}

	public int hashCode() {
		int result;
		result = (int) (29 * getId());
		return result;
	}	
	
}
