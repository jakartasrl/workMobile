package com.jkt.pedido.operaciones;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.jkt.operaciones.Operation;
import com.jkt.pedido.dominio.FormaFacturacion;
import com.jkt.pedido.dominio.Pedido;
import com.jkt.pedido.dominio.PedidoDet;
import com.jkt.pedido.dominio.PedidoDocumentacion;
import com.jkt.pedido.dominio.PedidoHistorial;
import com.jkt.presupuesto.dominio.Nota;
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

		BeanUtils.copyProperties(historial, p);

		historial.setArchivos(new ArrayList<Especificacion>());
		historial.setDetalles(new ArrayList<PedidoDet>());
		historial.setContactosReferencia(new ArrayList<Contacto>());
		historial.setNotas(new ArrayList<Nota>());
		historial.setFormasFacturacion(new ArrayList<FormaFacturacion>());
		historial.setDocumentacion(new ArrayList<PedidoDocumentacion>());

		historial.getDocumentacion().addAll(p.getDocumentacion());
		historial.getFormasFacturacion().addAll(p.getFormasFacturacion());
		historial.getContactosReferencia().addAll(p.getContactosReferencia());
		historial.getNotas().addAll(p.getNotas());
		historial.getArchivos().addAll(p.getArchivos());
		historial.getDetalles().addAll(p.getDetalles());
		
		int nuevaVersion = p.getVersion()+1;
		p.setVersion(nuevaVersion);
		p.setVersionado(true);
		
		historial.setPedido(p);
		historial.setVersion(nuevaVersion);
		historial.setFechaVersionado(new Date());
		historial.setId(0L);
		serviceRepository.save(historial);
		
	}

}
