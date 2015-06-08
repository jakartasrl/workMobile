package com.jkt.viewModels;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.jsoup.Jsoup;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.ov.DetalleCotizacionOV;
import com.jkt.ov.ListDetalleCotizacionOV;

@Data
public class SelectorItemsVM {

	private CotizadorVM vm;
	private List<DetalleCotizacionOV> items =  new ArrayList<DetalleCotizacionOV>();
	
	@Init
	public void init(@ExecutionArgParam("vm") CotizadorVM vm ){
		this.vm=vm;
		
		items = ((ListDetalleCotizacionOV)Operaciones.ejecutar("TraerItemsParaCotizar", ListDetalleCotizacionOV.class)).getList();
		
		for (DetalleCotizacionOV detalleCotizacionOV : items) {
			
			detalleCotizacionOV.setDescripcion(Jsoup.parse(detalleCotizacionOV.getDescripcion()).text());
			
			if(detalleCotizacionOV.getEstado()==1){
				detalleCotizacionOV.setEstadoDescripcion("Pendiente de Cotizar");
			}else if(detalleCotizacionOV.getEstado()==2){
				detalleCotizacionOV.setEstadoDescripcion("Cotizado pero No Autorizado");
			}else if(detalleCotizacionOV.getEstado()==3){
				detalleCotizacionOV.setEstadoDescripcion("Autorizado");
			}else if(detalleCotizacionOV.getEstado()==4){
				detalleCotizacionOV.setEstadoDescripcion("Rechazado");
			}
		}
		
	}

	@Command
	public void obtenerElemento(@BindingParam("objeto") DetalleCotizacionOV actual, @BindingParam("window") Window x ){
		
		if(actual.getEstado()==1){
			vm.getItemSelected().setId(actual.getId());
			vm.cargarItem();
		}else{
			vm.getItemSelected().setId(actual.getId());
			vm.cargarItemACotizar();
		}
		
		x.detach();
	}
	
	@Command
	public void cerrarModal(@BindingParam("window") Window x) {
		x.detach();
	}
	
}
