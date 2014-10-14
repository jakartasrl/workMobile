package com.jkt.cotizador.operaciones;

import java.util.Map;

import com.jkt.cotizador.dominio.ModeloCotizador;
import com.jkt.cotizador.dominio.TituloConcepto;
import com.jkt.operaciones.Operation;

/**
 * <p><b>Recupera un cotizador previamente dado de alta.</b></p>
 * <p><b>Los pasos que realiza, en resumen, son los siguientes:</b></p>
 * 
 * <p>1-Recupera el cotizador</p>
 * <p>2-Recupera el modelo de cotizador</p>
 * <p>3-Renderiza modelo de cotizador (dibuja el arbol)</p>
 * <p>4-Mapea cada concepto del modelo con los detalles del cotizador guardado previamente</p>
 * <p>5-Notifica el arbol completo, y en cada nodo, se verán los datos del cotizador.Por presupuesto, un detalle(unidades en cantidad, precios, moneda, unidad de medida, etc)</p>
 * 
 * @see ModeloCotizador
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerCotizador extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {

	}

}
