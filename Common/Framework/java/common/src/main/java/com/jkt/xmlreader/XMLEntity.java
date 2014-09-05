package com.jkt.xmlreader;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jkt.xmlreader.digester.IName;

public class XMLEntity implements IName {

	private Map hijos;
	protected String name;
	protected String value;
	protected String custom;// VARIABLE COMODIN PARA GUARDAR CUALQUIER TEXTO

	private String keyName, clase, fieldID; // para input y campo de entrada
	private String tableName; // para output
	private Forms forms;
	

	public Forms getForms() {
		return forms;
	}

	public void setForms(Forms forms) {
		this.forms = forms;
	}

	private ElementTransformer transformer;
	
	public ElementTransformer getTransformer() {
		return transformer;
	}

	public void setTransformer(ElementTransformer transformer) {
		this.transformer = transformer;
	}

	private String IO;// Para diferenciarlos entre INPUT U OUTPUT.

	public String getIO() {
		return IO;
	}

	public void setIO(String iO) {
		IO = iO;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getKeyName() {
		return keyName;
	}

	public void setKeyName(String keyName) {
		this.keyName = keyName;
	}

	public String getClase() {
		return clase;
	}

	public void setClase(String clase) {
		this.clase = clase;
	}

	public String getFieldID() {
		return fieldID;
	}

	public void setFieldID(String fieldID) {
		this.fieldID = fieldID.toUpperCase();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setQuery(String name) {
		this.name = name;
	}

	public void setIndex(String name) {
		this.name = name;
	}

	public void addHijo(IName aObj) {
		if (hijos == null) {
			hijos = new HashMap();
		}
		
		if (aObj.getName()==null || aObj.getName().isEmpty()) {
			String hijo="hijo";
			int indice=0;
			boolean containsKey = hijos.containsKey(hijo);
			while (containsKey) {
				indice++;
				hijo=hijo.concat(String.valueOf(indice));
				containsKey = hijos.containsKey(hijo);
			}
			hijos.put(hijo, aObj);
		}else{
			hijos.put(aObj.getName(), aObj);// peligroso esto, si no tiene name te pone siempre al objeto en null!!
		}
		
	}

	public void addHijoInput(XMLEntity aObj) {
		if (hijos == null){
			hijos = new HashMap();
		}
		aObj.setIO("INPUT");
		hijos.put(aObj.getName(), aObj);
	}
	
	public void addHijoOutput(XMLEntity aObj) {
		if (hijos == null){
			hijos = new HashMap();
		}
		aObj.setIO("OUTPUT");
		hijos.put(aObj.getName(), aObj);
	}

	public Collection getHijos() {
		if (hijos == null){
			hijos = new HashMap();
		}
		return hijos.values();
	}

	public Map getHijosMap() {
		if (hijos == null){
			hijos = new HashMap();
		}
		return hijos;
	}

	public Object getHijo(String aName) {
		if (hijos == null){
			return null;
		}
		return hijos.get(aName);
	}

	public String getDescripcion() {
		return value;
	}

	public void setDescripcion(String val) {
		this.value = val;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String val) {
		this.value = val;
	}

	public String getTabla() {
		return custom;
	}

	public void setTabla(String tab) {
		this.custom = tab;
	}

}