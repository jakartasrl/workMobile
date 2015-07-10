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
	private Date fecha=new Date();
	private Date fechaVencimiento=new Date();
	private String referencia;
	
	private long idVendedor; 		
	private long idCliente;
	private long idSucursal;		
	private Long idRepresentante;
	private List<DescriptibleOV> contactosReferencia =  new ArrayList<DescriptibleOV>();
	
	private List<ItemsOV> items=new ArrayList<ItemsOV>();
	protected List<ArchivoOV> archivos=new ArrayList<ArchivoOV>();
	
}
