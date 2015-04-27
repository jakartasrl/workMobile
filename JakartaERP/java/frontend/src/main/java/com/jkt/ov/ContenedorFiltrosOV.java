package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class ContenedorFiltrosOV extends ObjectView {

	private String clase;
	private List<FiltroOV> filtros=new ArrayList<FiltroOV>();
	
}
