package com.jkt.operaciones;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import lombok.Data;

import org.apache.commons.beanutils.BeanUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;

import com.google.gson.Gson;
import com.jkt.dominio.Descriptible;

public class RecuperarDetallesCaracteristicaProducto extends JakartaERPSistExt {

	
	private static final String KEY = "id".toUpperCase();
	private static final String OPERATION_NAME = "TraerCaracteristicaProductoMobile";

	
	@Data
	public class Detalle{
		private String id, codigo, descripcion, tipo, longitud;
		private List detalles=new ArrayList();
		private List detallesFinal=new ArrayList();
	}
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada((String)aParams.get(KEY));
		String id = (String) aParams.get(KEY);
		List resultado = ejecutarConsultaAERP(id);
		notificarObjeto("", resultado);
		
	}

	@Override
	public List returnResult(String requestERP) throws DocumentException, IllegalAccessException, InvocationTargetException {
		String contenido = parsearTablaAContenidoCrudo(requestERP);
		
		Gson g= new Gson();
		List result =  new ArrayList();
		result = g.fromJson(contenido, List.class);

		List<Detalle> resultadoFinal = new ArrayList<Detalle>();
		for (Object object : result) {
			Detalle d = new Detalle();
			BeanUtils.populate(d, (Map) object);
			
			if(!d.getDetalles().isEmpty()){
				for (Object subObject : d.getDetalles()) {
					Detalle d2 = new Detalle();
					BeanUtils.populate(d2, (Map) subObject);
					d.getDetallesFinal().add(d2);
				}
			}
			
			resultadoFinal.add(d);
		}
		
		return resultadoFinal;
	}
	
	private byte[] getRequestXMLBytes(String oidCaracteristica) throws Exception {
		StringBuffer str = generarHeader(OPERATION_NAME, " oid_estruc=\""+oidCaracteristica+"\" ");//Se envia el parametro sin tablas, dentro el header
		finalizarHeader(str);
		return str.toString().getBytes();
	}

	@Override
	public List ejecutarConsultaAERP(Object entity) throws Exception {
		String requestERP = requestERP(getRequestXMLBytes((String)entity));
		return returnResult(requestERP);
	}
	
	private String parsearTablaAContenidoCrudo(String requestERP) throws DocumentException {
		Document document=DocumentHelper.parseText(requestERP);
		document.getRootElement().getText();
		
		String patterStart = "<RESPONSE STATUS=\"OK\" MENSAJE=\"\" >";
		int start = requestERP.indexOf(patterStart);
		int end = requestERP.indexOf("</RESPONSE>");
		String nuevo = requestERP.substring(start+patterStart.length(), end);
		return nuevo;
	}

}
