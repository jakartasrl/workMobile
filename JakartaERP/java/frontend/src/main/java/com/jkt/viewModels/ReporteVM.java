package com.jkt.viewModels;

import lombok.Data;

import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.util.media.AMedia;

@Data
public class ReporteVM {

	private AMedia media;
	
	@Init
	public void init(@ExecutionArgParam("archivo") AMedia archivo){
		this.media=archivo;
	}
}
