package com.jkt.ov;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

import com.jkt.cotizador.dominio.CotizadorDet;
import com.jkt.dominio.CotizacionDet;
import com.jkt.varios.dominio.Moneda;

@Data
public class CotizadorOV extends DescriptibleOV {
	
	private String nro;
	private Date fecha=new Date();
	private boolean revisado;
	private CotizacionDet item;
	private String usuarioCreacion;
	private Moneda monedaExpresada;
	private String usuarioRevision;
	private Date fechaRevision;
	private ModeloCotizadorOV modelo;
	private String codigoEstado;
	private List<CotizadorDet> detalles=new ArrayList<CotizadorDet>();

}
