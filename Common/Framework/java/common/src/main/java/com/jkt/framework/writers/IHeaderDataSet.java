package com.jkt.framework.writers;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public interface IHeaderDataSet {
	
	public static final String INTEGER = "Integer";
	public static final String STRING = "String";
	public static final String BYTES = "Bytes";
	public static final String DATE = "Date";
	public static final String BOOLEAN = "Boolean";
	public static final String MEMO = "Memo";
	public static final String CURRENCY = "Currency";
	
	public static final int LONG_INTEGER = 10;
	
	public void setNombreTabla(String aNombreTable);
	public void addCampo(String nombre,String tipo,int longitud);
	public String getTipoCampo(String aCampo);
	public String getTituloCampos();
}