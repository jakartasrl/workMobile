package com.jkt.common;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.zkoss.zk.ui.Executions;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Operaciones {


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
		String server = Executions.getCurrent().getServerName();
		int port = Executions.getCurrent().getServerPort();
		String contextPath = "frontend"; 
		Executions.getCurrent().getContextPath();
		String url = "http://" + server + ":" + port + "/" + contextPath + "/api/processorHTML5/xml";
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
			// TODO Auto-generated catch block
			throw new RuntimeException();
		}
		if (responseCode != 200) {
			String error = gson.fromJson(con.getHeaderField("error"), String.class);
			String descError = con.getHeaderField("descError");
			if (error == null || error.length() == 0) {
				error = "Error inesperado";
			}
			throw new ServletException(error.toString(), descError);
		} else {
			if (clazz != null) {
				String json;
				try {
					json = new String(Base64.decodeBase64(IOUtils.toByteArray(con.getInputStream())));
					result = gson.fromJson(json, clazz);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
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
}
