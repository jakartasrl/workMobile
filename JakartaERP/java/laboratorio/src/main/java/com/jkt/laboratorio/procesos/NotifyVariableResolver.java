package com.jkt.laboratorio.procesos;

import java.util.Observer;
import java.util.Observable;


import net.sourceforge.jeval.VariableResolver;
import net.sourceforge.jeval.function.FunctionException;


public class NotifyVariableResolver extends Observable implements VariableResolver {
	private Observer obs;
	
	public NotifyVariableResolver (Observer aObs){
	   obs = aObs;	
	}
	public String resolveVariable(String arg0) throws FunctionException {
		obs.update(this, arg0);
		return "1";
	}

}
