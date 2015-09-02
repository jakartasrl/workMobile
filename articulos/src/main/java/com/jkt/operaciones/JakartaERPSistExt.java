package com.jkt.operaciones;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.digester3.Digester;
import org.apache.commons.io.IOUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.tree.DefaultElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.xml.sax.SAXException;

import com.jkt.dominio.JakartaERP;
import com.jkt.dominio.LoginDTO;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;

@Component
abstract public class JakartaERPSistExt extends Operation {

	@Autowired
	private ServletContext servletContext;
	
	abstract protected List returnResult(String requestERP) throws DocumentException, IllegalAccessException, InvocationTargetException;
	
	protected StringBuffer generarHeader(String operacion, String parametroHeader) throws Exception {
		StringBuffer str=new StringBuffer();
		LoginDTO login = this.loginDTO;
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
		LoginDTO login = this.loginDTO;
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
		LoginDTO login = this.loginDTO;
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

	protected LoginDTO loginDTO;
	
	public LoginDTO login() throws JakartaException {
		String requestERP;
		try{
			requestERP = requestERP(getLoginXMLBytes());
			fillLoginDTO(requestERP);
			return loginDTO;
		}catch(com.jkt.excepcion.JakartaException e){
			throw new JakartaException("Verifique usuario y contraseña");
		} catch (Exception e) {
			throw new JakartaException("Verifique usuario y contraseña");
		}
	}
	
	@SuppressWarnings("rawtypes")
	protected void fillLoginDTO(String requestERP) throws Exception {
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
//					throw new JakartaException("Error en el sistema externo: "+msj);
					throw new JakartaException(msj);
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
		JakartaERP conf;// = getConfiguracion();
		 
		try {
			Digester digester = generarReglas();
			InputStream in = JakartaERPSistExt.class.getResourceAsStream("configuracionERP.xml");
			
			List elementos=(List)digester.parse(in);
			if (elementos.size()!=1) {
				throw new JakartaException("Existen inconsistencias en el archivo de configuracion de ERP.");
			}
			conf=(JakartaERP) elementos.get(0);//Hay que obtener el primero.
		} catch (IOException e) {
			throw new RuntimeException("Error de entrada/salida.");
		} catch (SAXException e) {
			throw new RuntimeException("Error de parseo en el archivo de configuracion de ERP");
		}
		
		return "http://"+conf.getIp()+":"+conf.getPort()+"/"+conf.getAplicacion()+"/"+conf.getServlet();
	}

	
	private Digester generarReglas() {
		Digester digester = new Digester();
		digester.setValidating(false);
		
		digester.addObjectCreate("elementos", ArrayList.class);
		
		digester.addObjectCreate("elementos/elemento", JakartaERP.class.getName());
		digester.addSetProperties("elementos/elemento");
		digester.addSetNext("elementos/elemento", "add", JakartaERP.class.getName());

		return digester;
	}

}
