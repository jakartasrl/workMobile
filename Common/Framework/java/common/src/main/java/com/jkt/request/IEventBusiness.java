package com.jkt.request;

import com.jkt.excepcion.ExceptionDS;
import com.jkt.framework.writers.IHeaderDataSet;
import com.jkt.xmlreader.digester.IName;

public interface IEventBusiness extends IName{

	public String  getOperationClassName();

	public String  getNextView(int aResultStatus) throws ExceptionDS;
	public String  getNextViewExceptionDS();
	public String  getNextViewExceptionValidacion();
	public String  getRedirect();

	public String  getXMLWriter() throws ExceptionDS;
	public void    setXMLWriter(String aName);

	public boolean isReadOnly();
	public boolean haceForward();
	public boolean getCreateNewSesion();
	public boolean getInvalidate();

	public boolean getUsaJMS();

	public boolean getExecuteGarbageCollection();
	public IHeaderDataSet getHeaderDataSet(String aTabname);
;    
}