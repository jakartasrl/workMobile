package com.jkt.operaciones;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.digester3.Digester;
import org.xml.sax.SAXException;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.entidades.xml.Campo;
import com.jkt.dominio.entidades.xml.Entidad;
import com.jkt.dominio.entidades.xml.EntidadContainer;
import com.jkt.excepcion.JakartaException;
import com.jkt.transformers.Notificacion;

@OperacionBean
public class RecuperarEstructuraHelpGenerico extends Operation {

	/*
	 * Metodo estatico que es ejecutado solamente una vez.
	 */
	static EntidadContainer entidadContainer;
	
	static{
		try {
			Digester digester = generarReglas();
			InputStream in = RecuperarEstructuraHelpGenerico.class.getResourceAsStream("helpGenericoMetaData.xml");
			entidadContainer=(EntidadContainer)digester.parse(in);
		} catch (IOException e) {
			throw new RuntimeException("Error de entrada/salida.");
		} catch (SAXException e) {
			throw new RuntimeException("Error de parseo en el archivo de configuracion xml.");
		}
	}
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {

		Entidad entidad = entidadContainer.getEntidad((String)aParams.get("entidad"));
		if (entidad==null) {
			throw new JakartaException("No se encontro la estructura de la entidad solicitada");
		}

		//notifica campos
		List<Campo> campos = entidad.getCampos();
		for (Campo campo : campos) {
			this.notificarObjecto(Notificacion.getNew("resultado", campo));
//			this.notificarObjecto(Notificacion.getNew("mtConfigCampos", campo));//COMO ES UN SIMPLE TRANSFORMER, SE DEBE INFORMAR SIEMPRE EN RESULTADO?
		}
		
	}

	/**
	 * Genera las correspondientes reglas para que digester mapeé desde el xml a entidades java
	 * 
	 * @return
	 */
	private static Digester generarReglas() {
		Digester digester = new Digester();
		digester.setValidating(false);
		
		digester.addObjectCreate("entidades", EntidadContainer.class.getName());
		
		digester.addObjectCreate("entidades/entidad", Entidad.class.getName());
		digester.addSetProperties("entidades/entidad");
		digester.addSetNext("entidades/entidad", "agregarEntidad", Entidad.class.getName());
		
		digester.addObjectCreate("entidades/entidad/campos/campo", Campo.class.getName());
		digester.addSetProperties("entidades/entidad/campos/campo");
		digester.addSetNext("entidades/entidad/campos/campo", "agregarCampo", Campo.class.getName());

		return digester;
	}
	
	public static void main(String args[]) throws Exception{
		RecuperarEstructuraHelpGenerico a = new RecuperarEstructuraHelpGenerico();
		
		Map<String, Object> aParams=new HashMap<String, Object>();
		aParams.put("entidad", new String("empresa"));
		
		a.execute(aParams);
		
	}

}
