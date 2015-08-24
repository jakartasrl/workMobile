package com.jkt.facturacion.dominio;

import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.jkt.dominio.PersistentEntity;
import com.jkt.pedido.dominio.FormaFacturacion;
import com.jkt.pedido.dominio.Pedido;
import com.jkt.pedido.dominio.PedidoDet;
import com.jkt.pedido.dominio.TareaPedido;
import com.jkt.persistencia.IServiceRepository;

public class FacturadorPedido extends JakartaERPFacturador {

	public FacturadorPedido(IServiceRepository serviceRepository) {
		super(serviceRepository);
	}

	@Override
	public List<Long> ejecutarFacturacion(PersistentEntity entity) throws Exception {
		TareaPedido tarea = (TareaPedido) entity;
		String requestERP = requestERP(getRequestXMLBytes(tarea));
		return returnResult(requestERP);
	}

	private byte[] getRequestXMLBytes(TareaPedido tarea) throws Exception {
		StringBuffer str = generarHeader();
		str.append(crearTablaDesdePedido(tarea));
		finalizarHeader(str);
		return str.toString().getBytes();
	}

	private String crearTablaDesdePedido(TareaPedido tareaPedido) {
		TablaFacturacionCabeceraDTO dto = crearDTODesdePedido(tareaPedido.getPedido());
		
		StringBuffer str=new StringBuffer();
		str.append(StringUtils.EMPTY)
		
		.append("<Tabla nombre=\"TPedidosCab\">")
		
		.append("<Fila ")
		
		.append(" 	lug_emi	 =\""+			dto.getLugEmi()+"\" ")
		.append(" 	tipo_pedido	 =\""+		dto.getTipoPedido()+"\" ")
		.append(" 	oid_cco	 =\""+			dto.getOidCco()+"\" ")
		.append(" 	oid_cli_suc	 =\""+		dto.getOidCliSuc()+"\" ")
		.append(" 	orden_compra	 =\""+	dto.getOrdenCompra()+"\" ")
		.append(" 	obs_ped	 =\""+			dto.getObsPed()+"\" ")
		.append(" 	obs_fac	 =\""+			dto.getObsFac()+"\" ")
		.append(" 	obs_rem	 =\""+			dto.getObsRem()+"\" ")
		.append(" 	cotizacion	 =\""+		dto.getCotizacion()+"\" ")
		.append(" 	cod_tipo_cambio	 =\""+	dto.getCodTipoCambio()+"\" ")
		.append(" 	desp_directo	 =\""+	dto.getDespDirecto()+"\" ")
		.append(" 	cod_vend_tec	 =\""+	dto.getCodVendTec()+"\" ")
		.append(" 	cod_vend_com	 =\""+	dto.getCodVendCom()+"\" ")
		.append(" 	cod_puerto_destino	 =\""+dto.getCodPuertoDestino()+"\" ")
		.append(" 	cod_lista_precio	 =\""+dto.getCodListaPrecio()+"\" ")
		.append(" 	cod_mon	 =\""+			dto.getCodMon()+"\" ")
		.append(" 	mark_up	 =\""+			dto.getMarkUp()+"\" ")
		.append(" 	porc_mark_up	 =\""+	dto.getPorcMarkUp()+"\" ")
		.append(" 	observacion_interna	 =\""+dto.getObservacionInterna()+"\" ")
		.append(" 	oculta_bonif	 =\""+	dto.getOcultaBonif()+"\" ")
		.append(" 	oculta_bonif_imp	 =\""+dto.getOcultaBonifImp()+"\" ")
		.append(" 	fec_emision	 =\""+		dto.getFecEmision()+"\" ")
		.append(" 	ref_solicitud	 =\""+	dto.getRefSolicitud()+"\" ")
		.append(" 	plazo_entrega	 =\""+	dto.getPlazoEntrega()+"\" ")
		.append(" 	cod_prov	 =\""+		dto.getCodProv()+"\" ")
		.append(" 	liberar_djai	 =\""+	dto.getLiberarDjai()+"\" ")
		.append(" 	despacho_parcial	 =\""+dto.getDespachoParcial()+"\" ")
		.append(" 	entrega_cliente	 =\""+	dto.getEntregaCliente()+"\" ")
		.append(" 	flete_cliente	 =\""+	dto.getFleteCliente()+"\" ")
		.append(" 	auditoria	 =\""+		dto.getAuditoria()+"\" ")
		.append(" 	bloqueo_despacho	 =\""+dto.getBloqueo_despacho()+"\" ")
		.append(" 	forma_pago	 =\""+		dto.getFormaPago()+"\" ")
		.append(" 	cod_cond_pago	 =\""+	dto.getCodCondPago()+"\" ")
		
		.append(">");
		
//		List<PedidoDet> detalles = pedido.getDetalles();
//		for (PedidoDet pedidoDetalle : detalles) {
			str.append(crearDetalle(tareaPedido.getFormaFacturacion()));
//		}
		
		str.append("</Fila>")
		.append("</Tabla>");
		
		return str.toString();
	}
	
