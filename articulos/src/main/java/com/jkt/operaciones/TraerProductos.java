package com.jkt.operaciones;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;

import com.google.gson.Gson;
import com.jkt.dominio.Descriptible;
import com.jkt.dominio.DetalleCaracteristicaProducto;
import com.jkt.dominio.FiltroProducto;
import com.jkt.excepcion.JakartaException;

public class TraerProductos extends JakartaERPSistExt {

	private static final String KEY_MAP = "objeto";
	private static final String OPERATION_NAME = "TraerArticulosByComponentesMobile"; //ERP operacion
	private String oidCaracteristica="3000000";
	
	@Override
	protected List returnResult(String requestERP) throws DocumentException, IllegalAccessException, InvocationTargetException {
		String contenido = parsearTablaAContenidoCrudo(requestERP);
		
		Gson g= new Gson();
		List result =  new ArrayList();
		result = g.fromJson(contenido, List.class);

		List<Descriptible> resultadoFinal = new ArrayList<Descriptible>();
		for (Object object : result) {
			Descriptible d = new Descriptible();
			BeanUtils.populate(d, (Map) object);
			resultadoFinal.add(d);
		}
		
		return resultadoFinal;
	}
	
	private String parsearTablaAContenidoCrudo(String requestERP) throws DocumentException {
		Document document=DocumentHelper.parseText(requestERP);
		document.getRootElement().getText();
		
		int start = requestERP.indexOf("[");
		int end = requestERP.indexOf("]");
		String nuevo = requestERP.substring(start, end+1);
		return nuevo;
	}

	@Override
	protected List ejecutarConsultaAERP(Object entity) throws Exception {
		FiltroProducto filtro = (FiltroProducto) entity;
		String requestERP = requestERP(getRequestXMLBytes(filtro));
		return returnResult(requestERP);
	}

	private byte[] getRequestXMLBytes(FiltroProducto filtro) throws Exception {
		StringBuffer str = generarHeader(OPERATION_NAME, " oid_estruc=\""+oidCaracteristica+"\" ");
		str.append(crearTablaConsulta(filtro));
		finalizarHeader(str);
		return str.toString().getBytes();
	}

	private Object crearTablaConsulta(FiltroProducto filtro) throws JakartaException {
		StringBuilder builder = new StringBuilder();
		builder.append("<Tabla nombre=\"MTValorAtributo\">").
		append("<Fila "); //abre la fila
		
		for (DetalleCaracteristicaProducto detalleCaracteristicaProducto : filtro.getDetallesTipoProducto()) {
			
			String atributo;
			if("COMPO".equals(detalleCaracteristicaProducto.getTipo())){
				atributo = " oid_atri_"+detalleCaracteristicaProducto.getOid()+"=\""+detalleCaracteristicaProducto.getIdValorCombo()+"\" atri_"+detalleCaracteristicaProducto.getOid()+"=\""+detalleCaracteristicaProducto.getCodigoCombo()+"\""; 
			}else if("TEXT".equals(detalleCaracteristicaProducto.getTipo())){
				atributo = " oid_atri_"+detalleCaracteristicaProducto.getOid()+"=\"0\" atri_"+detalleCaracteristicaProducto.getOid()+"=\""+detalleCaracteristicaProducto.getValorString()+"\""; 
			}else if("NUM".equals(detalleCaracteristicaProducto.getTipo())){
				atributo = " oid_atri_"+detalleCaracteristicaProducto.getOid()+"=\"0\" atri_"+detalleCaracteristicaProducto.getOid()+"=\""+detalleCaracteristicaProducto.getValorEntero()+"\""; 
			}else{
				throw new JakartaException("Verifique el tipo de dato del detalle de la caracteritica de produto.");
			}
			builder.append(atributo);
		}
		
		builder.append("> "). //cierra la fila
		append("</Fila>").
		append("</Tabla>").
		append("<Tabla nombre=\"MTRecetaDet\"></Tabla>");
		return builder.toString();
	}

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
//		validarEntrada(aParams.get(KEY_MAP));
		List resultado = ejecutarConsultaAERP(aParams.get(KEY_MAP));
		notificarObjeto("", resultado);
	}

}
