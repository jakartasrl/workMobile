package com.jkt.contexto;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.xml.sax.SAXException;

import com.jkt.xmlreader.XMLEntity;
import com.jkt.xmlreader.XMLEvento;
import com.jkt.xmlreader.XMLObservador;

/**
 * <p>Clase Principal del modulo.</p>
 * <p>Esta clase se carga como un bean al levantar el contexto de spring.</p>
 * <p>Configuraciones generales en cuanto al modulo, carga de data importante, y todo que sea referente a la configuracion
 * del modulo, van en esta clase de configuración.</p>
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Component
@Qualifier(value="aplication")
@Scope(value=ConfigurableBeanFactory.SCOPE_SINGLETON)
public class ApplicationContext {
	
	@Autowired
	private Configuration configuration;
	
	public ApplicationContext() {
	}

	/**
	 * Metodo que se ejecuta luego de que se levanta el contexto.
	 * 
	 * @throws SAXException 
	 * @throws IOException 
	 */
	@PostConstruct
	public void initMethod() throws IOException, SAXException{
		configuration.iniciarOperacionesYEventos();
	}
	
	/**
	 * Recupera el objeto que contiene la replica del archivo XML operaciones, pero en objetos.
	 * 
	 * @return {@link XMLEntity} with all operations
	 */
	public XMLEntity retrieveBusinessObject(){
		return configuration.getOperaciones();
	}
	
	
	public List<String> retrieveEventosForClass(Class clazz){
		XMLEvento xmlEvento = configuration.getEventos().getEventos().get(clazz.getName());
		if (xmlEvento!=null) {
			List<XMLObservador> observadores = xmlEvento.getObservadores();
			List<String> listListenerClass=new ArrayList<String>();
			for (XMLObservador xmlObservador : observadores) {
				listListenerClass.add(xmlObservador.getClase());
			}
			return listListenerClass;
		}
		return new ArrayList<String>();
	}
	
}
