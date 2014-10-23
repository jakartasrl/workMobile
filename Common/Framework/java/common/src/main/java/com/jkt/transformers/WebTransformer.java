package com.jkt.transformers;

import java.io.IOException;
import java.io.ObjectOutputStream;

import javax.servlet.ServletOutputStream;

import com.jkt.excepcion.JakartaException;

public class WebTransformer extends Transformer {

//	private ServletOutputStream servletOutputStream;
	private ObjectOutputStream oos;
	
	@Override
	protected void update(Notificacion arg1) {
		try{
			oos.writeObject(arg1.getParameter());
		}catch(IOException e){
			throw new RuntimeException(e);
		}
	}

	@Override
	public void write() throws JakartaException {
		try {
			oos.close();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void setup(ServletOutputStream outputStream, String outputName)throws JakartaException {
//		servletOutputStream=outputStream;
		try {
			oos = new ObjectOutputStream(outputStream);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

}


