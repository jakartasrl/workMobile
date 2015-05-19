package com.jkt.cotizador.operaciones;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.constantes.TiposDeDato;
import com.jkt.cotizador.dominio.ModeloCotizador;
import com.jkt.cotizador.dominio.TituloModeloCotizador;
import com.jkt.dominio.Filtro;
import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.Producto;
import com.jkt.erp.articulos.ProductoClasificador;
import com.jkt.excepcion.JakartaException;
import com.jkt.varios.dominio.ComponenteValor;

/**
 * <p>Recupera el modelo de cotizador, sus titulos en forma jerarquica y los conceptos de presupuestos.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerModeloParaCotizar extends AbstractRecuperarModelo {
	
	private List<TituloModeloCotizador> titulos=new ArrayList<TituloModeloCotizador>();
	private static final String OID = "OID";
	private static final String WRITER_MODELO = "WRITER_MODELO";
	
	private ModeloCotizador modelo;

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(OID));
		
		modelo=(ModeloCotizador) obtener(ModeloCotizador.class, (String)aParams.get(OID));
		
		if (tipoCliente.equals(CLIENTE_DELPHI)) {
			notificarObjeto(WRITER_MODELO, modelo);
		}
				
		List<TituloModeloCotizador> titulos = modelo.getTitulos();
		for (TituloModeloCotizador tituloModeloCotizador : titulos) {
			mostrarArbol(tituloModeloCotizador,0);//El nivel de los primeros nodos es cero.
		}
		
		if (!tipoCliente.equals(CLIENTE_DELPHI)){
			modelo.setTitulos(titulos);
			notificarObjeto("", modelo);
		}
		
	}

	private void mostrarArbol(TituloModeloCotizador tituloModeloCotizador, int codigoInternoPadre) throws Exception {
		
		tituloModeloCotizador.setCodigoInterno((int)tituloModeloCotizador.getId());
		tituloModeloCotizador.setCodigoInternoPadre(codigoInternoPadre);


		//Recursividad, o muestreo de concepto.
		List<TituloModeloCotizador> titulosHijos = tituloModeloCotizador.getTitulosHijos();
		boolean tieneHijos=!titulosHijos.isEmpty();

		if (!tieneHijos) {
			if(tituloModeloCotizador.getConcepto()==null){
				throw new JakartaException("Este modelo no se puede utilizar hasta que todos los "
						+ "títulos de nivel más bajo tengan un concepto relacionado. Título: " + tituloModeloCotizador.getCodigo());
			}
			
			if (tituloModeloCotizador.getConcepto().isPideArticulo()) {
				if (tituloModeloCotizador.getConcepto().getComponenteValor()==null) {
					throw new JakartaException("El concepto '" + tituloModeloCotizador.getConcepto().getCodigo() + " - " + tituloModeloCotizador.getConcepto().getDescripcion() +
							"' asociado a este modelo pide artículo, y por lo tanto, debe tener relacionado un valor de clasificador de artículo.");
				}
			}
			
			if (tituloModeloCotizador.getConcepto() != null){
				tituloModeloCotizador.setTipo("C");//Solamente para retornar correctamente un tipo y que sea mas simple desde el cliente la lectura.
			}
		
		}
		//Si es un concepto, es un for a mostrar cada uno de los valores segun el concepto y el componente valor...
		
		if ("C".equals(tituloModeloCotizador.getTipo())) {
			if (tituloModeloCotizador.getConcepto().isPideArticulo()) {
				ComponenteValor valor = tituloModeloCotizador.getConcepto().getComponenteValor();
				
				Filtro filtro = new Filtro("componenteValor.id", String.valueOf(valor.getId()), "igual", TiposDeDato.INTEGER_TYPE);
				List<PersistentEntity> clasificacionesDeProducto = serviceRepository.getByProperties(ProductoClasificador.class, Arrays.asList(filtro));
				ProductoClasificador productoClasificador;
				Producto producto;

				//Para cada relacion de producto-clasificador, muestro el producto asociado al concepto.
				int i = 10000;
				for (PersistentEntity persistentEntity : clasificacionesDeProducto) {
					productoClasificador=(ProductoClasificador) persistentEntity;
					producto = (Producto) obtener(Producto.class, productoClasificador.getProducto().getId());
					tituloModeloCotizador.setProducto(producto);
					
					tituloModeloCotizador.setCodigoInterno(tituloModeloCotizador.getCodigoInterno()+(i++));
					
					asignarMonedaPrecioFecha(tituloModeloCotizador, producto);
					
					if (tipoCliente.equals(CLIENTE_DELPHI)) {
						notificarObjeto(WRITER_TITULO, tituloModeloCotizador);
					} else {
						this.modelo.agregarTituloTransiente(tituloModeloCotizador);
					}
				}
				
			}else{
				asignarMonedaPrecioFecha(tituloModeloCotizador, null);
				if (tipoCliente.equals(CLIENTE_DELPHI)) {
					notificarObjeto(WRITER_TITULO, tituloModeloCotizador);
				} else {
					this.modelo.agregarTituloTransiente(tituloModeloCotizador);
				}
			}
			
		}else{
			
			if (tipoCliente.equals(CLIENTE_DELPHI)) {
				notificarObjeto(WRITER_TITULO, tituloModeloCotizador);
			} else {
				this.modelo.agregarTituloTransiente(tituloModeloCotizador);
			}
			
		}
		
		
		if (tieneHijos) {
			for (TituloModeloCotizador subTitulo : titulosHijos) {
				mostrarArbol(subTitulo, tituloModeloCotizador.getCodigoInterno());//se le envia el codigo interno actual (id de base de datos) a cada hijo
			}
		}
		
	}
	
}
		
