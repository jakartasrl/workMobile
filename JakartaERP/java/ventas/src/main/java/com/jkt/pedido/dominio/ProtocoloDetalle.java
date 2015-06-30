package com.jkt.pedido.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.IDetalle;
import com.jkt.dominio.PersistentEntity;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.laboratorio.dominio.ProtocoloVariable;

/**
 * <p>Es un detalle del protocolo.</p>
 * <p>Cada detalle sera un resultado deuna determinacion.</p>
 * 
 * <p>Representa las determinaciones que se har�n dentro de un protocolo</p>
 * <p>Se utilizar� para la gesti�n del laboratorio. Indica que se debe hacer y los resultados de los ensayos realizados.</p>
 * <p>Control de humedad</p>
 */
public class ProtocoloDetalle extends PersistentEntity implements IDetalle {

	private Protocolo protocolo;
	private Determinacion resultado;// TODO el resultado es una determinacion? 
//	private String resultado;
	private String comentario;
	private List<ProtocoloVariable> variables=new ArrayList<ProtocoloVariable>();

	public void agregarVariable(ProtocoloVariable protocoloVariable){
		if (!this.variables.contains(protocoloVariable)) {
			this.variables.add(protocoloVariable);
		}
	}
	
	public Protocolo getProtocolo() {
		return protocolo;
	}
	public void setProtocolo(Protocolo protocolo) {
		this.protocolo = protocolo;
	}
	public Determinacion getResultado() {
		return resultado;
	}
	public void setResultado(Determinacion resultado) {
		this.resultado = resultado;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	public List<ProtocoloVariable> getVariables() {
		return variables;
	}
	public void setVariables(List<ProtocoloVariable> variables) {
		this.variables = variables;
	}

	public String getNombreDeMaestro() {
		return "protocolo";
	}
	
}
