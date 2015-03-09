package com.jkt.viewModels;

import org.zkoss.bind.annotation.Command;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Window;

/**
 * ViewModel para los helpers, en este caso solamente de los Presupuestos.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class HelperVM {

	@Command
	public void helperPresupuestos() {
		Window window = (Window) Executions.createComponents("/pantallas/pedido/helpPresupuesto.zul", null, null);
		window.doModal();
	}

}
