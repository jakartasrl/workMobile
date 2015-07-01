package com.jkt.ov;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProtocoloOV extends DescriptibleOV {
	
	private EquipoOV equipo;
	private long idEquipo;
	
	private PedidoOV pedido;
	private long idPedido;
	
	private long idCliente;
	private long idLab;
	
	private Date fechaHoraEmision = new Date() ;
	private Date fechaHoraMuestra = new Date() ;
	
	private DescriptibleOV diagnostico = new DescriptibleOV();
	private long idDiagnostico;
	private String codDiagnostico;
	private String descDiagnostico;
	
	private String comentario;
	private String comentarioDiagnostico;
	
	List<DeterminacionOV> determinaciones = new ArrayList<DeterminacionOV>();
	
	private String ordenTrabajo;
		
}
