package com.jkt.facturacion.dominio;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;

import com.jkt.dominio.LoginDTO;
import com.jkt.dominio.PersistentEntity;
import com.jkt.persistencia.IServiceRepository;

/**
 * Esta clase recibe una solicitud desde una operacion, y utilizando un protocolo, pedido, etc, etc, genera una facturacion contra jakarta ERP.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
abstract public class JakartaERPFacturador extends JakartaERPSistExt {

	public JakartaERPFacturador(IServiceRepository serviceRepository) {
		super(serviceRepository);
	}

	protected StringBuffer generarHeader() throws Exception {
		StringBuffer str=new StringBuffer();
		LoginDTO login = login();
		SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yy");
		str.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\" standalone=\"yes\"?>")
		.append("<Request")
		.append(" op=\"ImportarPedidos3000\"")
		.append(" certificado=\""+login.getCertificado()+"\"")
		.append(" oid_usu_emp=\""+login.getEmpleado()+"\"")
		.append(" sys_oid_sucursal = \""+login.getSucursal()+"\"")
		.append(" sesionID=\""+login.getSession()+"\"")
		.append(" fecha=\""+sdf.format(new Date())+"\"")
		.append(" >");
		return str;
	}

	protected void finalizarHeader(StringBuffer str) {
		str.append(" </Request>");		
	}
	
	abstract public List<Long> ejecutarFacturacion(PersistentEntity entity) throws Exception;

	protected List<Long> returnResult(String requestERP) throws DocumentException {
		Document document=DocumentHelper.parseText(requestERP);
		String ids = document.getRootElement().getText().replace("[", "").replace("]","");
		String[] split = ids.split(",");
		List<Long> result=new ArrayList<Long>();
		for (int i = 0; i < split.length; i++) {
			result.add(Long.valueOf(split[i].trim()));
		}
		return result;
	}

}
