package com.jkt.operaciones;

import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.jkt.request.IExecutable;
/**
 * Title:        Framework de Desarrollo de Aplicaciones Java
 * Description:  Este proyecto intenta generar un FrameWork de desarrollo generico de aplicaciones JAVA
 * Copyright:    Copyright (c) 2001
 * Company:      JAKARTA SRL
 * @author DHS
 * @version 1.0
 */

public interface IOperation extends IExecutable{
//	public Map        getXMLConfig();
//	public Connection getConnection();
	
//	public void addWriter(IWriter aWriter);
	
//	public void setParams(HttpServletRequest req, HttpServletResponse res, IEventBusiness ev);
//	public void setEscribeXML();
	
//	public Integer run(MapDS aParams, boolean aTrace, String aOPName, Date aInicio) throws Exception;
	
//	public static final Integer OK = new Integer(0);
//	
//	public IHeaderDataSet getHeaderDataSet(String aTabName);
//	public boolean isMultiDatasetWriter();
	
	public void execute(Map<String, Object> aParams) throws Exception;

}