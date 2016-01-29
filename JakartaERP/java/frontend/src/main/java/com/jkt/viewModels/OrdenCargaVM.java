package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Random;

import lombok.Data;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zul.Window;

import com.jkt.dto.ClienteOV;
import com.jkt.dto.OrdenCargaDTO;
import com.jkt.excepcion.JakartaException;

@Data
public class OrdenCargaVM extends WorkMobileVM {

	private OrdenCargaDTO orden= new OrdenCargaDTO();	
	
	@Init(superclass=true)
	public void init(){
	
		Session sess = Sessions.getCurrent();
	    OrdenCargaDTO orden = (OrdenCargaDTO) sess.getAttribute("orden");
	    if(orden!=null){
	    	this.orden = orden;
	    }
		
	}
	
	@Override
	@GlobalCommand("actualizacion")
	@NotifyChange("orden")
	public void actualizar() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException {}

	@Override
	public void cancelarCustomizado() throws JakartaException {
	}

	@Override
	protected String retrieveMethod() {
		return "actualizacion";
	}
	
	@Command
	public void limpiar(){
		redirectToMyself();
	}
	
	@Command
	@NotifyChange({"orden"})
	public void buscarCodigoBarraOrdenCarga( @BindingParam("codigoBarraCompra") String codigoBarraCompra) {
		
		if(codigoBarraCompra.length()==1){
//		if(codigoBarraCompra.length()==13){
			
//			if("7790387014327".equals(codigoBarraCompra)){
			if("1".equals(codigoBarraCompra) || "5".equals(codigoBarraCompra) || "4".equals(codigoBarraCompra)  || "3".equals(codigoBarraCompra) || "2".equals(codigoBarraCompra)){
				orden.setCodigoBarraOrdenEncontrado(true);
				orden.setCodigoBarraOrdenNoEncontrado(false);

				Random rn = new Random();
			    int randomNum = rn.nextInt((1000 - 1) + 1) + 1;

				orden.setDescripcionOrdenActual("Orden "+randomNum);

				Session sess = Sessions.getCurrent();
				sess.setAttribute("orden", orden);
				
				Executions.sendRedirect("cliente.zul");
			}else{
				orden.setCodigoBarraOrdenEncontrado(false);
				orden.setCodigoBarraOrdenNoEncontrado(true);
			}
			
		}else{
			orden.setCodigoBarraOrdenEncontrado(false);
			orden.setCodigoBarraOrdenNoEncontrado(true);
		}
		
	}
	
	@Command
	public void continuar(){
		Executions.sendRedirect("cliente.zul");
	}
	
	@Command
	@NotifyChange({"orden"})
	public void cerrarOrden(){
		
		//final para tener alcance dentro del closure.
		//Al ser el metodo show de clase, las referencias a cualquier cosa fuera del alcance de sus lineas debe ser final.
		
		/*
		final OrdenCargaVM vm = this;
		
		Messagebox.show("¿Desea finalizar la orden?", "Orden de carga", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION, new org.zkoss.zk.ui.event.EventListener() {    
			public void onEvent(Event evt) throws InterruptedException, IOException {
				if (evt.getName().equals("onOK")) {
					Session sess = Sessions.getCurrent();
					sess.removeAttribute("orden");
					sess.setAttribute("orden", new OrdenCargaDTO());
					
					BindUtils.postGlobalCommand(null, null,vm.retrieveMethod(), null);

				}
			}
		});
		*/
		
		this.orden = new OrdenCargaDTO();
		Session sess = Sessions.getCurrent();
		sess.removeAttribute("orden");
		sess.setAttribute("orden", this.orden);
		
	}

	@Command
	public void mostrarArticulos(@BindingParam("cliente") ClienteOV cliente){
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
   		
		hashMap.put("vm", this);
   		hashMap.put("lista", cliente.getArticulos());
   		hashMap.put("descripcion", cliente.getDescripcion());
   		
   		Window window = (Window) Executions.createComponents("consulta-cliente.zul", null, hashMap);
   		window.doOverlapped();
	}
	
}
