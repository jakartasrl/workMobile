package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;

import com.jkt.cotizador.dominio.ConceptoPresupuesto;
import com.jkt.dominio.Configuracion;
import com.jkt.dominio.Descriptible;
import com.jkt.dominio.PrecioCosto;
import com.jkt.erp.articulos.Producto;
import com.jkt.erp.articulos.ProductoClasificador;
import com.jkt.excepcion.JakartaException;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.varios.dominio.Moneda;

/**
 * <p>Esta operacion retorna segun el tipo, que es un parametro recibido desde la vista, una lista de costos de precio.</p>
 * <p>El parametro recibido sirve para determinar si son determinaciones, productos o conceptos.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class RecuperarPreciosDeCosto extends Operation {
	
	private static final String SEPARADOR_CLASES_HQL = ",";
	private static final String FILTRO_CLASIFICADOR = "clasificador".toUpperCase();
	private static final String CODIGO_HASTA = "cod_art_has".toUpperCase();
	private static final String CODIGO_DESDE = "cod_art_des".toUpperCase();
	
	private static final String CLASE_CONCEPTO_PRESUPUESTO = "ConceptoPresupuesto";
	private static final String CLASE_PRODUCTO = "Producto";
	private static final String CLASE_DETERMINACION = "Determinacion";
	private static final String PARAMETRO_MONEDA_POR_DEFECTO = "monedaPorDefecto";

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
	private String filtroCodigoDesde, filtroCodigoHasta, filtroClasificador;
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		obtenerConfiguraciones();
		
		validarEntrada(aParams.get(TIPO_ELEMENTO));
		tipo=(String) aParams.get(TIPO_ELEMENTO);

		filtroCodigoDesde=(String) aParams.get(CODIGO_DESDE);
		filtroCodigoHasta=(String) aParams.get(CODIGO_HASTA);
		filtroClasificador=(String) aParams.get(FILTRO_CLASIFICADOR);

		List<PrecioCosto> costos=recuperarCostos();
		List ids=new ArrayList();

		for (PrecioCosto precioCosto : costos) {
			notificarObjeto(WRITER_COSTO, precioCosto);//Siempre notifica el elemento
			ids.add(obtenerIdDeElemento(precioCosto));
			//Pense en no recorrer de nueva la coleccion dos veces, pero de todos modos se necesita hacer esto para notificar los objetos.
		}
		
		mostrarElementosNuevos(ids);
		
	}

	/**
	 * Muestra todos los elementos que no tienen asignados pecios de costo.
	 * @throws Exception 
	 * 
	 */
	private void mostrarElementosNuevos(List ids) throws Exception {
		
		Integer tipoNumerico;
		try{
			tipoNumerico = Integer.valueOf(tipo);
		}catch(NumberFormatException e){
			throw new JakartaException("El tipo de elemento recibido debe ser numerico.");
		}
		
		List elementosNuevos;
		switch (tipoNumerico) {
		case TIPO_ARTICULO:
			elementosNuevos=obtenerProductosNuevos(ids);
			break;
		case TIPO_LABORATORIO_QUIMICO:
			elementosNuevos=obtenerDeterminacionesNuevas(ids, configuracionLaboratorioQuimico.getValorNumero());
			break;
		case TIPO_LABORATORIO_ELECTRICO:
			elementosNuevos=obtenerDeterminacionesNuevas(ids, configuracionLaboratorioElectrico.getValorNumero());
			break;
		case TIPO_CONCEPTO:
			elementosNuevos=obtenerConceptosNuevos(ids);
			break;
		default:
			throw new JakartaException("El tipo de elemento recibido no se corresponde con los tipos disponibles.");
		}
		
		Descriptible elemento;
		PrecioCosto precioCosto;
		for (Object object : elementosNuevos) {
			precioCosto=new PrecioCosto();
			precioCosto.setCosto(0);

			
			/*
			 * La moneda es obtenida de diferentes formas dependiendo de tipo de elemento.
			 * 1- Si es concepto el elemento: Se trae del conceptoPresupuesto, el valor monedaPorDefecto.
			 * 2-Si es articulo o cualquiera de las determinaciones, se recupera de la moneda por defecto del sistema.
			 */
			Moneda monedaPorDefecto;
			
			if (object instanceof ConceptoPresupuesto) {
				ConceptoPresupuesto e=(ConceptoPresupuesto) object;
				precioCosto.setConceptoPresupuesto(e);
				precioCosto.setMoneda(e.getMonedaPorDefecto());
			}else{
				Configuracion monedaPorDefectoParam = obtenerConfiguracion(PARAMETRO_MONEDA_POR_DEFECTO);
				monedaPorDefecto= (Moneda) obtener(Moneda.class, String.valueOf(monedaPorDefectoParam.getValorNumero()));	
				precioCosto.setMoneda(monedaPorDefecto);
			}
			
			if (object instanceof Determinacion) {
				Determinacion e=(Determinacion) object;
				precioCosto.setDeterminacion(e);
			}
			if (object instanceof Producto) {
				Producto e=(Producto) object;
				precioCosto.setProducto(e);
			}
			
			notificarObjeto(WRITER_COSTO, precioCosto);

		}
		
	}
	
	private List obtenerProductosNuevos(List ids) {
		String condicionLista=StringUtils.EMPTY;
		if (!ids.isEmpty()) {
			condicionLista="where e.id not in (:ids)";
		}
		
		Query qNuevosElementos;
		String basicQuery=String.format("from %s e", CLASE_PRODUCTO);

		String filtros=StringUtils.EMPTY;
		if (filtroClasificador!=null) {
			//Filtrar por clasificador
			filtros=SEPARADOR_CLASES_HQL + " ProductoClasificador clasificacion where clasificacion.producto.id=e.id and clasificacion.componenteValor.id = :clasificador";
			
			if (!ids.isEmpty()) {
				condicionLista="and e.id not in (:ids)";
			}
			
			String select="select e";
			qNuevosElementos=crearHQL(select.concat(QUERY_UTILS_SPACE).concat(basicQuery).concat(filtros).concat(QUERY_UTILS_SPACE).concat(condicionLista));
			qNuevosElementos.setParameter("clasificador", Long.valueOf(filtroClasificador));
		}else if(filtroCodigoDesde!=null && filtroCodigoHasta!=null){
			//filtro por codigos
			filtros=QUERY_UTILS_SPACE.concat("where e.codigo >= :codigoDesde and e.codigo <= :codigoHasta");
			
			if (!ids.isEmpty()) {
				condicionLista=QUERY_UTILS_SPACE.concat("and e.id not in (:ids)");
			}
			
			qNuevosElementos=crearHQL(basicQuery.concat(filtros).concat(condicionLista));
			qNuevosElementos.setParameter("codigoDesde", filtroCodigoDesde);
			qNuevosElementos.setParameter("codigoHasta", filtroCodigoHasta);
		}else{
			//without filters
			qNuevosElementos=crearHQL(basicQuery.concat(QUERY_UTILS_SPACE).concat(condicionLista));
		}
		
		if (!ids.isEmpty()) {
			qNuevosElementos.setParameterList("ids", ids);
		}
		
		return qNuevosElementos.list();
	
	}

	/**
	 * 
	 * Obtiene Conceptos y retorna una lista de precios de costos nuevos.
	 */
	private List obtenerConceptosNuevos(List ids){
		String condicion=StringUtils.EMPTY;
		if (!ids.isEmpty()) {
			condicion="where e.id not in (:ids)";
		}
		
		String consultaNuevosElementos="from " + CLASE_CONCEPTO_PRESUPUESTO + " e "+condicion;
		Query qNuevosElementos = crearHQL(consultaNuevosElementos);
		
		if (!ids.isEmpty()) {
			qNuevosElementos.setParameterList("ids", ids);
		}
		
		return qNuevosElementos.list();
	}
	
	/**
	 * Obtiene las determinaciones nuevas y las muetra en formato de precio de costos nuevos.
	 */
	private List obtenerDeterminacionesNuevas(List ids, long idLaboratorio){
		String condicion;
		if (ids.isEmpty()) {
			condicion= "where e.laboratorio.id=:lab";
		}else{
			condicion= "where e.id not in (:ids) and e.laboratorio.id=:lab";
		}
		String consultaNuevosElementos="from "+CLASE_DETERMINACION+" e "+condicion;
		Query qNuevosElementos = crearHQL(consultaNuevosElementos);
		
		if (!ids.isEmpty()) {
			qNuevosElementos.setParameterList("ids", ids);
		}
		
		qNuevosElementos.setParameter("lab", idLaboratorio);
		return qNuevosElementos.list();
	}

	/**
	 * Verifica que en el sistema existan los parametros necesarios.
	 * 
	 */
	private void obtenerConfiguraciones() throws JakartaException {
		configuracionLaboratorioElectrico = obtenerConfiguracionDeLaboratorio(NOMBRE_PARAMETRO_LABORATORIO_ELECTRICO);
		configuracionLaboratorioQuimico = obtenerConfiguracionDeLaboratorio(NOMBRE_PARAMETRO_LABORATORIO_QUIMICO);
		
		if (configuracionLaboratorioElectrico==null || configuracionLaboratorioQuimico==null) {
			throw new JakartaException("Compruebe la parametrizacion de los laboratorios quimico y electrico.");
		}
	}
	
	/**
	 * Helper method
	 */
	private Configuracion obtenerConfiguracionDeLaboratorio(String nombre) throws JakartaException {
		return (Configuracion) serviceRepository.getUniqueByProperty(Configuracion.class, "nombre", nombre);
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

	/**
	 * Se encarga de retornar los costos, dependiendo del tipo solicitado.
	 * 
	 */
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
			return obtenerProductos();
		case TIPO_LABORATORIO_QUIMICO:
			return recuperarDeterminacion(configuracionLaboratorioQuimico);
		case TIPO_LABORATORIO_ELECTRICO:
			return recuperarDeterminacion(configuracionLaboratorioElectrico);
		case TIPO_CONCEPTO:
			return obtenerConceptos();
		default:
			throw new JakartaException("El tipo de elemento recibido no se corresponde con los tipos disponibles.");
		}
	}

	/**
	 * Valida que los filtros no sea vacios.
	 */
	private boolean filtrosCodigoValidos(){
		if(filtroCodigoDesde!=null && filtroCodigoHasta!=null){
			if (filtroCodigoDesde.isEmpty() || filtroCodigoHasta.isEmpty()) {
				return false;
			}
		}else{
			return false;
		}
		return true;
	}
	
	private List<PrecioCosto> obtenerProductos() {
		//Ver el filtro
		Query qIds;
		
		if (filtrosCodigoValidos()) {
			String basicQuery="select distinct (costo.producto.id) from PrecioCosto costo where costo.producto is not null";
			String filterQuery="and costo.producto.codigo >= :codigoDesde and costo.producto.codigo <= :codigoHasta"; 
			qIds = crearHQL(basicQuery.concat(QUERY_UTILS_SPACE).concat(filterQuery));
			qIds.setParameter("codigoDesde", filtroCodigoDesde);
			qIds.setParameter("codigoHasta", filtroCodigoHasta);
			
		}else if(filtroClasificador!=null){
			String query="select distinct (costo.producto.id) from PrecioCosto costo, ProductoClasificador clasificacion";
			String filterQuery="where costo.producto is not null and costo.producto.id = clasificacion.producto.id and clasificacion.componenteValor.id = :clasificador";
			qIds = crearHQL(query.concat(QUERY_UTILS_SPACE).concat(filterQuery));
			qIds.setParameter("clasificador", Long.valueOf(filtroClasificador));
	
		}else{
			qIds = crearHQL("select distinct (costo.producto.id) from PrecioCosto costo where costo.producto is not null");
		}
		
		Query qCostos;
		List list = qIds.list();
		List<PrecioCosto> costos=new ArrayList<PrecioCosto>();
		long id;
		for (Object object : list) {
			id=(Long) object;
			qCostos=crearHQL("from PrecioCosto costo where costo.producto.id=:id order by costo.fecha desc");
			qCostos.setMaxResults(1);
			qCostos.setParameter("id", id);
			PrecioCosto precioCosto = (PrecioCosto) qCostos.uniqueResult();
			costos.add(precioCosto);
		}
		return costos;
	}

	/**
	 * Consulta que sirve para filtrar elementos.
	 * Este metodo es ejecutado para filtrar elementos 'simples', los cuales son conceptoPresupuesto y producto.
	 * 
	 */
	private List<PrecioCosto> obtenerConceptos() {
		Query qIds = crearHQL("select distinct (costo.conceptoPresupuesto.id) from PrecioCosto costo where costo.conceptoPresupuesto is not null");
		Query qElemento;
		List list = qIds.list();
		List<PrecioCosto> costos=new ArrayList<PrecioCosto>();
		long id;
		for (Object object : list) {
			id=(Long) object;
			qElemento=crearHQL("from PrecioCosto costo where costo.conceptoPresupuesto.id=:id order by costo.fecha desc");
			qElemento.setMaxResults(1);
			qElemento.setParameter("id", id);
			PrecioCosto precioCosto = (PrecioCosto) qElemento.uniqueResult();
			costos.add(precioCosto);
		}
		return costos;
	}
	
	/**
	 * Consulta que filtra las determinaciones ordenando por fecha, y recuperando los ultimos valores.
	 * 
	 */
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
	
}
