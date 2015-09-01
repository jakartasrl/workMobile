package com.jkt.operaciones;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import org.dom4j.DocumentException;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.JakartaERP;

/**
 * Operacion que se encarga de manejar los accesos al sistema.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
@OperacionBean
public class LoginERP extends JakartaERPSistExt {

	/**
	 * Es el campo por el cual se filtra al usuario. Por protocolo, el codigo ser� igual al username, solamente en esta entidad.
	 */
	private static final String CAMPO_USUARIO = "codigo";

	public void execute(Map<String, Object> aParams) throws Exception {
		String usuario=(String) aParams.get("USUARIO");
		String password=(String) aParams.get("PASSWORD");
		
		String requestERP = requestERP(getRequestXMLBytes(usuario, password));
		fillLoginDTO(requestERP); //genera la respuesta...
		
		notificarObjeto("", loginDTO);
	}

	private byte[] getRequestXMLBytes(String usuario, String password) {
		StringBuffer str=new StringBuffer();
		str.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\" standalone=\"yes\"?>")
		.append("<Request")
		.append(" op=\"Login\"")
		.append(" iniciales=\""+usuario+"\"")
		.append(" password=\""+password+"\"")
		.append(" autologin = \"false\"")
		.append(" >")
		.append(" </Request>");
		return str.toString().getBytes();
	}

	@Override
	protected List returnResult(String requestERP) throws DocumentException, IllegalAccessException, InvocationTargetException {
		return null;
	}

	@Override
	protected List ejecutarConsultaAERP(Object entity) throws Exception {
		return null;
	}
	
}
