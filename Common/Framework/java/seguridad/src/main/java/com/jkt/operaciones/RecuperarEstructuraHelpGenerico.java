package com.jkt.operaciones;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.digester3.Digester;
import org.aspectj.weaver.patterns.IfPointcut.IfFalsePointcut;
import org.xml.sax.SAXException;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.entidades.xml.Campo;
import com.jkt.dominio.entidades.xml.Entidad;
import com.jkt.dominio.entidades.xml.EntidadContainer;
import com.jkt.excepcion.JakartaException;
import com.jkt.transformers.Notificacion;

@OperacionBean
public class RecuperarEstructuraHelpGenerico extends Operation {

	private static final String KEY_ENTIDAD = "entidad";
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

		String keyName = (String)aParams.get(KEY_ENTIDAD);
		if ((keyName==null) || ((keyName!=null) && (keyName.isEmpty()))) {
			throw new JakartaException("Es necesario completar el ID.");
		}
		
		Entidad entidad = entidadContainer.getEntidad(keyName);
		if (entidad==null) {
			throw new JakartaException("No se encontro la estructura de la entidad solicitada");
		}

		//notifica campos
		List<Campo> campos = entidad.getCampos();
		for (Campo campo : campos) {
			this.notificarObjecto(Notificacion.getNew("resultado", campo));
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
	
}
