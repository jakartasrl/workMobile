package com.jkt.operaciones;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.commons.digester3.Digester;
import org.xml.sax.SAXException;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.entidades.xml.Campo;
import com.jkt.dominio.entidades.xml.Entidad;
import com.jkt.dominio.entidades.xml.EntidadContainer;
import com.jkt.dominio.entidades.xml.Operacion;
import com.jkt.dominio.entidades.xml.Validador;
import com.jkt.excepcion.JakartaException;
import com.jkt.transformers.Notificacion;

@OperacionBean
public class RecuperarEstructuraABMGenerico extends Operation {

	/*
	 * Metodo estatico que es ejecutado solamente una vez.
	 */
	static EntidadContainer entidadContainer;
	
	static{
		try {
			Digester digester = generarReglas();
			InputStream in = RecuperarEstructuraABMGenerico.class.getResourceAsStream("abmGenericoMetaData.xml");
			entidadContainer=(EntidadContainer)digester.parse(in);
		} catch (IOException e) {
			throw new RuntimeException("Error de entrada/salida.");
		} catch (SAXException e) {
			throw new RuntimeException("Error de parseo en el archivo de configuracion xml.");
		}
	}
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {

		Entidad entidad = entidadContainer.getEntidad((String)aParams.get("ENTIDAD"));
		if (entidad==null) {
			throw new JakartaException("No se encontro la estructura de la entidad solicitada");
		}

		//notifica operacion
		this.notificarObjecto(Notificacion.getNew("mtConfigOper", entidad.getOperacion()));
		
		//notifica campos
		List<Campo> campos = entidad.getCampos();
		for (Campo campo : campos) {
			this.notificarObjecto(Notificacion.getNew("mtConfigCampos", campo));
		}
		
		//notifica validadores
		List<Validador> validadores = entidad.getValidadores();
		for (Validador currentValidador: validadores) {
			this.notificarObjecto(Notificacion.getNew("mtConfigValidador", currentValidador));
		}
		
	}

	/**
	 * Genera las correspondientes reglas para que digester mape� desde el xml a entidades java
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
		
		digester.addObjectCreate("entidades/entidad/operacion", Operacion.class.getName());
		digester.addSetProperties("entidades/entidad/operacion");
		digester.addSetNext("entidades/entidad/operacion", "setOperacion", Operacion.class.getName());
		
		digester.addObjectCreate("entidades/entidad/campos/campo", Campo.class.getName());
		digester.addSetProperties("entidades/entidad/campos/campo");
		digester.addSetNext("entidades/entidad/campos/campo", "agregarCampo", Campo.class.getName());

		digester.addObjectCreate("entidades/entidad/validadores/validador", Validador.class.getName());
		digester.addSetProperties("entidades/entidad/validadores/validador");
		digester.addSetNext("entidades/entidad/validadores/validador", "agregarValidador", Validador.class.getName());

		return digester;
	}

}
