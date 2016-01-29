package com.jkt.viewModels;

import java.util.List;

import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;

import com.jkt.dto.OrdenCargaDTO;
import com.jkt.ov.DescriptibleOV;

/**
 * Reutiliza la mayoria de codigo, en mas o menos cantidad, para mostrar la lista de articulos x cliente sucursal.
 * 
 * @author ssuarez
 *
 */
public class ConsultaArticulosVM extends PopUpClienteVM {

	private OrdenCargaVM vm;
	
	@Command
	public void cerrar(){
		this.getVentana().detach();
		this.setVentana(null);
		
		BindUtils.postGlobalCommand(null, null,this.vm.retrieveMethod(), null);
	}
	
	@Init
	public void init(@ExecutionArgParam("lista") List<DescriptibleOV> articulos,@ExecutionArgParam("vm") OrdenCargaVM vm, @ExecutionArgParam("descripcion") String descripcion){
		this.setArticulos(articulos);
		this.vm= vm;

		this.setDescripcionCliente(descripcion);
		
		Session sess = Sessions.getCurrent();
		this.setOrden((OrdenCargaDTO) sess.getAttribute("orden"));

	}
	
}
