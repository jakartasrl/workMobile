package com.jkt.cotizador.validadores;

import java.util.Random;

import com.jkt.dominio.Cotizacion;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.operaciones.ValidacionDeNegocio;

public class ValidadorCotizacion extends ValidacionDeNegocio {

	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		Cotizacion c=(Cotizacion) entity;
		if (c.getId()>0) {//es una modificacion, solo puedo adjuntar archivos.Es una validacion rara esta, creo que seria antes del adapter...
			
		}else{
//			nueva cotizacion.
			Random rnd = new Random();
			
			Random rn = new Random();
			int maximum=2000000;
			int minimum=1;
			int range = maximum - minimum + 1;
			int randomNum =  rn.nextInt(range) + minimum;
			
//			int nextInt = rnd.nextInt();
//			c.setNro((nextInt<1?nextInt*-1:nextInt));
			c.setNro(randomNum);
			c.setEstado(Cotizacion.Estado.PENDIENTE.toString());
		}
	}

}
