package com.jkt.viewModels;

import java.io.IOException;

import lombok.Data;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.Init;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zul.Messagebox;

import com.jkt.ov.UserOV;


@Data
public abstract class WorkMobileVM extends ViewModel {

	protected static final String POSITION = "middle_center";

	private UserOV credenciales;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Command
	public void salir(){
		
		Messagebox.show("¿Desea realmente salir?", "Salir", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION, new org.zkoss.zk.ui.event.EventListener() {    
			public void onEvent(Event evt) throws InterruptedException, IOException {
				if (evt.getName().equals("onOK")) {
					Session sess = Sessions.getCurrent();
					sess.removeAttribute("userCredential");
					sess.removeAttribute("ventanas");
					sess.removeAttribute("orden");
					
					Executions.sendRedirect("login.zul");
				}
			}
		});
	    	
	}
	
	@Init
	public void init(){
		Session sess = Sessions.getCurrent();
		credenciales = (UserOV) sess.getAttribute("userCredential");
		if(credenciales==null){
			Executions.sendRedirect("login.zul");
		}
	}
}
