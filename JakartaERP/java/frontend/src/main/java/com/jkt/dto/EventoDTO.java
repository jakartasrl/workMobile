package com.jkt.dto;

import java.util.Date;

import lombok.Data;

@Data
public class EventoDTO {

	private long id;
	private String title;//: 'All Day Event',
	private String start;//: '2015-02-01',
	private String end;//: '2015-02-01',
	private String backgroundColor="green";//: 'green' ,
	private String borderColor="green";// : 'green'
	
	public EventoDTO(Long id, String title, String start, String end,
			String backgroundColor, String borderColor) {
		super();
		this.id=id;
		this.title = title;
		this.start = start;
		this.end = end;
		this.backgroundColor = backgroundColor;
		this.borderColor = borderColor;
	}

	
	
}
