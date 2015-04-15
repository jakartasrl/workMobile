package com.jkt.ov;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode(callSuper=true)
public class PedidoDocumentacionOV extends DescriptibleOV {

	
	private Boolean entregado=Boolean.FALSE;
	private Long idDocumento;

	public PedidoDocumentacionOV(){
		this.setId(0);
	}
	
}
