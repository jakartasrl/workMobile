package com.jkt.viewModels;


import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;

import com.jkt.ov.TipoDeCambioOV;

@Data
public class TiposCambioVM {

	private List<TipoDeCambioOV> lsTipoDeCambio = new ArrayList<TipoDeCambioOV>();

	@Init
	@NotifyChange({"lsTipoDeCambio"})
	public void init(@ExecutionArgParam("lista") List<TipoDeCambioOV> coleccion){
		this.lsTipoDeCambio= coleccion;
	}
}
