package com.jkt.ov;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class PedidoDocumentacionOV extends DescriptibleOV {

	
	private Boolean entregado=Boolean.FALSE;
	private Long idDocumento;

	public PedidoDocumentacionOV(){
		this.setId(0);
	}
	
}
