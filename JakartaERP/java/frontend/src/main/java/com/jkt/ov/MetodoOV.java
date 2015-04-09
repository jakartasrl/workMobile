package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class MetodoOV extends ObjectView {
	
	private String        		metodo;
	private DeterminacionOV 	determinacion = new DeterminacionOV();
	
	private List<ValorEsperadoOV> valoresEsperados = new ArrayList<ValorEsperadoOV>();
	
}
