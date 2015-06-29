package com.jkt.ov;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class ProtocoloOV extends ObjectView {
	
	private EquipoOV equipo;
	private long idEquipoOV;
	
	private PedidoOV pedido;
	private long idPedidoOV;
	
	private long idCliente;
	
	private Date fechaHoraEmision;
	private Date fechaHoraMuestra;
	
	private DescriptibleOV diagnostico = new DescriptibleOV();
	private long idDiagnostico;
	private String codDiagnostico;
	private String descDiagnostico;
	
	private String comentario;
	
	List<DeterminacionOV> determinaciones = new ArrayList<DeterminacionOV>();
		
}
