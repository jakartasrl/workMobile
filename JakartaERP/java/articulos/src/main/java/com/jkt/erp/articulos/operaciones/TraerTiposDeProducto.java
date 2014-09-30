package com.jkt.erp.articulos.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.CaracteristicaProducto;
import com.jkt.erp.articulos.TipoProducto;
import com.jkt.erp.articulos.TipoProductoDet;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;

public class TraerTiposDeProducto extends Operation {

	private static final String OID = "oid".toUpperCase();
	private static final String WRITER_CARACTERISTICAS = "caracteristicas";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(OID));
		
		TipoProducto tipoDeProducto = (TipoProducto) obtener(TipoProducto.class, (String)aParams.get(OID));
		
		List<TipoProductoDet> detalles = tipoDeProducto.getCaracteristicas();

		TipoProductoDet detalle;
		CaracteristicaProducto caracteristica;
		
		for (PersistentEntity persistentEntity : detalles) {
			detalle=(TipoProductoDet) persistentEntity;
			caracteristica = detalle.getCaracteristica();
			if (caracteristica!=null) {
				notificarObjecto(Notificacion.getNew(WRITER_CARACTERISTICAS, caracteristica));
			}
		}
		
	}

}
