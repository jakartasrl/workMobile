package com.jkt.facturacion.dominio;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

/**
 * DTO para enviar request a jakarta erp.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class TablaFacturacionCabeceraDTO {

	static private SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yy");

	private String lugEmi="15";
	private String tipoPedido="REP";
	private String oidCco="-1";
	private String oidCliSuc="832";
	private String ordenCompra="OC-1";
	private String obsPed="Obs. Ped.";
	private String obsFac="Obs. Fac.";
	private String obsRem="Obs. Rem.";
	private String cotizacion="0.00";
	private String codTipoCambio="BNC";
	private String despDirecto="false";
	private String codVendTec="DA";
	private String codVendCom="HW";
	private String codPuertoDestino="BSAS";
	private String codListaPrecio="4";
	private String codMon="ARS";
	private String markUp="true";
	private String porcMarkUp="17.00";
	private String observacionInterna="Observacion Interna...";
	private String ocultaBonif="true";
	private String ocultaBonifImp="true";
	private String fecEmision="10/07/2015"; //+sdf.format(protocolo.getDate())
	private String refSolicitud="Referencia Solicitud...";
	private String plazoEntrega="Plazo Entrega...";
	private String codProv="1008";
	private String liberarDjai="false";
	private String despachoParcial="false";
	private String entregaCliente="true";
	private String fleteCliente="true";
	private String auditoria="false";
	private String bloqueo_despacho="false";
	private String formaPago="CONTADO";
	private String codCondPago="CDO";
	
}
