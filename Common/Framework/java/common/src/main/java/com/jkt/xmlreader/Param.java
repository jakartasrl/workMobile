package com.jkt.xmlreader;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.jkt.xmlreader.digester.IName;

public class Param implements IName, Serializable {
	private static String ESTANDAR = "estandar";
	private static String OBJETO   = "Objeto";
	
	private List titulos = new ArrayList();
	private Map restricciones = new Hashtable();
	private Map forms = new HashMap();
	private Map comportamientos = new HashMap();
		
	private String codigo;
	private String descripcion;
	private String nickName = "";
	private String tipo     = OBJETO;
	private String tipoHelp = ESTANDAR;
	private String params;

	public String getName(){
		return codigo;
	}
	public String getValue(){
		return codigo;
	}
	
	
	public List getTitulos(){
		return titulos;
	}
	
	public void addTitulo(Object aObj){
		titulos.add(aObj);
	}
	
	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getTipoHelp() {
		return tipoHelp;
	}

	public void setTipoHelp(String tipoHelp) {
		this.tipoHelp = tipoHelp;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public void addRestriccion(IName aObj){
		restricciones.put(aObj.getName(), aObj);		
	}
	
	public void addForm(IName aObj){	    
		forms.put(aObj.getName(), aObj);		
	}
	
	public void addComportamiento(IName aObj){
		comportamientos.put(aObj.getName(),aObj);		
	}
	
	public boolean isAllowed(String aName){
		return restricciones.containsKey(aName);
	}
	
	public boolean isHelpStandar(){
		return tipoHelp.equals(ESTANDAR);
	}
	
	public Map getForms(){
		return forms;
	}
	
	public Map getComportamientos(){
		return comportamientos;
	}

	public String getArbolTitulos() {
	    StringBuffer arbol = new StringBuffer();

	    if (titulos != null) {
	        XMLEntity titulo = (XMLEntity) titulos.get(0);
            arbol.append(titulo.getName());
	        
            Iterator itSubTitulos = titulo.getHijos().iterator();
            while (itSubTitulos.hasNext()) {
	            XMLEntity entity = (XMLEntity) itSubTitulos.next();
	            arbol.append(" -> " + entity.getName());
	        }
	    }

		return arbol.toString();
	}
	
}