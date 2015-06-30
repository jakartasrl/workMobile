package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;

import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;

import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ProtocoloOV;

public class ProtocoloVM extends ViewModel implements IBasicOperations {
	
	private ProtocoloOV protocolo = new ProtocoloOV();
	
	@Init(superclass=true)
	public void init(){
		this.setTitulo("Protocolo");
	}
	
	@Override
	public void guardar() throws JakartaException {
		
	}

	@Override
	public void nuevo() throws JakartaException {
		
	}

	@Override
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
	
	}
	
	@Override
	@GlobalCommand("actualizar")
	@NotifyChange({"protocolo"})
	public void actualizar() {
			
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		
	}

	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}

}
