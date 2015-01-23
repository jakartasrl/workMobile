package com.jkt.operaciones;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.jkt.cotizador.dominio.ConceptoPresupuesto;
import com.jkt.dominio.PrecioCosto;
import com.jkt.erp.articulos.Producto;
import com.jkt.excepcion.JakartaException;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.varios.dominio.Moneda;

/**
 * <p>Guarda (o actualiza si la fecha es la misma) un costo de precio para un determinado elemento.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class GuardarPreciosDeCosto extends Operation {

	private static final int TIPO_LABORATORIO_ELECTRICO = 4;
	private static final int TIPO_LABORATORIO_QUIMICO = 3;
	private static final int TIPO_ARTICULO = 2;
	private static final int TIPO_CONCEPTO = 1;
	private static final String TIPO_ELEMENTO = "tipoElemento".toUpperCase();
	private int tipoElemento;
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(TIPO_ELEMENTO));
		
		String tipoElementoCadena=(String) aParams.get(TIPO_ELEMENTO);
		tipoElemento=Integer.valueOf(tipoElementoCadena);
		
		List costos = recuperarObjeto(aParams);
		
		PrecioCosto costo;
		
		for (Object costoActual : costos) {
			costo=(PrecioCosto) costoActual;
			if(!existeElemento(costo)){
				asignarElemento(costo);
				guardar(costo);
			}
		}
		
	}

	/**
	 * <p>Asigna un elemento al costo, es decir, un {@link Producto}, una {@link Determinacion} o un {@link ConceptoPresupuesto} segun el tipo que se recibe
	 * desde el cliente</p>
	 */
	private void asignarElemento(PrecioCosto costo) throws Exception {
		switch (tipoElemento) {
		case TIPO_ARTICULO:
			Producto producto = (Producto) obtener(Producto.class, costo.getOidElemento());
			costo.setProducto(producto);
			break;
		case TIPO_LABORATORIO_QUIMICO:
			Determinacion determinacionLaboElectrico = (Determinacion) obtener(Determinacion.class, costo.getOidElemento());
			costo.setDeterminacion(determinacionLaboElectrico);
			break;
		case TIPO_LABORATORIO_ELECTRICO:
			Determinacion determinacionLaboQuimico = (Determinacion) obtener(Determinacion.class, costo.getOidElemento());
			costo.setDeterminacion(determinacionLaboQuimico);
			break;
		case TIPO_CONCEPTO:
			ConceptoPresupuesto conceptoPresupuesto = (ConceptoPresupuesto) obtener(ConceptoPresupuesto.class, costo.getOidElemento());
			costo.setConceptoPresupuesto(conceptoPresupuesto);
			break;
		default:
			throw new JakartaException("No se puede resolver el tipo solicitado.");
		}
	}

	/**
	 * <p>Busca en la base si ya existe un costo para el mismo elemento pero ademas con la misma fecha, y en caso de existir, 
	 * se realiza una actualizacion, caso contrario, un nuevo registro es generado en la base.</p>
	 * <p>En resumen, si existe un costo para el mismo elemento con la misma fecha, se realiza una actualizacion, sino, se genera un nuevo costo.</p>
	 * 
	 */
	private boolean existeElemento(PrecioCosto costo) throws JakartaException {
		String hql=String.format("from PrecioCosto costo where costo.fecha=:fecha and costo.%s.id = :identificador",retornarAtributo());
		Query query = crearHQL(hql);
		
		query.setParameter("fecha", costo.getFecha());
		query.setParameter("identificador", Long.valueOf(costo.getOidElemento()));
		
		PrecioCosto costoRecuperado = (PrecioCosto) query.uniqueResult();
	
		if (costoRecuperado!=null) {
			//Si existía, actualizo solamente
			double precio = costo.getCosto();
			Moneda moneda = costo.getMoneda();
			
			costo=costoRecuperado;
			
			//Restauro los datos que el fmk asigno y el seteo previo modifico.
			costo.setCosto(precio);
			costo.setMoneda(moneda);
			return true;
		}
		return false;
		
	}
	
	/**
	 * Segun el tipo recibido desde la vista, se retorna una cadena para realizar un HQL 'generico'
	 * 
	 */
	private String retornarAtributo() throws JakartaException{
		switch (tipoElemento) {
		case TIPO_ARTICULO:
			return "producto";
		case TIPO_LABORATORIO_QUIMICO:
			return "determinacion";
		case TIPO_LABORATORIO_ELECTRICO:
			return "determinacion";
		case TIPO_CONCEPTO:
			return "conceptoPresupuesto";
		default:
			throw new JakartaException("No se puede resolver el tipo solicitado.");
		}
	}
	
}
