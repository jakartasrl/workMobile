package com.jkt.ov;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode(callSuper=true,of={"nro"})
public abstract class ComprobanteOV extends ObjectView {
	
	private String nroPresupuesto;
	private String letra;
	private String lugarEmision;
	private String nro;
	private boolean anulado = false;
	private Date fecha;

	private Long idCliente;
	private Long idSucursal;
	private Long idListaPrecio;
	private String referencia;

	private Long idVendedor;
	private Long idRepresentante;
	private Long idContactoReferencia;
	private List<NotaOV> notas=new ArrayList<NotaOV>();	

	private List<ItemsOV> items=new ArrayList<ItemsOV>();
}
