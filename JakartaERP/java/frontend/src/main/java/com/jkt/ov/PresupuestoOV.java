package com.jkt.ov;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.pedido.dominio.Pedido;
import com.jkt.view.ObjectView;

/**
 * <p>ObjectView correspondiente a la entidad {@link Pedido}</p>
 * <p>Mapea los atributos que se envian y generarán o actualizarán un {@link Pedido}</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
@EqualsAndHashCode(callSuper=true,of={"nro"})
public class PresupuestoOV extends ObjectView {

	private String nroCotizacion;
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
	private List<FormaFacturacionOV> facturaciones=new ArrayList<FormaFacturacionOV>();
	
}
