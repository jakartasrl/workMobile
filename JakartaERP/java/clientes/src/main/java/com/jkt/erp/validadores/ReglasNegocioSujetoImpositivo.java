package com.jkt.erp.validadores;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.varios.SujetoImpositivo;
import com.jkt.excepcion.ValidacionException;
import com.jkt.validadores.IValidador;
import com.jkt.varios.dominio.Pais;

public class ReglasNegocioSujetoImpositivo implements IValidador {

	public void validar(PersistentEntity entity) throws ValidacionException {
		SujetoImpositivo sujeto = (SujetoImpositivo) entity;

		Pais pais = sujeto.getDireccionLegal().getPais();
		if ("AR".equals(pais.getCodigo()) && "argentina".equals(pais.getDescripcion().toLowerCase())) {
			sujeto.setLocal(true);
		}

		
		if (sujeto.isLocal()) {
			//search in db if exists any subject with the same CUIT.
		}
	}

	/*
	 * 1. La property local se setea en true si el país de la dirección asociada
	 * es ARGENTINA.
	 * 
	 * 2. Si Local es false, se setea el cuit que esta asociado a Pais
	 * (Pais,getCuit());
	 * 
	 * 3. Si local es True, el cuit no debe existir en otro sujeto impositivo.
	 */
}
