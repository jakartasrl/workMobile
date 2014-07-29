package com.jkt.contexto;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;

import org.apache.commons.digester3.Digester;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.xml.sax.SAXException;

import com.jkt.request.EventBusiness;
import com.jkt.xmlreader.CampoDef;
import com.jkt.xmlreader.CampoEntrada;
import com.jkt.xmlreader.CampoSalida;
import com.jkt.xmlreader.ElementTransformer;
import com.jkt.xmlreader.Form;
import com.jkt.xmlreader.Forms;
import com.jkt.xmlreader.Input;
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
	
	public void iniciarOperacionesYEventos() throws IOException, SAXException{
		Digester digester = this.generateReaderOperation();
		InputStream inputStream = servletContext.getResourceAsStream("/WEB-INF/operaciones.xml");
		this.operaciones = (XMLEntity) digester.parse(inputStream);
		
		
		digester = this.generateReaderEventos();
		inputStream = servletContext.getResourceAsStream("/WEB-INF/eventos.xml");
		this.eventos = (XMLEventos) digester.parse(inputStream);
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