	private String crearDetalle(FormaFacturacion fFacturacion) {
		
		TablaFacturacionDetalleDTO dto = crearDTODesdeFormaFacturacion(fFacturacion);
		
		StringBuffer str=new StringBuffer();
		str.append(StringUtils.EMPTY)
		
		.append("<Tabla nombre=\"TPedidosDet\">")
		
		.append("<Fila ")
		
		.append(" 	oid_ped_det	 =\""+		dto.getOidPedDet()+"\" ")
		.append(" 	activo	 =\""+			dto.getActivo()+"\" ")
		.append(" 	cod_art	 =\""+			dto.getCodArt()+"\" ")
		.append(" 	cod_um	 =\""+			dto.getCodUm()+"\" ")
		.append(" 	cant_um_ori	 =\""+		dto.getCantUmOri()+"\" ")
		.append(" 	nro_item	 =\""+		dto.getNroItem()+"\" ")
		.append(" 	desc_adic	 =\""+		dto.getDescAdic()+"\" ")
		.append(" 	porc_comision	 =\""+	dto.getPorcComision()+"\" ")
		.append(" 	porc_utilidad	 =\""+	dto.getPorcUtilidad()+"\" ")
		.append(" 	oid_valor_clasif_det	 =\""+dto.getOidValorClasifDet()+"\" ")
		.append(" 	nro_item2	 =\""+		dto.getNroItem2()+"\" ")
		.append(" 	nro_oc	 =\""+			dto.getNroOc()+"\" ")
		.append(" 	art_clie	 =\""+		dto.getArtClie()+"\" ")
		.append(" 	es_alternativa	 =\""+	dto.getEsAlternativa()+"\" ")
		.append(" 	oid_det_cotiz	 =\""+	dto.getOidPedDet()+"\" ")
		
		.append(" 	precio_lista	 =\""+	dto.getPrecioLista()+"\" ")
		.append(" 	precio_bonif	 =\""+	dto.getPrecioBonif()+"\" ")
		.append(" 	precio	 =\""+			dto.getPrecio()+"\" ")
		.append(" 	cod_moneda	 =\""+		dto.getCodMoneda()+"\" ")
		.append(" 	cod_bon	 =\""+			dto.getCodBon()+"\" ")
		.append(" 	porc_bonif_1	 =\""+	dto.getPorcBonif1()+"\" ")
		.append(" 	porc_bonif_2	 =\""+	dto.getPorcBonif2()+"\" ")
		.append(" 	porc_bonif_3	 =\""+	dto.getPorcBonif3()+"\" ")
		.append(" 	precio_neto_sug	 =\""+	dto.getPrecioNetoSug()+"\" ")
		.append(" 	porc_bonif_1_sug	 =\""+dto.getPorcBonif1Sug()+"\" ")
		.append(" 	porc_bonif_2_sug	 =\""+dto.getPorcBonif2Sug()+"\" ")
		.append(" 	porc_bonif_3_sug	 =\""+dto.getPorcBonif3Sug()+"\" ")
		
		.append(">") 
		
		
		.append("<Tabla nombre=\"TFecEntrega\"><Fila oid_ped_ent=\"1\" activo=\"true\" cantidad=\"1\" fecha=\"10/10/2015\" ></Fila></Tabla>")
		
		.append("</Fila>")
		.append("</Tabla>");
		
		return str.toString();
	}

	static private SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yy");

	private TablaFacturacionCabeceraDTO crearDTODesdePedido(Pedido pedido) {
		TablaFacturacionCabeceraDTO dto = new TablaFacturacionCabeceraDTO();
		dto.setCodListaPrecio(pedido.getListaPrecios().getCodigo());
		dto.setCodMon(pedido.getListaPrecios().getMoneda().getCodigo());
		dto.setFecEmision(sdf.format(pedido.getFecha()));//creo que deberia usar el format del date...
		dto.setObsPed(pedido.getReferencia());
		dto.setOidCliSuc(String.valueOf(pedido.getClienteSucursal().getId()));
		return dto;
	}
	
	private TablaFacturacionDetalleDTO crearDTODesdeFormaFacturacion(FormaFacturacion fFacturacion) {
		TablaFacturacionDetalleDTO dto = new TablaFacturacionDetalleDTO();
//		dto.setOidPedDet(String.valueOf(pedidoDetalle.getId()));
		return dto;
	}

}
