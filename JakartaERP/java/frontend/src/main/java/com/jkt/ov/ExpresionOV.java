package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class ExpresionOV extends ObjectView {
	
	private String expresion;
	private List<VariableOV>  variables=new ArrayList<VariableOV>();

	
}
