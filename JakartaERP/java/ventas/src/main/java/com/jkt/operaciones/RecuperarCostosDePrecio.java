package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.PrecioCosto;
import com.jkt.excepcion.JakartaException;

/**
 * <p>Esta operacion retorna segun el tipo, que es un parametro recibido desde la vista, una lista de costos de precio.</p>
 * <p>El parametro recibido sirve para determinar si son determinaciones, productos o conceptos.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class RecuperarCostosDePrecio extends Operation {
	
	//Contantes para utilizar en HQL. Cada una representa un atributo del costo de precio.
	private static final String PRODUCTO_ATRIBUTO = "producto";
	private static final String CONCEPTO_PRESUPUESTO_ATRIBUTO = "conceptoPresupuesto";
	
	
	private static final String WRITER_COSTO = "costos";
	private static final int TIPO_LABORATORIO_ELECTRICO = 4;
	private static final int TIPO_LABORATORIO_QUIMICO = 3;
	private static final int TIPO_ARTICULO = 2;
	private static final int TIPO_CONCEPTO = 1;

	private static final String NOMBRE_PARAMETRO_LABORATORIO_QUIMICO = "LaboratorioQuimico";
	private static final String NOMBRE_PARAMETRO_LABORATORIO_ELECTRICO = "LaboratorioElectrico";
	private static final String TIPO_ELEMENTO = "tipoElemento".toUpperCase();

	private Configuracion configuracionLaboratorioElectrico;
	private Configuracion configuracionLaboratorioQuimico;
	
	private String tipo;
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		configuracionLaboratorioElectrico = obtenerConfiguracion(NOMBRE_PARAMETRO_LABORATORIO_ELECTRICO);
		configuracionLaboratorioQuimico = obtenerConfiguracion(NOMBRE_PARAMETRO_LABORATORIO_QUIMICO);
		
		if (configuracionLaboratorioElectrico==null || configuracionLaboratorioQuimico==null) {
			throw new JakartaException("Compruebe la parametrizacion de los laboratorios quimico y electrico.");
		}
		
		validarEntrada(aParams.get(TIPO_ELEMENTO));
		tipo=(String) aParams.get(TIPO_ELEMENTO);

		List<PrecioCosto> costos=recuperarCostos();
		List ids=new ArrayList();

		for (PrecioCosto precioCosto : costos) {
			notificarObjeto(WRITER_COSTO, precioCosto);//Siempre notifica el elemento
			ids.add(obtenerIdDeElemento(precioCosto));
			//Pense en no recorrer de nueva la coleccion dos veces, pero de todos modos se necesita hacer esto para notificar los objetos.
		}
		
		//Faltan los elementos que son nuevos y no estan en la lista de precios de costo

		//TODO
	}

	/**
	 * Segun el tipo de elemento, retorno el identificador de un producto, de una determinacion o de un concepto presupuestario.
	 * 
	 */
	private long obtenerIdDeElemento(PrecioCosto precioCosto) throws JakartaException {
		Integer tipoNumerico;
		try{
			tipoNumerico = Integer.valueOf(tipo);
		}catch(NumberFormatException e){
			throw new JakartaException("El tipo de elemento recibido debe ser numerico.");
		}
		
		switch (tipoNumerico) {
		case TIPO_ARTICULO:
			return precioCosto.getProducto().getId();
		case TIPO_LABORATORIO_QUIMICO:
			return precioCosto.getDeterminacion().getId();
		case TIPO_LABORATORIO_ELECTRICO:
			return precioCosto.getDeterminacion().getId();
		case TIPO_CONCEPTO:
			return precioCosto.getConceptoPresupuesto().getId(); 
		default:
			throw new JakartaException("El tipo de elemento recibido no se corresponde con los tipos disponibles.");
		}
	}

	private List<PrecioCosto> recuperarCostos() throws JakartaException {
		Integer tipoNumerico;
		Query query;
		try{
			tipoNumerico = Integer.valueOf(tipo);
		}catch(NumberFormatException e){
			throw new JakartaException("El tipo de elemento recibido debe ser numerico.");
		}
		
		switch (tipoNumerico) {
		case TIPO_ARTICULO:
			return obtenerElementos(PRODUCTO_ATRIBUTO);
		case TIPO_LABORATORIO_QUIMICO:
			return recuperarDeterminacion(configuracionLaboratorioQuimico);
		case TIPO_LABORATORIO_ELECTRICO:
			return recuperarDeterminacion(configuracionLaboratorioElectrico);
		case TIPO_CONCEPTO:
			return obtenerElementos(CONCEPTO_PRESUPUESTO_ATRIBUTO);
		default:
			throw new JakartaException("El tipo de elemento recibido no se corresponde con los tipos disponibles.");
		}
	}

	/**
	 * Consulta que sirve para filtrar elementos.
	 * Este metodo es ejecutado para filtrar elementos 'simples', los cuales son conceptoPresupuesto y producto.
	 * 
	 */
	private List<PrecioCosto> obtenerElementos(String elementoAFiltrar) {
		Query qIds = crearHQL("select distinct (costo."+elementoAFiltrar+".id) from PrecioCosto costo where costo."+elementoAFiltrar+" is not null");
		Query qElemento;
		List list = qIds.list();
		List<PrecioCosto> costos=new ArrayList<PrecioCosto>();
		long id;
		for (Object object : list) {
			id=(Long) object;
			qElemento=crearHQL("from PrecioCosto costo where costo."+elementoAFiltrar+".id=:id order by costo.fecha desc");
			qElemento.setMaxResults(1);
			qElemento.setParameter("id", id);
			PrecioCosto precioCosto = (PrecioCosto) qElemento.uniqueResult();
			costos.add(precioCosto);
		}
		return costos;
	}
	
	private List<PrecioCosto> recuperarDeterminacion(Configuracion configuracion) {
		
		Query qIds = crearHQL("select distinct (costo.determinacion.id) from PrecioCosto costo where costo.determinacion is not null and costo.determinacion.laboratorio.id =:idLab");
		qIds.setParameter("idLab", Long.valueOf(configuracion.getValorNumero()));
		List list = qIds.list();
		
		long id;
		Query qElemento;
		List<PrecioCosto> costos=new ArrayList<PrecioCosto>();
		for (Object object : list) {
			id=(Long) object;
			qElemento=crearHQL("from PrecioCosto costo where costo.determinacion.id=:id order by costo.fecha desc");
			qElemento.setMaxResults(1);
			qElemento.setParameter("id", id);
			PrecioCosto precioCosto = (PrecioCosto) qElemento.uniqueResult();
			costos.add(precioCosto);
		}
		return costos;
		
	}
	
	private Configuracion obtenerConfiguracion(String nombre) throws JakartaException {
		return (Configuracion) serviceRepository.getUniqueByProperty(Configuracion.class, "nombre", nombre);
	}

}
