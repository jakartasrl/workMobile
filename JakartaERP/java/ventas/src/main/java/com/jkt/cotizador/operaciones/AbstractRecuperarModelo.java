package com.jkt.cotizador.operaciones;

import java.util.Map;

import org.hibernate.Query;

import com.jkt.cotizador.dominio.ConceptoPresupuesto;
import com.jkt.cotizador.dominio.TituloModeloCotizador;
import com.jkt.dominio.PrecioCosto;
import com.jkt.erp.articulos.Producto;
import com.jkt.operaciones.Operation;

public abstract class AbstractRecuperarModelo extends Operation {

	//key para recuperar del mapa, desde el cliente enviar�n OID=2, por ejemplo.
	protected static final String OID = "OID";
	//writers mapeados contra el archivo operaciones-ventas.xml
	protected static final String WRITER_TITULO = "titulos";
	
	protected void asignarMonedaPrecioFecha(TituloModeloCotizador tituloModeloCotizador, Producto producto) {
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
