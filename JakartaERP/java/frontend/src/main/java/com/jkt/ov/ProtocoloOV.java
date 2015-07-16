package com.jkt.ov;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

import org.apache.commons.lang.StringUtils;

@Data
public class ProtocoloOV extends DescriptibleOV {
	
	private EquipoOV equipo;
	private long idEquipo;
	private String nombreEquipo;
	
	private PedidoOV pedido;
	private long idPedido;
	private String nroPedido;
	
	private long idCliente;
	private String codCliente;
	
	private long idLab;
	
	private long idSucursal;
	private String codSucursal;
	private String descripcionCompleta;
	
	private Date fechaHoraEmision = new Date();
	private Date fechaHoraMuestra = new Date(); 
	private Date fechaAprobacion = new Date();
	private Date fechaFinalizacion = new Date();
	
	private DescriptibleOV diagnostico = new DescriptibleOV();
	private long idDiagnostico;
	private String codDiagnostico;
	private String descDiagnostico;
	
	private String comentario;
	private String comentarioDiagnostico;
	
	List<DeterminacionOV> determinaciones = new ArrayList<DeterminacionOV>();
	
	private String ordenTrabajo=StringUtils.EMPTY;
	
	private long idUsuario;
	private int estado;
	
	private long idUsuarioIngresoResultado;
	private long idUsuarioIngresoAprobacion;
	private long idUsuarioFinalizado;
	
	private String nombreUsuarioIngresoResultado;

}
