package com.jkt.dto;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.apache.commons.lang.StringUtils;

import com.jkt.ov.DescriptibleOV;

/**
 * Este DTO contiene la informacion de todo el workflow de la aplicacion. Sirve
 * para todas las ventanas, será enviado por parametros o depositado en session
 * para recordar opciones y datos cargados con anterioridad.
 * 
 * @author LeoSuarez
 *
 */
@Data
public class OrdenCargaDTO {

	//orden de carga
	private static final String VACIO = "---";
	private String codigoBarraOrden = StringUtils.EMPTY;
	private String descripcionOrdenActual = VACIO;

	private boolean codigoBarraOrdenEncontrado = false;
	private boolean codigoBarraOrdenNoEncontrado = false;

	private boolean ordenCerrada;
	
	
	//cliente
	private String codigoBarraCliente = StringUtils.EMPTY;
	private String descripcionClienteActual = VACIO;
	
	private boolean codigoBarraClienteEncontrado = false;
	private boolean codigoBarraClienteNoEncontrado = false;

	private ClienteOV cliente = new ClienteOV();
	private boolean clienteCerrado = true;
	
//	meter una lista con un dto e ir agregandolo aca...
	
	//articulo
	private String codigoBarraArticulo = StringUtils.EMPTY;
	private String descripcionArticuloActual = VACIO;
	
	private boolean codigoBarraArticuloEncontrado = false;
	private boolean codigoBarraArticuloNoEncontrado = false;
	
	private List<DescriptibleOV> articulos = new ArrayList<DescriptibleOV>();

	/*
	 * Datos a persistir.
	 */
	private List<ClienteOV> clientes = new ArrayList<ClienteOV>();
	
}
