package com.jkt.viewModels;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.Init;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;

public class ToolBarVM {

	private String elemento="Pedido";
	
	public String getElemento() {
		return elemento;
	}

	public void setElemento(String elemento) {
		this.elemento = elemento;
	}

	@Init	
	public void init(){
	}
	
	@Command
	public void showConfiguracion() {
//		Window window = (Window) Executions.createComponents("/pantallas/configuracion/configuracion.zul", null, null);
//		window.doModal();
	}
	
	@Command
	public void print() throws Exception {
//		Messagebox.show("Question is pressed. Are you sure?", "Question", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
//		Window window = (Window) Executions
//		.createComponents("/pantallas/conciliacion/print.zul", null, null);
//		window.doModal();
	}

	@Command
	public void logOut(){
		Session sess = Sessions.getCurrent();
        sess.removeAttribute("userCredential");
        Executions.sendRedirect("/login.zul");
	}
	
}
