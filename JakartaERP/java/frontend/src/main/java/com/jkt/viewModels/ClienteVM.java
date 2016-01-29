package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
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

import com.jkt.dto.OrdenCargaDTO;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.DescriptibleOV;

@Data
public class ClienteVM extends WorkMobileVM {

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
	
	
	String [] nombres = {"Motorola","Nexo","Agfa","Jakarta","Motorola","Nexo","Agfa","Gatorade","Motorola","DELL","Agfa","ITR"};
	
	@Command
	@NotifyChange({"orden"})
	public void buscarCodigoBarraOrdenCarga( @BindingParam("codigoBarraCompra") String codigoBarraCliente) {
		
//		if(codigoBarraCliente.length()==13){
		if(codigoBarraCliente.length()==1){
			
			if("1".equals(codigoBarraCliente)){
//			if("7798123690231".equals(codigoBarraCliente)){
				orden.setCodigoBarraClienteEncontrado(true);
				orden.setCodigoBarraClienteNoEncontrado(false);


				Random rn = new Random();
			    int randomNum = rn.nextInt((5 - 1) + 1) + 1;
				
				orden.setDescripcionClienteActual(nombres[randomNum]);

				Session sess = Sessions.getCurrent();
				sess.setAttribute("orden", orden);
				
				Executions.sendRedirect("articulo.zul");
				
			}else{
				orden.setCodigoBarraClienteEncontrado(false);
				orden.setCodigoBarraClienteNoEncontrado(true);
			}
			
		}else{
			orden.setCodigoBarraClienteEncontrado(false);
			orden.setCodigoBarraClienteNoEncontrado(true);
		}
		
	}
	
	@Command
	public void continuar(){
		Executions.sendRedirect("articulo.zul");
	}
	
	@Command
	public void volverOrden(){
		Executions.sendRedirect("index.zul");
	}

	@Command
	@NotifyChange("orden")
	public void cerrarCliente(){
		
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
   		
		hashMap.put("vm", this);
   		hashMap.put("lista", orden.getArticulos());
   		
   		Window window = (Window) Executions.createComponents("popup-cliente.zul", null, hashMap);
   		window.doOverlapped();
		
		
//		ClienteOV cliente = new ClienteOV();
//		
//		cliente.setCodigo("MLA");
//		cliente.setDescripcion("Morotola");
//		
//		cliente.setCodigoBarra(orden.getCodigoBarraCliente());
//		cliente.setArticulos(orden.getArticulos());
//		orden.getClientes().add(cliente);

//		limpiarCliente();
	}
	
	protected void limpiarCliente(){
		orden.setArticulos(new ArrayList<DescriptibleOV>());
		orden.setCodigoBarraCliente("");
		orden.setDescripcionClienteActual("---");
		orden.setCodigoBarraClienteEncontrado(false);
		orden.setCodigoBarraClienteNoEncontrado(false);
	}
	
}
