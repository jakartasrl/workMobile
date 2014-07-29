package com.jkt.transformers;

import java.io.IOException;

import javax.servlet.ServletOutputStream;

import com.jkt.excepcion.JakartaException;
import com.jkt.framework.writers.AbsWriter;
import com.jkt.framework.writers.XMLStreamMaker;

public class EmptyTransformer extends Transformer {

	/*
	 * Por defecto se setea el writer simple.
	 */
	private AbsWriter writer = new XMLStreamMaker();
	
	public AbsWriter getWriter() {
		return writer;
	}

	public void setWriter(AbsWriter writer) {
		this.writer = writer;
	}
	@Override
	protected void update(Notificacion arg1) {
		//do nothing
	}

	@Override
	public void write() throws JakartaException {
		//do nothing
		try {
			getWriter().write();
			getWriter().writeEndTag();
		} catch (IOException e) {
			throw new JakartaException("Ocurrio un error al escribir en la salida.");
		}
	}

	@Override
	public void setup(ServletOutputStream outputStream) throws JakartaException {
		//do nothing
		XMLStreamMaker xmlStreamMaker = new XMLStreamMaker();
		xmlStreamMaker.setStream(outputStream);
		this.setWriter(xmlStreamMaker);
		try {
			getWriter().writeStartTag();
		} catch (IOException e) {
		}

		
		
	}

}
