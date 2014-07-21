package com.jkt.excepcion;

import java.io.PrintStream;
import java.sql.SQLException;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:
 * @author
 * @version 1.0
 */

public class ExceptionDS extends RuntimeException {

	private Throwable ex;

	public ExceptionDS(String mensaje) {
		super(mensaje);
	}

	public ExceptionDS(Throwable e, String mensaje) {
		super(mensaje);
		ex = e;
	}

	public void printStackTrace(PrintStream print) {
		super.printStackTrace(print);
		if (ex != null) {
			print.println(" Desde :        ");
			ex.printStackTrace(print);
		}
	}

	public Throwable getCause() {
		return ex;
	}

	public static boolean esErrorLoqueo(Exception e){
		if(e != null && e instanceof SQLException && Math.abs(((SQLException) e).getErrorCode()) == 244)
			return true;

		if(e.getCause() != null && e.getCause() instanceof SQLException && Math.abs(((SQLException) e.getCause()).getErrorCode()) == 244)
			return true;

		return false;
	}
}