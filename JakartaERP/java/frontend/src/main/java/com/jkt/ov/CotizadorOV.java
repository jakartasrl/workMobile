package com.jkt.ov;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=true)
public class CotizadorOV extends DescriptibleOV {
	
	private String nro;
	private Date fecha=new Date();
	private boolean revisado;
//	private CotizacionDet item;
	private long idCotizacionDet;
	private String usuarioCreacion;
//	private Moneda monedaExpresada;
	private long idMoneda;
	private String usuarioRevision;
	private Date fechaRevision;
//	private ModeloCotizadorOV modelo;
	private long idModelo;
	private String codigoEstado;
	private List<TituloModeloCotizadorOV> detalles=new ArrayList<TituloModeloCotizadorOV>();

}
