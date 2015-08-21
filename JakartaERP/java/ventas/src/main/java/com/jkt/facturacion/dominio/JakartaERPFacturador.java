package com.jkt.facturacion.dominio;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;

import com.jkt.dominio.LoginDTO;
import com.jkt.laboratorio.dominio.Protocolo;
import com.jkt.laboratorio.dominio.ProtocoloDetalle;
import com.jkt.persistencia.IServiceRepository;

/**
 * Esta clase recibe una solicitud desde una operacion, y utilizando un protocolo, pedido, etc, etc, genera una facturacion contra jakarta ERP.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class JakartaERPFacturador extends JakartaERPSistExt {

	public JakartaERPFacturador(IServiceRepository serviceRepository) {
		super(serviceRepository);
	}

	public List<Long> ejecutarFacturacion(Protocolo protocolo) throws Exception {
		String requestERP = requestERP(getRequestXMLBytes(protocolo));
		Document document=DocumentHelper.parseText(requestERP);
		String ids = document.getRootElement().getText().replace("[", "").replace("]","");
		String[] split = ids.split(",");
		List<Long> result=new ArrayList<Long>();
		for (int i = 0; i < split.length; i++) {
			result.add(Long.valueOf(split[i].trim()));
		}
		return result;
	}
	

	private byte[] getRequestXMLBytes(Protocolo protocolo) throws Exception {
		
		LoginDTO login = login();
		SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yy");
		
		
		StringBuffer str=new StringBuffer();
		str.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\" standalone=\"yes\"?>")
		.append("<Request")
		.append(" op=\"ImportarPedidos3000\"")
		.append(" certificado=\""+login.getCertificado()+"\"")
		.append(" oid_usu_emp=\""+login.getEmpleado()+"\"")
		.append(" sys_oid_sucursal = \""+login.getSucursal()+"\"")
		.append(" sesionID=\""+login.getSession()+"\"")
		.append(" fecha=\""+sdf.format(new Date())+"\"")
		.append(" >")

			
		.append(crearTablaDesdeProtocolo(protocolo));
		
		str.append(" </Request>");
		
		return str.toString().getBytes();
	}

	private String crearDetalle(ProtocoloDetalle protocoloDetalle) {
		
		TablaFacturacionDetalleDTO dto = crearDTODesdeDetalleProtocolo(protocoloDetalle);
		
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
		.append("</Fila>")
		.append("</Tabla>");
		
		return str.toString();
	}

	private Object crearTablaDesdeProtocolo(Protocolo protocolo) {
		
		TablaFacturacionCabeceraDTO dto = crearDTODesdeProtocolo(protocolo);
		
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
		
		List<ProtocoloDetalle> detalles = protocolo.getDetalles();
		for (ProtocoloDetalle protocoloDetalle : detalles) {
			str.append(crearDetalle(protocoloDetalle));
		}
		
		str.append("</Fila>")
		.append("</Tabla>");
		
		return str;
	}

	private TablaFacturacionCabeceraDTO crearDTODesdeProtocolo(Protocolo protocolo) {
		TablaFacturacionCabeceraDTO dto = new TablaFacturacionCabeceraDTO();
		return dto;
	}
	
	private TablaFacturacionDetalleDTO crearDTODesdeDetalleProtocolo(ProtocoloDetalle protocoloDetalle) {
		TablaFacturacionDetalleDTO dto = new TablaFacturacionDetalleDTO();
		dto.setOidPedDet(String.valueOf(protocoloDetalle.getId()));
		dto.setDescAdic(protocoloDetalle.getDescDeterminacion());
		return dto;
	}

}
