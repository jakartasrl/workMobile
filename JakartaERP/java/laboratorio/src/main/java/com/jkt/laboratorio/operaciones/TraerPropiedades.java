package com.jkt.laboratorio.operaciones;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.digester3.Digester;
import org.springframework.beans.factory.annotation.Autowired;

import com.jkt.contexto.PropiedadMatricial;
import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;

public class TraerPropiedades extends Operation {
	
	@Autowired
	private ServletContext servletContext;

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		String rutaPropiedades="caracteristicas.xml";		
		Digester digester = generateReaderOperaciones();
	
		InputStream in = this.getClass().getResourceAsStream(rutaPropiedades);
		
		List listPropiedades = (List) digester.parse(in);
		notificarObjeto("", listPropiedades);
		
	}
	
	private Digester generateReaderOperaciones() {
		Digester digester = new Digester();
		digester.setValidating(false);
		
		digester.addObjectCreate("propiedades", ArrayList.class.getName());

		digester.addObjectCreate("propiedades/propiedad", PropiedadMatricial.class.getName());
		digester.addSetProperties("propiedades/propiedad");
		digester.addSetNext("propiedades/propiedad", "add", PropiedadMatricial.class.getName());
		
		return digester;
	}
	
	private InputStream abrirRecurso(String operacionesPath) throws JakartaException {
		InputStream inputStream=servletContext.getResourceAsStream(operacionesPath);
		validarInputStream(inputStream, operacionesPath);
		return inputStream;
	}

	private void validarInputStream(InputStream inputStream,String nombreDelArchivo) throws JakartaException {
		if (inputStream==null) {
			throw new JakartaException("No se encuentra el archivo de las operaciones denominado ".concat(nombreDelArchivo));
		}
	}

}
