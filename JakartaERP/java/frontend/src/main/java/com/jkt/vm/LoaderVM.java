package com.jkt.vm;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.zul.Window;

public class LoaderVM {

	private String campo;

	public String getCampo() {
		return campo;
	}

	public void setCampo(String campo) {
		this.campo = campo;
	}

	@Command
	public void load(@BindingParam("win") Window x) {
		x.detach();
	}
}
