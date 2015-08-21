package com.jkt.facturacion.dominio;

import lombok.Data;

/**
 * Clase para enviar request al JAKARTA ERP.Representa al detalle de un pedido
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class TablaFacturacionDetalleDTO {

	private String oidPedDet="0";
	private String activo="true";
	private String codArt="0100272807602";
	private String codUm="KG";
	private String cantUmOri="15.00";
	private String nroItem="1";
	private String descAdic="Desc. Adic...";
	private String porcComision="5.00";
	private String porcUtilidad="1.27";
	private String oidValorClasifDet="0";
	private String nroItem2="30";
	private String nroOc="0002-00005580";
	private String artClie="373680602";
	private String esAlternativa="false";
	private String oidDetCotiz="0";
	private String precioLista="70.42";
	private String precioBonif="20.00";
	private String precio="264.16";
	private String codMoneda="USD";
	private String codBon="";
	private String porcBonif1="13.00";
	private String porcBonif2="0.00";
	private String porcBonif3="0.00";
	private String precioNetoSug="70.42";
	private String porcBonif1Sug="0.00";
	private String porcBonif2Sug="0.00";
	private String porcBonif3Sug="0.00";
	
}
