package com.jkt.contexto;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.digester3.Digester;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.xml.sax.SAXException;

import com.jkt.excepcion.JakartaException;
import com.jkt.request.EventBusiness;
import com.jkt.xmlreader.CampoDef;
import com.jkt.xmlreader.CampoEntrada;
import com.jkt.xmlreader.CampoSalida;
import com.jkt.xmlreader.ElementTransformer;
import com.jkt.xmlreader.Form;
import com.jkt.xmlreader.Forms;
import com.jkt.xmlreader.Input;
import com.jkt.xmlreader.Lista;
import com.jkt.xmlreader.Listas;
import com.jkt.xmlreader.Output;
import com.jkt.xmlreader.TableDef;
import com.jkt.xmlreader.XMLCampo;
import com.jkt.xmlreader.XMLEntity;
import com.jkt.xmlreader.XMLEvento;
import com.jkt.xmlreader.XMLEventos;
import com.jkt.xmlreader.XMLObservador;

/**
 * <p>Configuracion general del modulo.</p>
 * 
 */
@Component
@Scope(value=ConfigurableBeanFactory.SCOPE_SINGLETON)
public class Configuration {
	
	
	
	private static final String OPERACIONES_PATH = "/WEB-INF/operaciones/operaciones.xml";
	
	public XMLEventos getEventos() {
		return eventos;
	}

	public void setEventos(XMLEventos eventos) {
		this.eventos = eventos;
	}

	private XMLEntity operaciones  = new XMLEntity();
	private XMLEventos eventos=new XMLEventos();
	
	@Autowired
	private ServletContext servletContext;
	
