package com.jkt.cotizador.reglasDeNegocio;

import java.util.Random;

import com.jkt.dominio.Cotizacion;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionException;
import com.jkt.validadores.IValidador;

public class ReglaParaCotizacion implements IValidador {

	public void validar(PersistentEntity entity) throws ValidacionException {
		Cotizacion c=(Cotizacion) entity;
		
		if (c.getId()>0) {//es una modificacion, solo puedo adjuntar archivos.Es una validacion rara esta, creo que seria antes del adapter...
			
		}else{
//			nueva cotizacion.
			Random rnd = new Random();
			c.setNro(rnd.nextInt());
			c.setEstado(Cotizacion.Estado.PENDIENTE);
		}
		
	}

}
