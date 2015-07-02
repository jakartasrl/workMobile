package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.jkt.dominio.IDetalle;
import com.jkt.dominio.PersistentEntity;

/**
 * <p>Es un detalle del protocolo.</p>
 * <p>Cada detalle sera un resultado deuna determinacion.</p>
 * 
 * <p>Representa las determinaciones que se har�n dentro de un protocolo</p>
 * <p>Se utilizar� para la gesti�n del laboratorio. Indica que se debe hacer y los resultados de los ensayos realizados.</p>
 * <p>Control de humedad</p>
 */
@Data
public class ProtocoloDetalle extends PersistentEntity implements IDetalle {

	private Protocolo protocolo;
	private Determinacion resultado;// TODO el resultado es una determinacion? 
//	private String resultado;
	private String comentario;
	private List<ProtocoloVariable> variables=new ArrayList<ProtocoloVariable>();
	
	private String descDeterminacion;
	private String descMetodo;
	
	private long idMetodoUtilizado;
	
	public void agregarVariable(ProtocoloVariable protocoloVariable){
		if (!this.variables.contains(protocoloVariable)) {
			this.variables.add(protocoloVariable);
		}
	}
	
	public String getNombreDeMaestro() {
		return "protocolo";
	}
	
}
