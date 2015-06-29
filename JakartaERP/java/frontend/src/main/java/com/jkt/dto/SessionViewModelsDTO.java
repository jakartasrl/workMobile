package com.jkt.dto;

import lombok.Data;

/**
 * DTO para enviar datos al manager de sesiones y asi poder levantar datos
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class SessionViewModelsDTO {

	private String url;
	private String key;
	private String claseViewModel;
	
	public SessionViewModelsDTO(String url, String key, String claseViewModel) {
		super();
		this.url = url;
		this.key = key;
		this.claseViewModel = claseViewModel;
	}

	public SessionViewModelsDTO(String url, String claseViewModel) {
		super();
		this.url = url;
		this.claseViewModel = claseViewModel;
	}
	
}
