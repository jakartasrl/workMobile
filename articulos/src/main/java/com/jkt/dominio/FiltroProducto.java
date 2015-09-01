package com.jkt.dominio;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class FiltroProducto extends PersistentEntity {

	private String codigo;
	private String descripcion;
	private String oidTipoProducto;
	private List<DetalleCaracteristicaProducto> detallesTipoProducto = new ArrayList<DetalleCaracteristicaProducto>();
	
	private String certificado;
	private String session;
	private String sucursal;
	private String empleado;
	
}
