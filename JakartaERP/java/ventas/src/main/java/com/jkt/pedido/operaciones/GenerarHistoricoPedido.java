package com.jkt.pedido.operaciones;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.beanutils.PropertyUtils;

import com.jkt.operaciones.Operation;
import com.jkt.pedido.dominio.FormaFacturacion;
import com.jkt.pedido.dominio.Pedido;
import com.jkt.pedido.dominio.PedidoDet;
import com.jkt.pedido.dominio.PedidoDocumentacion;
import com.jkt.pedido.dominio.PedidoHistorial;
import com.jkt.pedido.dominio.TareaPedido;
import com.jkt.presupuesto.dominio.Nota;
import com.jkt.presupuesto.dominio.Presupuesto;
import com.jkt.varios.dominio.Contacto;
import com.jkt.varios.dominio.Especificacion;

/**
 * Copia los datos de un pedido en su historial, y aumenta la version del {@link Pedido}.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class GenerarHistoricoPedido extends Operation {

	private static final String KEY_OID_PEDIDO= "OID_PEDIDO".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		String idPedido = (String) aParams.get(KEY_OID_PEDIDO);
		Pedido p =  (Pedido) obtener(Pedido.class, idPedido);
		
		PedidoHistorial historial = new PedidoHistorial();

		
//		Map<String, Object> result = PropertyUtils.describe(p);
//
//		BeanUtilsBean.getInstance().getConvertUtils().register(false, false, 0);
//			
//		result.remove("tareas");
//		result.remove("planificaciones");
//		BeanUtils.populate(historial, result);
		
		BeanUtils.copyProperties(historial, p);
		
//		completarHistorialDesdePedido(p, historial);

		historial.setArchivos(new ArrayList<Especificacion>());
		historial.setDetalles(new ArrayList<PedidoDet>());
		historial.setContactosReferencia(new ArrayList<Contacto>());
		historial.setNotas(new ArrayList<Nota>());
		historial.setFormasFacturacion(new ArrayList<FormaFacturacion>());
		historial.setDocumentacion(new ArrayList<PedidoDocumentacion>());
		historial.setTareas(new ArrayList<TareaPedido>());

		historial.getDocumentacion().addAll(p.getDocumentacion());
		historial.getFormasFacturacion().addAll(p.getFormasFacturacion());
		historial.getContactosReferencia().addAll(p.getContactosReferencia());
		historial.getNotas().addAll(p.getNotas());
		historial.getArchivos().addAll(p.getArchivos());
		historial.getDetalles().addAll(p.getDetalles());
		historial.getTareas().addAll(p.getTareas());
		
		int nuevaVersion = p.getVersion()+1;
		p.setVersion(nuevaVersion);
		p.setVersionado(true);
		
		historial.setPedido(p);
		historial.setVersion(nuevaVersion);
		historial.setFechaVersionado(new Date());
		historial.setId(0L);
		serviceRepository.save(historial);
		
	}

	private void completarHistorialDesdePedido(Pedido p, PedidoHistorial historial) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {

//		Map<String, Object> result = PropertyUtils.describe(p);
//		BeanUtilsBean.getInstance().getConvertUtils().register(false, false, 0);
//		BeanUtils.populate(historial, result);
		
//		historial.setListaPrecios(p.getListaPrecios());
//		historial.setVendedor(p.getVendedor());
//		historial.setTipoVenta(p.getTipoVenta());
//		historial.setRepresentante(p.getRepresentante());
//		historial.setFechaVencimiento(p.getFechaVencimiento());
//		historial.setReferencia(p.getReferencia());		
//		historial.setClienteSucursal(p.getClienteSucursal());
//		historial.setCliente(p.getCliente());
//		historial.setCondicionPago(p.getCondicionPago());
//		historial.setComprobanteRelacionado((Presupuesto) p.getComprobanteRelacionado());
//		historial.setLetra(p.getLetra());
//		historial.setLugarEmision(p.getLugarEmision());
//		historial.setNro(p.getNro());
//		historial.setAnulado(p.isAnulado());
//		historial.setTipoComprobante(p.getTipoComprobante());
//		historial.setFecha(p.getFecha());

	}

}
