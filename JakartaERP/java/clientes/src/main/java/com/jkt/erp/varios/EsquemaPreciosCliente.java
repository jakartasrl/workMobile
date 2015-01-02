package com.jkt.erp.varios;

import java.util.Date;

//import com.jkt.dominio.ListaPrecios;
import com.jkt.dominio.PersistentEntity;

public class EsquemaPreciosCliente extends PersistentEntity {

	private Cliente cliente;
	private Date fechaVigencia;
//	private ListaPrecios listaPrecios;
	private EsquemaBonificacion esquemaBonificacion;

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

//	public ListaPrecios getListaPrecios() {
//		return listaPrecios;
//	}
//
//	public void setListaPrecios(ListaPrecios listaPrecios) {
//		this.listaPrecios = listaPrecios;
//	}

	public EsquemaBonificacion getEsquemaBonificacion() {
		return esquemaBonificacion;
	}

	public void setEsquemaBonificacion(EsquemaBonificacion esquemaBonificacion) {
		this.esquemaBonificacion = esquemaBonificacion;
	}

	public Date getFechaVigencia() {
		return fechaVigencia;
	}

	public void setFechaVigencia(Date fechaVigencia) {
		this.fechaVigencia = fechaVigencia;
	}

}
