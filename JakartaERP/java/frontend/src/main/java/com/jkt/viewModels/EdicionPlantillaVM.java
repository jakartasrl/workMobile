package com.jkt.viewModels;

import lombok.Data;

import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.zul.Window;

import com.jkt.ov.ItemsOV;

@Data
public class EdicionPlantillaVM {

	private PedidoVM pedidoVM;
	private ItemsOV item;
	
	@Init
	public void init(@ExecutionArgParam("item") ItemsOV ov, @ExecutionArgParam("vm") PedidoVM vm) {
		this.pedidoVM=vm;
		this.item=ov;
	}
	
//	@Command
//	public void guardarPlantilla(){
//		BindUtils.postGlobalCommand(null, null,pedidoVM.retrieveMethod(), null);
//	}
	
	@Command
	public void cerrarModal(@BindingParam("window") Window x) {
		x.detach();
	}
	
}
