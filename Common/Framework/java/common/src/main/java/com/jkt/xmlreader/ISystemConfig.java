package com.jkt.xmlreader;

import java.util.Collection;
import java.util.List;

import com.jkt.excepcion.ExceptionDS;

public interface ISystemConfig {
	public String getDb();
	public String getFactory();
	public String getClase();
	public String getName();
	public String getRegla();
	public String getFiltro();
	public boolean isAuditable();
	
	public Collection getObservadores() throws ExceptionDS;
	public Collection getObservadoresNick() throws ExceptionDS;
	public List getFiltrosSeguridad() throws ExceptionDS;
	public String getOID();
	public void setOID(String oid);

	public Collection getValidadoresPost() throws ExceptionDS;
}
