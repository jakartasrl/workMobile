package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class DetalleCaracteristicaProductoOV extends ObjectView {

	private String oid, codigo, descripcion, tipo, longitud;
	private List<DetalleCaracteristicaProductoOV> detalles=new ArrayList<DetalleCaracteristicaProductoOV>();
	
}
