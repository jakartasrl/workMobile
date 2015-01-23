package com.jkt.operaciones;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.jkt.constantes.TiposDeDato;
import com.jkt.cotizador.dominio.ConceptoPresupuesto;
import com.jkt.cotizador.dominio.Cotizador;
import com.jkt.cotizador.dominio.CotizadorDet;
import com.jkt.cotizador.dominio.TituloModeloCotizador;
import com.jkt.dominio.ComprobanteVentaDet;
import com.jkt.dominio.Filtro;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.PrecioCosto;
import com.jkt.erp.articulos.Producto;
import com.jkt.erp.articulos.ProductoClasificador;
import com.jkt.excepcion.JakartaException;
import com.jkt.varios.dominio.ComponenteValor;

public class TraerCotizacionDelItem extends Operation {

	private static final String COTIZADOR_WRITER = "cotizador";
	private static final String ITEM_WRITER = "item";
	private static final String KEY_OID = "oid".toUpperCase();
	private static final String WRITER_TITULO = "titulos";

	private Map<String, CotizadorDet> detallesDeCotizador=new HashMap<String, CotizadorDet>();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(KEY_OID));
	
		ComprobanteVentaDet item=(ComprobanteVentaDet) obtener(ComprobanteVentaDet.class, (String)aParams.get(KEY_OID));
		
		notificarObjeto(ITEM_WRITER, item);
		
		notificarObjeto(COTIZADOR_WRITER, item.getCotizador());
		
		Cotizador cotizador = item.getCotizador();
	
		completarMapaDeDetalles(cotizador);
		
		List<TituloModeloCotizador> titulos = cotizador.getModelo().getTitulos();
		for (TituloModeloCotizador tituloModeloCotizador : titulos) {
			mostrarArbol(tituloModeloCotizador,0);//El nivel de los primeros nodos es cero.
		}

	}

	/**
	 * 
	 * <p>Este metodo tiene la funcion de recibir un cotizador y completar en un mapa sus detalles.</p>
	 * <p>Esto sirve para posteriormente, a partir de los conceptos, poder recuperar el correspondiente detalle del cotizador.</p>
	 * 
	 * @param cotizador para extraer sus detalles
	 */
	private void completarMapaDeDetalles(Cotizador cotizador) {
		List<CotizadorDet> detalles = cotizador.getDetalles();
		for (CotizadorDet cotizadorDet : detalles) {
			
			if (cotizadorDet==null) {
				continue;
			}
			
			if (cotizadorDet.getConceptoPresupuesto()!=null) {
				detallesDeCotizador.put(String.valueOf(cotizadorDet.getConceptoPresupuesto().getId()), cotizadorDet);
			}
		}
	}

	/**
	 * <p>Este metodo recibe un titulo y un numero de nivel padre, y muestra en la salida de la operacion el titulo proporcionado, con su correspondiente nivel, 
	 * y recursivamente sus hijos.</p>
	 * 
	 * @param tituloModeloCotizador
	 * @param codigoInternoPadre
	 * @throws Exception 
	 */
	private void mostrarArbol(TituloModeloCotizador tituloModeloCotizador, int codigoInternoPadre) throws Exception {
		
		tituloModeloCotizador.setCodigoInterno((int)tituloModeloCotizador.getId());
		tituloModeloCotizador.setCodigoInternoPadre(codigoInternoPadre);
	
		List<TituloModeloCotizador> titulosHijos = tituloModeloCotizador.getTitulosHijos();
		boolean tieneHijos=!titulosHijos.isEmpty();
		
		//Si tiene hijos es un titulo, si no tiene hijos es un concepto.
		if (!tieneHijos) {
			if(tituloModeloCotizador.getConcepto()==null){
				throw new JakartaException("El titulo no tiene un concepto relacionado.");
			}
			
			if (tituloModeloCotizador.getConcepto().isPideArticulo()) {
				if (tituloModeloCotizador.getConcepto().getComponenteValor()==null) {
					throw new JakartaException("Si el concepto relacionado al titulo, pide articulo, debe obligatoriamente tener relacionado un valor de clasificador.");
				}
			}
			
			tituloModeloCotizador.setTipo("C");//Solamente para retornar correctamente un tipo y que sea mas simple desde el cliente la lectura.
		}
		
		
		/*
		 * IMPORTANTE. El objetivo de este metodo es armar el arbol del modelo, pero en cada concepto, sus datos completos en cuanto 
		 * al cotizador, es decir:
		 * 
		 * si la jerarquia tiene un padre y dos hijos conceptos, estos conceptos tienen datos relacionados cuando se habla de cotizador.
		 * datos como unidad de medida, cantidad, precio, moneda, estan relacionados a este detalle de cotizador, que esta fuertemente
		 * relacionado con el concepto.
		 * 
		 * Es por eso que decidi usar una variable transiente para poder mostrar a partir del concepto, los detalles del cotizador cargado.
		 */
		
		if ("C".equals(tituloModeloCotizador.getTipo())) {
			CotizadorDet cotizadorDet = detallesDeCotizador.get(String.valueOf(tituloModeloCotizador.getConcepto().getId()));
			
			//cotizador det es null cuando se agrega un nuevo titulo al modelo de cotizador.
			//Si se agrega uno debe mostrarse de todos modos este elemento nuevo.
			
			if (tituloModeloCotizador.getConcepto().isPideArticulo()) {
				ComponenteValor valor = tituloModeloCotizador.getConcepto().getComponenteValor();
				
				Filtro filtro = new Filtro("componenteValor.id", String.valueOf(valor.getId()), "igual", TiposDeDato.INTEGER_TYPE);
				List<PersistentEntity> clasificacionesDeProducto = serviceRepository.getByProperties(ProductoClasificador.class, Arrays.asList(filtro));
				ProductoClasificador productoClasificador;
				Producto producto;
				
				//Para cada relacion de producto-clasificador, muestro el producto asociado al concepto.
				for (PersistentEntity persistentEntity : clasificacionesDeProducto) {
					productoClasificador=(ProductoClasificador) persistentEntity;
					producto = (Producto) obtener(Producto.class, productoClasificador.getProducto().getId());
					tituloModeloCotizador.setProducto(producto);
					
					if (cotizadorDet!=null) {
						tituloModeloCotizador.setDetalleDeConcepto(cotizadorDet);//puede setearse en un detalle existente o en un nulo...
						tituloModeloCotizador.setIdentificadorDetalle(Long.valueOf(cotizadorDet.getId()).intValue());
					}

					asignarMonedaPrecioFecha(tituloModeloCotizador, producto);
					notificarObjeto(WRITER_TITULO, tituloModeloCotizador);
				}
				
			}else{

				if (cotizadorDet!=null) {
					tituloModeloCotizador.setDetalleDeConcepto(cotizadorDet);//puede setearse en un detalle existente o en un nulo...
					tituloModeloCotizador.setIdentificadorDetalle(Long.valueOf(cotizadorDet.getId()).intValue());
				}
				
				asignarMonedaPrecioFecha(tituloModeloCotizador, null);
				notificarObjeto(WRITER_TITULO, tituloModeloCotizador);
			}
		}else{
			//Esto es un titulo
			tituloModeloCotizador.setIdentificadorDetalle(0);
			notificarObjeto(WRITER_TITULO, tituloModeloCotizador);
		}
		
		//Recursividad, o muestreo de concepto.
		if (tieneHijos) {
			for (TituloModeloCotizador subTitulo : titulosHijos) {
				mostrarArbol(subTitulo, tituloModeloCotizador.getCodigoInterno());//se le envia el codigo interno actual (id de base) a cada hijo
			}
		}
		
	}

	private void asignarMonedaPrecioFecha(TituloModeloCotizador tituloModeloCotizador, Producto producto) {
		if (tituloModeloCotizador.getDetalleDeConcepto()!=null) {
			//setear los del detalle
			tituloModeloCotizador.setMoneda(tituloModeloCotizador.getDetalleDeConcepto().getMoneda());
			tituloModeloCotizador.setPrecio(tituloModeloCotizador.getDetalleDeConcepto().getPrecioUnitario());
		}else{
			//buscamos en la lista de precios de costo del concepto
			ConceptoPresupuesto concepto = tituloModeloCotizador.getConcepto();
			Query q;
			PrecioCosto costoRecuperado;
			if (concepto.isPideArticulo()) {
				//recupero de la lista de precios de costo el articulo.
				String hql="from PrecioCosto p where p.producto.id =:id order by p.fecha desc";
				q=crearHQL(hql);
				q.setMaxResults(1);
				q.setParameter("id", producto.getId());
				costoRecuperado = (PrecioCosto) q.uniqueResult();
			}else{
				//recupero de la lista de precios de costo el articulo.
				String hql="from PrecioCosto p where p.conceptoPresupuesto.id =:id order by p.fecha desc";
				q=crearHQL(hql);
				q.setMaxResults(1);
				q.setParameter("id", concepto.getId());
				costoRecuperado = (PrecioCosto) q.uniqueResult();
			}
			
			if (costoRecuperado==null) {
				//Recupera la moneda solamente del concepto.
				tituloModeloCotizador.setMoneda(concepto.getMonedaPorDefecto());
			}else{
				//setea los datos de la lista de precios de costo.
				tituloModeloCotizador.setMoneda(costoRecuperado.getMoneda());
				tituloModeloCotizador.setPrecio(costoRecuperado.getCosto());
				tituloModeloCotizador.setFechaPrecioCosto(costoRecuperado.getFecha());
			}
			
		}
	}
	
}