	public void iniciarOperacionesYEventos() throws IOException, SAXException, JakartaException{
		
		List<String> rutas = Arrays.asList(new String[]{
				"/WEB-INF/operaciones/operaciones-common.xml",
				"/WEB-INF/operaciones/operaciones-seguridad.xml",
				"/WEB-INF/operaciones/operaciones-varios.xml",
				"/WEB-INF/operaciones/operaciones-articulos.xml",
				"/WEB-INF/operaciones/operaciones-clientes.xml"
			});
		
		Digester digester = this.generateReaderOperation();
		InputStream inputStream = abrirRecurso(OPERACIONES_PATH);
		
//		validarInputStream(inputStream);
		
		this.operaciones = (XMLEntity) digester.parse(inputStream);
		
		/*
		 * Para cada una de las rutas indicadas, se agregan las operaciones que contienen...
		 */
		XMLEntity operacionesAdicionales;
		for (String rutaActual : rutas) {
			inputStream = abrirRecurso(rutaActual);
			operacionesAdicionales = (XMLEntity) digester.parse(inputStream);
			
			Collection hijos = operacionesAdicionales.getHijos();
			XMLEntity xml;
			for (Object object : hijos) {
				xml=(XMLEntity) object;
				this.operaciones.addHijo(xml);
			}
		}
		
		digester = this.generateReaderEventos();
		inputStream = servletContext.getResourceAsStream("/WEB-INF/eventos.xml");
		this.eventos = (XMLEventos) digester.parse(inputStream);
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

	private Digester generateReaderEventos() {
		Digester digester = new Digester();
		digester.setValidating(false);
		
		digester.addObjectCreate("entidades", XMLEventos.class.getName());
		
		digester.addObjectCreate("entidades/entidad", XMLEvento.class.getName());
		digester.addSetProperties("entidades/entidad");
		digester.addSetNext("entidades/entidad", "addEvento", XMLEvento.class.getName());
//		
		digester.addObjectCreate("entidades/entidad/observador", XMLObservador.class.getName());
		digester.addSetProperties("entidades/entidad/observador");
		digester.addSetNext("entidades/entidad/observador", "addObservador", XMLObservador.class.getName());
		
		return digester;
	}

	/**
	 * Genera las reglas de digester para levantar el archivo XML de operaciones
	 * 
	 * @return Digester
	 */
	private Digester generateReaderOperation(){
		
		Digester digester = new Digester();
		digester.setValidating(false);
		
		digester.addObjectCreate("entity", XMLEntity.class.getName());
		
		digester.addObjectCreate("entity/operacion", EventBusiness.class.getName());

		digester.addSetProperties("entity/operacion");
		digester.addSetNext("entity/operacion", "addHijo", EventBusiness.class.getName());
		
		digester.addObjectCreate("entity/operacion/dataset", XMLEntity.class.getName());
		digester.addSetProperties("entity/operacion/dataset");
		digester.addSetNext("entity/operacion/dataset", "addHijo", XMLEntity.class.getName());

		digester.addObjectCreate("entity/operacion/dataset/campo", XMLCampo.class.getName());
		digester.addSetProperties("entity/operacion/dataset/campo");
		digester.addSetNext("entity/operacion/dataset/campo", "addHijo", XMLCampo.class.getName());

		digester.addObjectCreate("entity/operacion/tables", XMLEntity.class.getName());
		digester.addSetProperties("entity/operacion/tables");
		digester.addSetNext("entity/operacion/tables", "addHijo", XMLEntity.class.getName());
		
		
		/*
		 * FORMS
		 * 
		 */
		
		//levanta los tags INPUT y los agrega a un XML entity
		digester.addObjectCreate("entity/operacion/forms", Forms.class.getName());
		digester.addSetProperties("entity/operacion/forms");
		digester.addSetNext("entity/operacion/forms", "setForms", Forms.class.getName());

		
		//levanta los tags INPUT y los agrega a un XML entity
		digester.addObjectCreate("entity/operacion/forms/form", Form.class.getName());
		digester.addSetProperties("entity/operacion/forms/form");
		digester.addSetNext("entity/operacion/forms/form", "addFormulario", Form.class.getName());

		
		
		/*
		 * CAMPOS LISTAS
		 * CAMPOS LISTAS
		 * 
		 */
		
		digester.addObjectCreate("entity/operacion/listas", Listas.class.getName());
		digester.addSetProperties("entity/operacion/listas");
		digester.addSetNext("entity/operacion/listas", "setListas", Listas.class.getName());
		
		digester.addObjectCreate("entity/operacion/listas/lista", Lista.class.getName());
		digester.addSetProperties("entity/operacion/listas/lista");
		digester.addSetNext("entity/operacion/listas/lista", "addLista", Lista.class.getName());
		
		digester.addObjectCreate("entity/operacion/listas/lista/lista", Lista.class.getName());
		digester.addSetProperties("entity/operacion/listas/lista/lista");
		digester.addSetNext("entity/operacion/listas/lista/lista", "addLista", Lista.class.getName());
		
		/*
		 * CAMPOS LISTAS
		 * CAMPOS LISTAS
		 * 
		 */
		
		
		/*
		 * Campos INPUT, para recibir la entrada.
		 */

		//levanta los tags INPUT y los agrega a un XML entity
		digester.addObjectCreate("entity/operacion/input", Input.class.getName());
		digester.addSetProperties("entity/operacion/input");
		digester.addSetNext("entity/operacion/input", "addHijoInput", Input.class.getName());
		
		//de cada un de los elementos INPUT agregados recien, busca x cada uno los tag CAMPOENTRADA y los agrega
		digester.addObjectCreate("entity/operacion/input/campoEntrada", CampoEntrada.class.getName());
		digester.addSetProperties("entity/operacion/input/campoEntrada");
		digester.addSetNext("entity/operacion/input/campoEntrada", "addHijo", CampoEntrada.class.getName());
		
		//dentro del tag INPUT, existen tags CAMPOENTRADA, quea su vez contienen campos INPUT
		digester.addObjectCreate("entity/operacion/input/campoEntrada/input", Input.class.getName());
		digester.addSetProperties("entity/operacion/input/campoEntrada/input");
		digester.addSetNext("entity/operacion/input/campoEntrada/input", "addHijo", Input.class.getName());
		
		
		//WIP
		digester.addObjectCreate("entity/operacion/input/campoEntrada/campoEntrada", CampoEntrada.class.getName());
		digester.addSetProperties("entity/operacion/input/campoEntrada/campoEntrada");
		digester.addSetNext("entity/operacion/input/campoEntrada/campoEntrada", "addHijo", CampoEntrada.class.getName());
		
		//WIP
		digester.addObjectCreate("entity/operacion/input/campoEntrada/campoEntrada/campoEntrada", CampoEntrada.class.getName());
		digester.addSetProperties("entity/operacion/input/campoEntrada/campoEntrada/campoEntrada");
		digester.addSetNext("entity/operacion/input/campoEntrada/campoEntrada/campoEntrada", "addHijo", CampoEntrada.class.getName());
		
		//WIP
		digester.addObjectCreate("entity/operacion/input/campoEntrada/campoEntrada/campoEntrada/campoEntrada", CampoEntrada.class.getName());
		digester.addSetProperties("entity/operacion/input/campoEntrada/campoEntrada/campoEntrada/campoEntrada");
		digester.addSetNext("entity/operacion/input/campoEntrada/campoEntrada/campoEntrada/campoEntrada", "addHijo", CampoEntrada.class.getName());
		
		digester.addObjectCreate("entity/operacion/input/campoEntrada/campoEntrada/campoEntrada/campoEntrada/campoEntrada", CampoEntrada.class.getName());
		digester.addSetProperties("entity/operacion/input/campoEntrada/campoEntrada/campoEntrada/campoEntrada/campoEntrada");
		digester.addSetNext("entity/operacion/input/campoEntrada/campoEntrada/campoEntrada/campoEntrada/campoEntrada", "addHijo", CampoEntrada.class.getName());
		
		
		
		//de cada un de los elementos INPUT agregados recien, busca x cada uno los tag CAMPOENTRADA y los agrega
		digester.addObjectCreate("entity/operacion/input/campoEntrada/input/campoEntrada", CampoEntrada.class.getName());
		digester.addSetProperties("entity/operacion/input/campoEntrada/input/campoEntrada");
		digester.addSetNext("entity/operacion/input/campoEntrada/input/campoEntrada", "addHijo", CampoEntrada.class.getName());
		
		//TODO usar algun xpath recursivo para evitar todo esto.
		/*
		 * Campos INPUT, para recibir la entrada.
		 */		
		
//		TRANSFORMERS
		digester.addObjectCreate("entity/operacion/transformer", ElementTransformer.class.getName());
		digester.addSetProperties("entity/operacion/transformer");
		digester.addSetNext("entity/operacion/transformer", "setTransformer", ElementTransformer.class.getName());
		
		/*
		 * Campos OUTPUT, para enviar la salida.
		 */
		
		digester.addObjectCreate("entity/operacion/output", Output.class.getName());
		digester.addSetProperties("entity/operacion/output");
		digester.addSetNext("entity/operacion/output", "addHijoOutput", Output.class.getName());
		
		digester.addObjectCreate("entity/operacion/output/campoSalida", CampoSalida.class.getName());
		digester.addSetProperties("entity/operacion/output/campoSalida");
		digester.addSetNext("entity/operacion/output/campoSalida", "addHijo", CampoSalida.class.getName());

		digester.addObjectCreate("entity/operacion/output/campoSalida/campoSalida", CampoSalida.class.getName());
		digester.addSetProperties("entity/operacion/output/campoSalida/campoSalida");
		digester.addSetNext("entity/operacion/output/campoSalida/campoSalida", "addHijo", CampoSalida.class.getName());
		
		digester.addObjectCreate("entity/operacion/output/campoSalida/campoSalida/campoSalida", CampoSalida.class.getName());
		digester.addSetProperties("entity/operacion/output/campoSalida/campoSalida/campoSalida");
		digester.addSetNext("entity/operacion/output/campoSalida/campoSalida/campoSalida", "addHijo", CampoSalida.class.getName());
		
		
		/*
		 * Campos OUTPUT, para enviar la salida.
		 */
		
		digester.addObjectCreate("entity/operacion/tables/tableDef", TableDef.class.getName());
		digester.addSetProperties("entity/operacion/tables/tableDef");
		digester.addSetNext("entity/operacion/tables/tableDef", "addHijo", TableDef.class.getName());

		digester.addObjectCreate("entity/operacion/tables/tableDef/campoTable", CampoDef.class.getName());
		digester.addSetProperties("entity/operacion/tables/tableDef/campoTable");
		digester.addSetNext("entity/operacion/tables/tableDef/campoTable", "addHijo", CampoDef.class.getName());

		//PARA RESULTADOS DE XML
		digester.addObjectCreate("entity/operacion/result", XMLEntity.class.getName());
		digester.addSetProperties("entity/operacion/result");
		digester.addSetNext("entity/operacion/result", "addResult", XMLEntity.class.getName());

		return digester;
	}

	public XMLEntity getOperaciones() {
		return operaciones;
	}

	public void setOperaciones(XMLEntity operaciones) {
		this.operaciones = operaciones;
	}

	public ServletContext getServletContext() {
		return servletContext;
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
}
