package com.jkt.dominio;

import java.sql.Types;
import java.util.Properties;

import org.hibernate.type.EnumType;

/**
 * FIXME aun no logro mapear enums en xml.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class HibernateVarCharEnum extends EnumType {
	
	public void setParameterValues(Properties parameters) {
		parameters.setProperty(TYPE, "" + Types.VARCHAR);
		super.setParameterValues(parameters);
	}
}
