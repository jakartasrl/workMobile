package com.jkt.transformers;

import java.io.IOException;
import java.io.ObjectOutputStream;

import javax.servlet.ServletOutputStream;

import com.jkt.excepcion.JakartaException;

public class WebTransformer extends Transformer {

	private ServletOutputStream servletOutputStream;

	@Override
	protected void update(Notificacion arg1) {
		try{
			ObjectOutputStream oos = new ObjectOutputStream(servletOutputStream);
			oos.writeObject(arg1.getParameter());
			oos.close();
		}catch(IOException e){
			throw new RuntimeException(e);
		}
	}

	@Override
	public void write() throws JakartaException {
		//do nothing
	}

	@Override
	public void setup(ServletOutputStream outputStream, String outputName)throws JakartaException {
		//outputName no me interesa
		servletOutputStream=outputStream;
	}

}


