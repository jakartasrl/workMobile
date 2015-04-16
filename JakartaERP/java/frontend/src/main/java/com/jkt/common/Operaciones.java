package com.jkt.common;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.zkoss.zk.ui.Executions;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ListDescriptibleOV;

public class Operaciones {

	static public String url;
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * Metodo que se encarga de llamar la operacion del servlet
	 * 
	 * @param operacion
	 *            -> nombre de la operacion
	 * @param objetoOV
	 *            -> input de la operacion
	 * @return
	 * @throws ServletException
	 */
	public static Object ejecutar(String operacion, Object objetoOV, Class<?> clazz) throws ServletException {
		
		if (url==null || url.isEmpty()) {
			String server = Executions.getCurrent().getServerName();
			int port = Executions.getCurrent().getServerPort();
			String contextPath = Executions.getCurrent().getContextPath();
			Operaciones.url = "http://" + server + ":" + port + "/" + contextPath + "/api/processorHTML5/xml";
		}
		
		Object result = null;
		Gson gson = new GsonBuilder().create();
		HttpURLConnection con;
		int responseCode = 500;
		URL obj;
		try {
			obj = new URL(url);
			con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("op", operacion);
			// Send post request
			if (objetoOV != null) {
				con.setDoOutput(true);

				con.getOutputStream().write(Base64.encodeBase64(gson.toJson(objetoOV).getBytes()));
				con.getOutputStream().close();
			}
			responseCode = con.getResponseCode();
		} catch (Exception e1) {
			throw new ServletException("Error invocando la operacion:"+operacion,ExceptionUtils.getFullStackTrace(e1));
		}
		if (responseCode != 200) {
			String error = gson.fromJson(con.getHeaderField("error"), String.class);
			String descError =null;
			con.getHeaderFields();
			if (error == null || error.length() == 0) {
				error = "Error inesperado";
			}
			try {
				if(con.getErrorStream()!=null){
					descError= new String(IOUtils.toByteArray(con.getErrorStream()));
				}
			} catch (IOException e) {
			}
	 
			if(descError!=null && !descError.isEmpty()){
				throw new ServletException(error,descError);
			}else{
				throw new ServletException(error,null);
			}
		} else {
			if (clazz != null) {
				String json;
				try {
					json = new String(Base64.decodeBase64(IOUtils.toByteArray(con.getInputStream())));
					result = gson.fromJson(json, clazz);
				} catch (IOException e) {
					throw new ServletException("Error inesperado", ExceptionUtils.getFullStackTrace(e));
				}
			}
		}
		return result;
	}

	public static void ejecutar(String operacion, Object objetoOV) {
		ejecutar(operacion, objetoOV, null);
	}
	
	public static Object ejecutar(String operacion, Class<?> clazz) {
		return ejecutar(operacion, null, clazz);
	}

	public static void ejecutar(String operacion) {
		ejecutar(operacion, null, null);
	}

	/**
	 * Helper method for retrieve one, only one entity using his id and entity name.
	 * 
	 * @param entidad Entity name, see clases.xml 
	 * @param id identifier of entity
	 * @return A {@link DescriptibleOV} entity
	 * @throws JakartaException
	 */
	public static DescriptibleOV recuperarObjetoDescriptible(String entidad, Long id) throws JakartaException {
		ContainerOV containerOV = new ContainerOV();
		
		containerOV.setString1(entidad);
		containerOV.setString2(String.valueOf(id));
		
		ListDescriptibleOV list = (ListDescriptibleOV) ejecutar("Traer", containerOV, ListDescriptibleOV.class);
		if (list.isEmpty()) {
			throw new JakartaException("Se esperaba un elemento unico en la consulta de "+entidad.toLowerCase());
		}
		
		return (DescriptibleOV) list.getList().get(0);
	}
	
}
