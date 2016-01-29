package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;

import lombok.Data;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zk.ui.util.Clients;

import com.jkt.dto.OrdenCargaDTO;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.DescriptibleOV;

@Data
public class ArticuloCodigoVM extends WorkMobileVM {

	private OrdenCargaDTO orden= new OrdenCargaDTO();	
//	private List<DescriptibleOV> articulos = new ArrayList<DescriptibleOV>();
	
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
	@NotifyChange("productos")
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
	public void buscarCodigoBarraOrdenCarga( @BindingParam("codigoBarraCompra") String codigoBarraCliente) {
		
			if("1".equals(codigoBarraCliente)){
				orden.setCodigoBarraArticuloEncontrado(true);
				orden.setCodigoBarraArticuloNoEncontrado(false);
				orden.getArticulos().add(0, nuevoArticulo());
				
				Session sess = Sessions.getCurrent();
				sess.setAttribute("orden", orden);
				
				orden.setCodigoBarraArticulo("");
				orden.setCodigoBarraArticuloEncontrado(false);
				orden.setCodigoBarraArticuloNoEncontrado(false);
				
			}else{
				orden.setCodigoBarraArticuloEncontrado(false);
				orden.setCodigoBarraArticuloNoEncontrado(true);
			}
			
	}
	
	private DescriptibleOV nuevoArticulo() {
		DescriptibleOV articulo = new DescriptibleOV();
		
		articulo.setCodigo(String.valueOf(orden.getArticulos().size()));
		articulo.setDescripcion("Descripcion");
		
		return articulo;
	}

	@Command
	public void volverCliente(){
		Executions.sendRedirect("cliente.zul");
	}

	@Command
	public void cargarArticulo(){
		orden.setCodigoBarraArticulo("");
		Executions.sendRedirect("articulo.zul");
	}
	
}
