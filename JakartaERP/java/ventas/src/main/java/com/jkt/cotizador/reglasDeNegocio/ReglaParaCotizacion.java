package com.jkt.cotizador.reglasDeNegocio;

import java.util.Random;

import com.jkt.dominio.Cotizacion;
import com.jkt.dominio.Empresa;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ReglaDeNegocioException;
import com.jkt.excepcion.ValidacionException;
import com.jkt.operaciones.ReglaDeNegocio;
import com.jkt.validadores.IValidador;

public class ReglaParaCotizacion extends ReglaDeNegocio {

	public void ejecutar(PersistentEntity entity) throws ReglaDeNegocioException {

		Cotizacion c=(Cotizacion) entity;
		if (c.getId()>0) {//es una modificacion, solo puedo adjuntar archivos.Es una validacion rara esta, creo que seria antes del adapter...
			
		}else{
//			nueva cotizacion.
			Random rnd = new Random();
			int nextInt = rnd.nextInt();
			c.setNro(nextInt<1?nextInt*-1:nextInt);
			c.setEstado(Cotizacion.Estado.PENDIENTE.toString());
		}
	}

}
