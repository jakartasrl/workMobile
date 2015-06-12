package com.jkt.ov;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.Range;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.cotizador.dominio.Cotizador;
import com.jkt.cotizador.dominio.CotizadorDet;
import com.jkt.cotizador.dominio.ModeloCotizador;
import com.jkt.erp.articulos.Producto;
import com.jkt.varios.dominio.Moneda;
import com.jkt.varios.dominio.UnidadMedida;
import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode(callSuper=true)
public class TituloModeloCotizadorOV extends ObjectView {
	
	private long idNuevo=0;//siempre va a ser un elemento nuevo
	
	private Boolean forCut=Boolean.FALSE;
	
	private long idComponenteValor=0;
	
	private int identificadorDetalle=0;
	
	private String codigo="", descripcion="";

	private Long idC;
	private String codigoC, descripcionC;
	
	private TituloModeloCotizadorOV tituloPadre;
	
	private List<TituloModeloCotizadorOV> titulosHijos=new ArrayList<TituloModeloCotizadorOV>();
	private DescriptibleOV concepto= new DescriptibleOV();
//	private ModeloCotizador modeloCotizador;
	
	private int codigoInterno,codigoInternoPadre;
	private String tipo="T";//para diferenciar entre titulos y conceptos.TODO armar el mapeo de un char en DelphiAdapter...
//	private CotizadorDet detalleDeConcepto;//campo transiente para mostrar la salida en la operacion de mostrar cotizador.
//	private Producto producto;//campo transiente para mostrar la descripcion y demas datos a completar...

	public static TituloModeloCotizadorOV newConcepto(){
		TituloModeloCotizadorOV tituloModeloCotizadorOV = new TituloModeloCotizadorOV();
		tituloModeloCotizadorOV.setTipo("C");
		return tituloModeloCotizadorOV;
	}

	public static TituloModeloCotizadorOV newTitulo(){
		TituloModeloCotizadorOV tituloModeloCotizadorOV = new TituloModeloCotizadorOV();
		tituloModeloCotizadorOV.setTipo("T");
		tituloModeloCotizadorOV.setCodigo("nuevo");
		tituloModeloCotizadorOV.setDescripcion("Nuevo descripcion titulo");
		return tituloModeloCotizadorOV;
	}
	
	
	private DescriptibleOV producto= new DescriptibleOV();
	private Long idProducto;
	private String codProducto;
	private String descProducto;
	
	private DescriptibleOV detalleDeConcepto = new DescriptibleOV();
	
	private DescriptibleOV moneda = new DescriptibleOV();
	private Long idMoneda;
	private String codMoneda;
	private String descMoneda;
	
	private double precio;
	private Date fechaPrecioCosto;
	
//	private Cotizador cotizador;
	private double cantidad;
	
	private DescriptibleOV unidadMedida = new DescriptibleOV();
	private Long idUnidadMedida;
	private String codUnidadMedida;
	private String descUnidadMedida;
	
	private double precioUnitario;
	
	@Range(min=0,max=500, message="El mark up  debe estar entre 1 y 500")
	private double markUp;
	
	private double costoEn;
	
	private double importeVenta;
	
}
