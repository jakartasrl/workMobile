package com.jkt.operaciones;

import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.IOUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.tree.DefaultElement;

import com.google.gson.Gson;
import com.jkt.dominio.Descriptible;
import com.jkt.dominio.JakartaERP;
import com.jkt.dominio.LoginDTO;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;

abstract public class JakartaERPSistExt extends Operation {

	abstract protected List returnResult(String requestERP) throws DocumentException, IllegalAccessException, InvocationTargetException;
	
	protected StringBuffer generarHeader(String operacion, String parametroHeader) throws Exception {
		StringBuffer str=new StringBuffer();
		LoginDTO login = login();
		SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yy");
		str.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\" standalone=\"yes\"?>")
		.append("<Request")
		.append(" op=\""+operacion+"\"")
		.append(" certificado=\""+login.getCertificado()+"\"")
		.append(" oid_usu_emp=\""+login.getEmpleado()+"\"")
		.append(" ".concat(parametroHeader))
		.append(" sys_oid_sucursal = \""+login.getSucursal()+"\"")
		.append(" sesionID=\""+login.getSession()+"\"")
		.append(" fecha=\""+sdf.format(new Date())+"\"")
		.append(" >");
		return str;
	}

	protected StringBuffer generarHeader(String operacion, List<String> parametrosHeader) throws Exception {
		StringBuffer str=new StringBuffer();
		LoginDTO login = login();
		SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yy");
		str.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\" standalone=\"yes\"?>")
		.append("<Request")
		.append(" op=\""+operacion+"\"")
		.append(" certificado=\""+login.getCertificado()+"\"")
		.append(" oid_usu_emp=\""+login.getEmpleado()+"\"")
		.append(" sys_oid_sucursal = \""+login.getSucursal()+"\"")
		.append(" sesionID=\""+login.getSession()+"\"")
		.append(" fecha=\""+sdf.format(new Date())+"\"")
		.append(" >");
		return str;
	}

	protected StringBuffer generarHeader(String operacion) throws Exception {
		StringBuffer str=new StringBuffer();
		LoginDTO login = login();
		SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yy");
		str.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\" standalone=\"yes\"?>")
		.append("<Request")
		.append(" op=\""+operacion+"\"")
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
	
	abstract protected List ejecutarConsultaAERP(Object entity) throws Exception;

	private  LoginDTO loginDTO;
	
	public LoginDTO login() throws Exception {
		String requestERP = requestERP(getLoginXMLBytes());
		fillLoginDTO(requestERP);
		return loginDTO;
	}
	
	@SuppressWarnings("rawtypes")
	private void fillLoginDTO(String requestERP) throws Exception {
		Document parseText = DocumentHelper.parseText(requestERP);
		Iterator nodeIterator = parseText.getRootElement().nodeIterator();
		loginDTO=new LoginDTO();
		while(nodeIterator.hasNext()){
			nodeIterator.next();
			if(!nodeIterator.hasNext()){
				break;
			}
			DefaultElement element=(DefaultElement) nodeIterator.next();
			if("Usuario".equals(element.attribute("nombre").getValue())){
				Iterator nodeIterator2 = element.nodeIterator();
				while(nodeIterator2.hasNext()){
					nodeIterator2.next();
					DefaultElement next = (DefaultElement) nodeIterator2.next();
					loginDTO.setCertificado(next.attributeValue("certificado"));
					loginDTO.setSession(next.attributeValue("sesionID"));
					break;
				}
			}
			if("Empresa".equals(element.attribute("nombre").getValue())){
				Iterator nodeIterator2 = element.nodeIterator();
				while(nodeIterator2.hasNext()){
					nodeIterator2.next();
					DefaultElement next = (DefaultElement) nodeIterator2.next();
					loginDTO.setEmpleado(next.attributeValue("oid_emp"));
					break;
				}
			}
			if("mtSucursalLogin".equals(element.attribute("nombre").getValue())){
				Iterator nodeIterator2 = element.nodeIterator();
				while(nodeIterator2.hasNext()){
					nodeIterator2.next();
					DefaultElement next = (DefaultElement) nodeIterator2.next();
					loginDTO.setSucursal(next.attributeValue("oid_suc"));
					break;
				}				
			}
		}
	}

	protected String requestERP(byte[] bytes) throws Exception{
		try {
			String url=getUrl();
			HttpURLConnection con;
			URL obj;
			obj = new URL(url);
			con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("POST");
			// Send post request
			con.setDoOutput(true);

			OutputStream os = con.getOutputStream();
			os.write(bytes);
			os.flush();
			
			int responseCode = con.getResponseCode();
			if(responseCode==200){
				String result=IOUtils.toString(con.getInputStream());

				Document parseText = DocumentHelper.parseText(result);
				String status = parseText.getRootElement().attribute("STATUS").getValue();
				if(!"OK".equals(status)){
					String msj = parseText.getRootElement().attribute("MENSAJE").getValue();
					throw new JakartaException("Error en el sistema externo: "+msj);
				}
				
				return result;
			}else{
				throw new JakartaException("Ocurrio un error en el sistema externo: "+con.getErrorStream());
			}
		}catch(JakartaException jktExcep){
			throw jktExcep;
		} catch (Exception e1) {
			throw new JakartaException("Error de comunicacion con el sistema externo",e1);
		}		
	}

	protected byte[] getLoginXMLBytes() throws Exception {
		JakartaERP configuracion = getConfiguracion();
		StringBuffer str=new StringBuffer();
		str.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\" standalone=\"yes\"?>")
		.append("<Request")
		.append(" op=\"Login\"")
		.append(" iniciales=\""+configuracion.getUsuario()+"\"")
		.append(" password=\""+configuracion.getPassword()+"\"")
		.append(" autologin = \"false\"")
		.append(" >")
		.append(" </Request>");
		return str.toString().getBytes();
	}
	
	private  JakartaERP getConfiguracion() throws Exception {
		List<PersistentEntity> all = serviceRepository.getAll(JakartaERP.class);
		if(!all.isEmpty()){
			return (JakartaERP) all.get(0);
		}else{
			throw new JakartaException("No esta configurado el sistema Jakarta");
		}
	}

	protected String getUrl() throws Exception{
		JakartaERP conf = getConfiguracion();
		return "http://"+conf.getIp()+":"+conf.getPort()+"/"+conf.getAplicacion()+"/"+conf.getServlet();
	}


}
