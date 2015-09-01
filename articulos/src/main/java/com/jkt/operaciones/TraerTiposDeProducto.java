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
import com.jkt.dominio.LoginDTO;
import com.jkt.dominio.PersistentEntity;

/**
 * Recupera utilizando una llamada al ERP, con el help generico, todos los tipos de producto
 * Desde la vista, se ejecuta el metodo {@link #execute(Map)}, desde el execute el metodo {@link #ejecutarConsultaAERP(PersistentEntity)}, y desde aqui se llama al ERP
 * 
 * 
 * @author ssuarez
 *
 */
public class TraerTiposDeProducto extends JakartaERPSistExt {
	
	private static final String OPERATION_NAME = "HelpCaracteristicasProductoMobile";

	@Override
	public List ejecutarConsultaAERP(Object entity) throws Exception {
		String requestERP = requestERP(getRequestXMLBytes());
		return returnResult(requestERP);
	}

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		this.loginDTO = (LoginDTO) aParams.get("credenciales");
		
		List resultado = ejecutarConsultaAERP(null);
		notificarObjeto("", resultado);
	}
	
	private byte[] getRequestXMLBytes() throws Exception {
		StringBuffer str = generarHeader(OPERATION_NAME);
		str.append(crearTablaConsulta());
		finalizarHeader(str);
		return str.toString().getBytes();
	}

	private String crearTablaConsulta() {
		StringBuilder builder = new StringBuilder();
		builder.append("<Tabla nombre=\"Params\">").
		append("<Fila OSName=\"EstrucAtriEntidad\" query=\"11\" dataset=\"TMemHlp170\" oid_mae_entidad=\"1500\" >").
		append("</Fila>").
		append("</Tabla>");
		return builder.toString();
	}

	/**
	 * Parsear a la clase que se desee, por ejemplo, pasar por parametros el Class
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
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
	
}