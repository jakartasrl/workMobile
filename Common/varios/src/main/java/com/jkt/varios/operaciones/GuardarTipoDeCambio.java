package com.jkt.varios.operaciones;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.TipoDeCambio;

/**
 * <p>Guarda un tipo de cambio si no existe ya uno para la misma fecha</p>
 * <p>Actualiza un tipo de cambio si para la misma fecha y moneda ya existia un registro.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class GuardarTipoDeCambio extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		List tiposDeCambio = this.recuperarObjeto(aParams);
		TipoDeCambio tipoDeCambio;
		for (Object object : tiposDeCambio) {
			tipoDeCambio=(TipoDeCambio) object;
			
			//Verificar si es nuevo o no.
			Query hql = crearHQL("from TipoDeCambio t where t.fecha=:fecha and t.moneda.id=:moneda");
			hql.setParameter("fecha", tipoDeCambio.getFecha());
			hql.setParameter("moneda", tipoDeCambio.getMoneda().getId());
			hql.setMaxResults(1);
			
			TipoDeCambio tipoRecuperado = (TipoDeCambio) hql.uniqueResult();
			if (tipoRecuperado==null) {
				guardar(tipoDeCambio);
			}else{
				tipoRecuperado.setCotizacion(tipoDeCambio.getCotizacion());
			}
			
		}
	}

}

