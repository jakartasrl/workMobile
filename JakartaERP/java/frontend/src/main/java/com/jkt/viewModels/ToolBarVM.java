package com.jkt.viewModels;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Window;

public class ToolBarVM {

	@Init	
	public void init(){
	}
	
	@Command
	public void showConfiguracion() {
		Window window = (Window) Executions.createComponents("/pantallas/configuracion/configuracion.zul", null, null);
		window.doModal();
	}
	
	@Command
	public void print() throws Exception {
		Window window = (Window) Executions
		.createComponents("/pantallas/conciliacion/print.zul", null, null);
		window.doModal();
	}

}
