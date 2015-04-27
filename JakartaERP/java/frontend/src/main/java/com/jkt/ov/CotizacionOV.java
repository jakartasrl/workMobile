package com.jkt.ov;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode(callSuper=true,of={"nro"})
public class CotizacionOV extends ObjectView {
	
	private String nroCotizacion;
	private Date fecha;
	private Date fechaVencimiento;
	private String referencia;
	
	private long idVendedor; 		
	private long idCliente;
	private long idSucursal;		
	private Long idRepresentante;
	private Long idContactoReferencia;
	
	private List<ItemsOV> items=new ArrayList<ItemsOV>();
	protected List<ArchivoOV> archivos=new ArrayList<ArchivoOV>();
	
}
