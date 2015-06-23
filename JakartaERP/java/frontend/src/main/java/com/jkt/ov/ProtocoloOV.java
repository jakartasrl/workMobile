package com.jkt.ov;

import java.util.Date;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class ProtocoloOV extends ObjectView {
	
	private LaboratorioOV laboratorio;
	private EquipoOV equipo;
	private PedidoOV pedido;
	
	private long idCliente;
	private long idSucursal;
	
	private Date fechaHoraMuestra;
		
}
