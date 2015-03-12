package com.jkt.viewModels;

import org.apache.log4j.Logger;
import org.zkoss.bind.annotation.NotifyChange;

public abstract class ViewModel {

	protected static final Logger log = Logger.getLogger(ViewModel.class);
	
	public ViewModel() {
		super();
	}
	
	/**
	 * Este metodo no debe realizar nada, salvo que así lo desee.
	 * <p>El fin de este metodo es solamente actualizar todos los OV, declarando annotations sobre el metodo de tipo {@link NotifyChange}<p>
	 */
	public abstract void actualizar();

	/**
	 * @return String que debe ser igual a la annotation declarada en el metodo actualizar.
	 */
	protected abstract String retrieveMethod();
	
}