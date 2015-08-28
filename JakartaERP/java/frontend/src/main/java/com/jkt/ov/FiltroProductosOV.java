package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class FiltroProductosOV extends ObjectView {
	
	private String codigo;
	private String descripcion;
	private String oidTipoProducto;
	private List<DetalleCaracteristicaProductoOV> detallesTipoProducto = new ArrayList<DetalleCaracteristicaProductoOV>();
	
}
