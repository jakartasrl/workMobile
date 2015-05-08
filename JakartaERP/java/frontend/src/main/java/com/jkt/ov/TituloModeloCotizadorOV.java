package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.cotizador.dominio.CotizadorDet;
import com.jkt.cotizador.dominio.ModeloCotizador;
import com.jkt.erp.articulos.Producto;
import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode(callSuper=true, of={"codigo"})
public class TituloModeloCotizadorOV extends ObjectView {
	
	private int identificadorDetalle=0;
	
	private String codigo="", descripcion="";

	private Long idC;
	private String codigoC, descripcionC;
	
	private TituloModeloCotizadorOV tituloPadre;
	
	private List<TituloModeloCotizadorOV> titulosHijos=new ArrayList<TituloModeloCotizadorOV>();
	private DescriptibleOV concepto= new DescriptibleOV();
	private ModeloCotizador modeloCotizador;
	
	private int codigoInterno,codigoInternoPadre;
	private String tipo="T";//para diferenciar entre titulos y conceptos.TODO armar el mapeo de un char en DelphiAdapter...
	private CotizadorDet detalleDeConcepto;//campo transiente para mostrar la salida en la operacion de mostrar cotizador.
	private Producto producto;//campo transiente para mostrar la descripcion y demas datos a completar...

	public static TituloModeloCotizadorOV newConcepto(){
		TituloModeloCotizadorOV tituloModeloCotizadorOV = new TituloModeloCotizadorOV();
		tituloModeloCotizadorOV.setTipo("C");
		return tituloModeloCotizadorOV;
	}
	
}
