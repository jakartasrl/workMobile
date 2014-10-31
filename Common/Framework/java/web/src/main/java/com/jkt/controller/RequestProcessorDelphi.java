package com.jkt.controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.jkt.adapter.Adapter;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.JakartaException;
import com.jkt.request.EventBusiness;
import com.jkt.request.IEventBusiness;
import com.jkt.util.Campos;
import com.jkt.util.HashtableDS;
import com.jkt.util.IMapRequest;
import com.jkt.util.MapDS;
import com.jkt.util.Registro;
import com.jkt.util.Tabla;

/**
 * Class type controller for provide a endPoint that receive all operations from desktop application.
 * Clase de tipo controller para proveer un endpoint que recibe todas las operaciones desde aplicaciones de escritorio.
 * 
 * @author Leonel Suarez - Jakarta SRL
 * @author DHS - Jakarta SRL
 */
@Controller
@RequestMapping(value = "/processorDelphi")
public class RequestProcessorDelphi extends RequestProcessor{

	private static final String KEY_NOMBRE_OPERACION      = "op";
	private static final String KEY_NOMBRE_OPERACION_TEST = "opTest";
	
	@PostConstruct
	public void inyectarSessionEnAdapter(){
		delphiAdapter.setSession(sessionProvider);
	}
	
	@Autowired(required=true)
	@Qualifier("delphiAdapter")
	private Adapter<Map, MapDS> delphiAdapter;
	
	/* (non-Javadoc)
	 * @see com.jkt.controller.RequestProcessor#getAppRequest()
	 */
	@Override
	protected String getAppRequest() {
		return RequestProcessor.CLIENTE_DELPHI;
	}
	
	/* (non-Javadoc)
	 * @see com.jkt.controller.RequestProcessor#retrieveParameters(javax.servlet.http.HttpServletRequest)
	 */
	protected MapDS retrieveParameters(HttpServletRequest request) throws Exception {
		String stringFromRequest = obtenerXML(request);
        return obtenerParams(stringFromRequest);
	}

	
	/**
	 * Gets from request a String buffer
	 * 
	 * @param HttpServletRequest request
	 * @return a StringBuffer
	 * @throws Exception
	 */
	private String obtenerXML(HttpServletRequest req) throws Exception {
		BufferedReader inp = req.getReader();
		StringBuffer strbuf = new StringBuffer("");

		String str = inp.readLine();
		while (str != null) {
			strbuf.append(str + "\n");
			str = inp.readLine();
		}
		inp.close();
		return strbuf.toString();
	}

	private MapDS obtenerParams(String xmlInput) throws Exception {
		IMapRequest params = new HashtableDS();
		InputSource source = new InputSource(new ByteArrayInputStream(xmlInput.getBytes()));
		DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
		Element root = db.parse(source).getDocumentElement();

		NamedNodeMap att = root.getAttributes();
		obtenerAtributos(att, params);
		NodeList nodos = root.getChildNodes();
		recorrerNodos(nodos, params);

		params.put("texto", xmlInput.toString());
		return (MapDS) params;
	}

	private void recorrerNodos(NodeList nodos, IMapRequest mapaPadre) throws JakartaException {
		for (int i = 0; i < nodos.getLength(); i++) {
			Node nodo = nodos.item(i);

			if (nodo.getNodeType() != Node.ELEMENT_NODE){
				continue;
			}
			NamedNodeMap att = nodo.getAttributes();
			IMapRequest mapa;
			if (nodo.getNodeName().equalsIgnoreCase("Tabla")) {
				
				if(nodo.getAttributes().getNamedItem("NOMBRE")==null){
					throw new JakartaException("Ingrese el formato de la tabla correctamente. La tabla debe venir como atributo NOMBRE'");
				}
					
				mapa = new Tabla(nodo.getAttributes().getNamedItem("NOMBRE").getNodeValue());
			}else if (nodo.getNodeName().equalsIgnoreCase("Campos")) {
				Campos campos = new Campos();
				NamedNodeMap attributes2 = nodo.getAttributes();
				for (int i2 = 0; i2 < attributes2.getLength(); i2++) {
					campos.agregarAtributo(
						att.item(i2).getNodeName(),
						att.item(i2).getNodeValue()
					);
				}
				
				//TODO FIXME aca agregar al mismo nivel q tabla los campos
				mapa = campos;
			} else if (nodo.getNodeName().equalsIgnoreCase("Fila")) {
				mapa = new Registro();
			} else {
				mapa = new HashtableDS();
			}

			if (att != null) {
				obtenerAtributos(att, mapa);
			}

			if (nodo.hasChildNodes()) {
				recorrerNodos(nodo.getChildNodes(), mapa);
			}

			if (nodo.getNodeName().equalsIgnoreCase("Tabla")) {
				String tabName = nodo.getAttributes().getNamedItem("NOMBRE").getNodeValue();
				mapaPadre.put(tabName, mapa);
			} else if(nodo.getNodeName().equalsIgnoreCase("Campos")){
//				String camposName = nodo.getAttributes().getNamedItem("nombre").getNodeValue();
				int randomNum = 1 + (int)(Math.random()*100); 
				mapaPadre.put(String.valueOf(randomNum), mapa);
			}else{
//				mapaPadre.put(camposName+randomNum , mapa);
				mapaPadre.put(nodo.getNodeName(), mapa);
			}
		}
	}

	private void obtenerAtributos(NamedNodeMap att, IMapRequest mapaPadre) {
		for (int i = 0; i < att.getLength(); i++) {
			if (mapaPadre instanceof Tabla) {
				((Tabla) mapaPadre).addAtribute(att.item(i).getNodeName(), att.item(i).getNodeValue());
			} else {
				mapaPadre.put(att.item(i).getNodeName(), att.item(i).getNodeValue());
			}
		}
	}

	public Adapter getDelphiAdapter() {
		return delphiAdapter;
	}

	public void setDelphiAdapter(Adapter delphiAdapter) {
		this.delphiAdapter = delphiAdapter;
	}

	@Override
	protected Map adaptParameters(Object input, IEventBusiness operation) throws Exception,EntityNotFoundException {
		this.delphiAdapter.setTest(test);
		Map result=(Map)this.delphiAdapter.adaptRequest((MapDS) input, (EventBusiness)operation);																
		return result;
	}

	@Override
	public Map getParameters(HttpServletRequest request,String operationName) throws Exception {
		log.debug("Parseando la solicitud a un mapa...");
		Map parameters = retrieveParameters(request);
		String key = "";
		if (parameters.containsKey(KEY_NOMBRE_OPERACION)){
			key = KEY_NOMBRE_OPERACION;
			test = false;
		}else if (parameters.containsKey(KEY_NOMBRE_OPERACION_TEST)) {
			key = KEY_NOMBRE_OPERACION_TEST;
			test = true;
		}
		 operationName = (String) parameters.get(key);
		
		getEventBusinessOperation(operationName);
		return parameters;
	}

}
