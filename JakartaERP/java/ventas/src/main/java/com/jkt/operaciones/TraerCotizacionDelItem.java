package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.jkt.constantes.TiposDeDato;
import com.jkt.cotizador.dominio.ConceptoPresupuesto;
import com.jkt.cotizador.dominio.Cotizador;
import com.jkt.cotizador.dominio.CotizadorDet;
import com.jkt.cotizador.dominio.ModeloCotizador;
import com.jkt.cotizador.dominio.TituloModeloCotizador;
import com.jkt.cotizador.operaciones.AbstractRecuperarModelo;
import com.jkt.dominio.CotizacionDet;
import com.jkt.dominio.Filtro;
import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.Producto;
import com.jkt.erp.articulos.ProductoClasificador;
import com.jkt.excepcion.JakartaException;
import com.jkt.varios.dominio.ComponenteValor;

/**
 * Esta operacion es una de las mas importantes en cuanto a la cotizacion.
 * Recupera la cotizacin de un item determinado en forma de arbol, utilizando su modelo de cotizacion asignado.
 * Muestra cada uno de los detalles, y en cada detalle, tiene logicas de recupero de precio desde diferentes fuentes, monedas desde diferentes fuentas, y demas.
 * TODO armar un documento con esta informacion por favor.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerCotizacionDelItem extends AbstractRecuperarModelo {

	private static final String COTIZADOR_WRITER = "cotizador";
	private static final String ITEM_WRITER = "item";

	private Map<String, Map<String,CotizadorDet>> detallesDeCotizador=new HashMap<String, Map<String,CotizadorDet>>();
	
	private ModeloCotizador modelo = new ModeloCotizador();
	private CotizacionDet item = new CotizacionDet();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(OID));
	
		item=(CotizacionDet) obtener(CotizacionDet.class, (String)aParams.get(OID));
		
		if (tipoCliente.equals(CLIENTE_DELPHI)){
			notificarObjeto(ITEM_WRITER, item);
			notificarObjeto(COTIZADOR_WRITER, item.getCotizador());
		}
		
		Cotizador cotizador = item.getCotizador();
		
		completarMapaDeDetalles(cotizador);
		
		modelo = cotizador.getModelo();
		
		List<TituloModeloCotizador> titulos = modelo.getTitulos();
		for (TituloModeloCotizador tituloModeloCotizador : titulos) {
			mostrarArbol(tituloModeloCotizador,0);//El nivel de los primeros nodos es cero.
		}
		
		if (!tipoCliente.equals(CLIENTE_DELPHI)){
//			notificarObjeto("", modelo);
//			cotizador.setModelo(modelo);
			item.setCotizador(cotizador);
			item.setTitulosTransientes(modelo.getTitulosTransientes());
			notificarObjeto("", item);
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
			
			String key;
			if (cotizadorDet.getConceptoPresupuesto()!=null) {
				key=String.valueOf(cotizadorDet.getConceptoPresupuesto().getId());
				key=key+"-";
				if (cotizadorDet.getTituloModeloCotizador() != null){
					key=key+String.valueOf(cotizadorDet.getTituloModeloCotizador().getId());
				}
				
				Map<String,CotizadorDet> mapComponenteValor = detallesDeCotizador.get(key);
				if(mapComponenteValor==null){
					mapComponenteValor= new HashMap<String, CotizadorDet>();
				}
				
				if(cotizadorDet.getProducto()==null){
					mapComponenteValor.put(String.valueOf("1"), cotizadorDet);
				}else{
					mapComponenteValor.put(String.valueOf(cotizadorDet.getProducto().getId()), cotizadorDet);
				}
				
				detallesDeCotizador.put(key, mapComponenteValor);
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
		
		//Para delphi
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
			
			tituloModeloCotizador.setTipo("C");//Solamente para retornar correctamente un tipo para que sea mas simple desde el cliente la lectura.
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
		 * (Esta variable es el atributo detalleDeConcepto, en la clase TituloModeloCotizador)
		 */
		
		if ("C".equals(tituloModeloCotizador.getTipo())) {//Si es concepto realizar una logica mas avanzada q para el titulo
			
			//Logica para recuperar el detalle correspondiente, recuperando con una clave ID1-ID2, donde id1 es el concepto y ids2 es el titulo (sus ids)
			String key=String.valueOf(tituloModeloCotizador.getConcepto().getId())+"-"+String.valueOf(tituloModeloCotizador.getId());
//			CotizadorDet cotizadorDet = detallesDeCotizador.get(key);
			Map<String, CotizadorDet> mapaDeDetallesPorIdValor = detallesDeCotizador.get(key);
//			CotizadorDet cotizadorDet = detallesDeCotizador.get(key);
			
			
			if (tituloModeloCotizador.getConcepto().isPideArticulo()) {//Mostrar para cada concepto la lista de articulos que se corresponden con el valor de clasificador del concepto
				
				ComponenteValor valor = tituloModeloCotizador.getConcepto().getComponenteValor();
				
				Filtro filtro = new Filtro("componenteValor.id", String.valueOf(valor.getId()), "igual", TiposDeDato.INTEGER_TYPE);
				List<PersistentEntity> clasificacionesDeProducto = serviceRepository.getByProperties(ProductoClasificador.class, Arrays.asList(filtro));
				ProductoClasificador productoClasificador;
				Producto producto;
				
				//Para cada relacion de producto-clasificador, muestro el producto asociado al concepto.
				int i = 10000;
				Random r=new Random();
				i= r.nextInt((999999 - 1) + 1) + 1;
				for (PersistentEntity persistentEntity : clasificacionesDeProducto) {
					
					TituloModeloCotizador copiaDeTitulo = new TituloModeloCotizador();
					copiaDeTitulo.setIdTransiente(tituloModeloCotizador.getId());
					copiaDeTitulo.setTipo("C");//Producto(producto);
					copiaDeTitulo.setDetalleDeConcepto(tituloModeloCotizador.getDetalleDeConcepto());
			
					ConceptoPresupuesto concepto = tituloModeloCotizador.getConcepto(); 					
					copiaDeTitulo.setConcepto(concepto);					
					concepto.setUnidadDeMedidaPorDefecto(concepto.getUnidadDeMedidaPorDefecto());
					
					copiaDeTitulo.setCodigoInterno((int)tituloModeloCotizador.getId());
					copiaDeTitulo.setCodigoInternoPadre(codigoInternoPadre);
							
					productoClasificador=(ProductoClasificador) persistentEntity;
					producto = (Producto) obtener(Producto.class, productoClasificador.getProducto().getId());
					producto.setCodigo(producto.getCodigo());
					tituloModeloCotizador.setProducto(producto);
					
					copiaDeTitulo.setProducto(producto);
					copiaDeTitulo.setCantidad(copiaDeTitulo.getCantidad());

					copiaDeTitulo.setCodigoInterno(copiaDeTitulo.getCodigoInterno()+(i++));
					
					copiaDeTitulo.setCantidad(copiaDeTitulo.getCantidad());
					
//					asignarMonedaPrecioFecha(tituloModeloCotizador2, producto);
					
					asignarMonedaPrecioFecha(tituloModeloCotizador, producto);
					//cotizador det es null cuando se agrega un nuevo titulo al modelo de cotizador.
					//Si se agrega uno debe mostrarse de todos modos este elemento nuevo.
					
					CotizadorDet cotizadorDet = mapaDeDetallesPorIdValor.get(String.valueOf(productoClasificador.getProducto().getId()));
					
					if (cotizadorDet!=null) {
						copiaDeTitulo.setDetalleDeConcepto(cotizadorDet);//puede setearse en un detalle existente o en un nulo...
						copiaDeTitulo.setIdentificadorDetalle(Long.valueOf(cotizadorDet.getId()).intValue());
						copiaDeTitulo.setCantidad(copiaDeTitulo.getDetalleDeConcepto().getCantidad());
						copiaDeTitulo.setPrecioUnitario(copiaDeTitulo.getDetalleDeConcepto().getPrecioUnitario());
						copiaDeTitulo.setPrecio(copiaDeTitulo.getDetalleDeConcepto().getCantidad() * copiaDeTitulo.getDetalleDeConcepto().getPrecioUnitario());
						copiaDeTitulo.setMarkUp(copiaDeTitulo.getDetalleDeConcepto().getMarkUp());
						
						copiaDeTitulo.setImporteVenta(copiaDeTitulo.getDetalleDeConcepto().getImporteVenta());

					}

					if (tipoCliente.equals(CLIENTE_DELPHI)){
						notificarObjeto(WRITER_TITULO, tituloModeloCotizador);
					} else {
						this.modelo.agregarTituloTransiente(copiaDeTitulo);
					}
					
				}
				
			}else{//Si no pide articulo se muestra una linea sola por concepto
				
				
//				ArrayList<CotizadorDet> values = (ArrayList<CotizadorDet>) mapaDeDetallesPorIdValor.values();
				if(mapaDeDetallesPorIdValor!=null){
					
					CotizadorDet cotizadorDet = mapaDeDetallesPorIdValor.get("1");//values.get(0);
					if (cotizadorDet!=null) {
	//				if (cotizadorDet!=null) {
						tituloModeloCotizador.setDetalleDeConcepto(cotizadorDet);//puede setearse en un detalle existente o en un nulo...
						tituloModeloCotizador.setIdentificadorDetalle(Long.valueOf(cotizadorDet.getId()).intValue());
					}
					
					asignarMonedaPrecioFecha(tituloModeloCotizador, null);
					if (tipoCliente.equals(CLIENTE_DELPHI)){
						notificarObjeto(WRITER_TITULO, tituloModeloCotizador);
					} else {
						this.modelo.agregarTituloTransiente(tituloModeloCotizador);
					}
				}
				
			}
			
		} else {
			
			//Esto es un titulo
			tituloModeloCotizador.setIdentificadorDetalle(0);
			if (tipoCliente.equals(CLIENTE_DELPHI)){
				notificarObjeto(WRITER_TITULO, tituloModeloCotizador);
			} else {
				this.modelo.agregarTituloTransiente(tituloModeloCotizador);
			}
		
		}
		
		//Recursividad, o muestreo de concepto.
		if (tieneHijos) {
			for (TituloModeloCotizador subTitulo : titulosHijos) {
				mostrarArbol(subTitulo, tituloModeloCotizador.getCodigoInterno());//se le envia el codigo interno actual (id de base) a cada hijo
			}
		}
		
	}

}