package com.jkt.request;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.Closure;
import org.apache.commons.collections.CollectionUtils;

import com.jkt.excepcion.ExceptionDS;
import com.jkt.excepcion.ExceptionValidacion;
import com.jkt.excepcion.JakartaException;
import com.jkt.framework.writers.HeaderDataSet;
import com.jkt.framework.writers.IHeaderDataSet;
import com.jkt.xmlreader.CampoDef;
import com.jkt.xmlreader.Input;
import com.jkt.xmlreader.Lista;
import com.jkt.xmlreader.Output;
import com.jkt.xmlreader.TableDef;
import com.jkt.xmlreader.XMLEntity;



/**
 * Title: Framework de Desarrollo de Aplicaciones Java Description: Este
 * proyecto intenta generar un FrameWork de desarrollo generico de aplicaciones
 * JAVA Copyright: Copyright (c) 2001 Company: JAKARTA SRL
 * 
 * @author DHS
 * @version 1.0
 */

public class EventBusiness extends XMLEntity implements IEventBusiness {
	
	private String entidad;
	
	public String getEntidad() {
		return entidad;
	}

	public void setEntidad(String entidad) {
		this.entidad = entidad;
	}

	private static final String OUTPUT = "OUTPUT";
	private static final String INPUT = "INPUT";
	private String redirect;
	private String xmlWriter = "DEFAULT_MAKER";
	private boolean newSesion = false;
	private boolean invalidate = false;
	private boolean gc = false;
	private boolean readOnly = false;
	private boolean usaJMS = false;

	public void setUsaJMS(boolean aVal) {
		this.usaJMS = aVal;
	}

	public boolean getUsaJMS() {
		return usaJMS;
	}

	public boolean getInvalidate() {
		return invalidate;
	}

	public void setInvalidate(boolean aVal) {
		this.invalidate = aVal;
	}

	public boolean getExecuteGarbageCollection() {
		return gc;
	}

	public void setGc(String aVal) {
		this.gc = Boolean.valueOf(aVal).booleanValue();
	}

	public boolean getCreateNewSesion() {
		return newSesion;
	}

	public void setNewSesion(String aVal) {
		this.newSesion = Boolean.valueOf(aVal).booleanValue();
	}

	public void addResult(XMLEntity aEntity) {
		super.addHijo(aEntity);
	}

	public String getXMLWriter() throws ExceptionDS {
		return null;
		// return Aplicacion.getAplicacion().getSystemParameter(xmlWriter); TODO
		// FIXME THIS

	}

	public void setXMLWriter(String xmlWriter) {
		this.xmlWriter = xmlWriter;
	}

	public String getNextView(int aResultStatus) throws ExceptionDS {
		XMLEntity result = (XMLEntity) this.getHijo("" + aResultStatus);
		if (result == null)
			throw new ExceptionValidacion(null,
					"No hay definido un resultado para : " + aResultStatus);

		return result.getValue();
	}

	public String getNextViewExceptionValidacion() {
		try {
			return this.getNextView(-1);
		} catch (ExceptionDS e) {
		}
		return null;
	}

	public String getNextViewExceptionDS() {
		try {
			return this.getNextView(-1);
		} catch (ExceptionDS e) {
		}
		return null;
	}

	public void setReadOnly(String aRead) {
		this.readOnly = Boolean.valueOf(aRead).booleanValue();
	}

	public boolean isReadOnly() {
		return this.readOnly;
	}

	public boolean haceForward() {
		return this.getHijos().size() != 0;
	}

	public String getRedirect() {
		return redirect;
	}

	public void setRedirect(String redirect) {
		this.redirect = redirect;
	}

	// Falta hacer esto seguir aca
	public IHeaderDataSet getHeaderDataSet(String aTabname) {
		IHeaderDataSet header = new HeaderDataSet();
		header.setNombreTabla(aTabname);
		Iterator it = this.getHijos().iterator();
		while (it.hasNext()) {
			XMLEntity tables = (XMLEntity) it.next();
			TableDef tabla = (TableDef) tables.getHijo(aTabname);
			if (tabla == null) {
				throw new ExceptionValidacion(
						"No esta configurada en la operacion la tabla: "
								+ aTabname);
			}
			Iterator it3 = tabla.getCampos().iterator();
			while (it3.hasNext()) {
				CampoDef campo = (CampoDef) it3.next();
				header.addCampo(campo.getName(), campo.getTipo(),
						campo.getLongitud());
			}

		}
		return header;
	}

	/*
	 * Metodos de ayuda para obtener todos los inputs u outputs
	 */
	public List<Output> getOutputs() {
		Collection collectionSons = this.getHijos();

		final List<Output> result = new ArrayList<Output>();
		CollectionUtils.forAllDo(collectionSons, new Closure() {

			public void execute(Object arg0) {
				if (arg0 instanceof Output) {
					result.add((Output) arg0);
				}
			}
		});
		return result;
	}

	public List<Input> getInputs() {
		Collection collectionSons = this.getHijos();

		final List<Input> result = new ArrayList<Input>();
		CollectionUtils.forAllDo(collectionSons, new Closure() {

			public void execute(Object arg0) {
				if (arg0 instanceof Input) {
					result.add((Input) arg0);
				}
			}
		});
		return result;
	}

	public String getOperationClassName() {
		return this.getClase();
	}
	
	/**
	 * Obtiene un hijo {@link Input} recuperandolo por su identificador.
	 * 
	 * @param name
	 * @return
	 * @throws JakartaException Si el elemento recuperado por nombre no es del tipo buscado
	 */
	public Input getHijoInput(String name) throws JakartaException{
		Map hijos=this.getHijosMap();
		if (hijos == null || hijos.isEmpty()){
			return null;
		}
		Object hijo = hijos.get(name);
		if (hijo instanceof Input) {
			return (Input) hijo;
		}else{
			throw new JakartaException("Ocurrio un error. El hijo solicitado no es de elemento INPUT. NOTA: Compruebe el nombre de la TABLA que se corresponde con el elemento INPUT del archivo operaciones.xml");
		}
	}
	
	/**
	 * Obtiene un hijo {@link Output} recuperandolo por su identificador.
	 * 
	 * @param name
	 * @return
	 * @throws JakartaException Si el elemento recuperado por nombre no es del tipo buscado
	 */
	public Output getHijoOutput(String name) throws JakartaException{
		Map hijos=this.getHijosMap();
		if (hijos == null || hijos.isEmpty()){
			return null;
		}
		Object hijo = hijos.get(name);
		if (hijo instanceof Output) {
			return (Output) hijo;
		}else{
			throw new JakartaException("Ocurrio un error. El hijo solicitado no es de elemento Output");
		}
	}

	public List<Lista> obtenerListas() {
		return this.getListas().getListas();
	}
}