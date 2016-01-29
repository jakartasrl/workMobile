package com.jkt.viewModels;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import lombok.Data;

import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zul.Window;

import com.jkt.dto.ClienteOV;
import com.jkt.dto.OrdenCargaDTO;
import com.jkt.ov.DescriptibleOV;

@Data
public class PopUpClienteVM {
	
	private List<DescriptibleOV> articulos = new ArrayList<DescriptibleOV>();
	private ClienteVM vm;
	private String descripcionCliente;
	
	private OrdenCargaDTO orden;
	
	@Init
	public void init(@ExecutionArgParam("lista") List<DescriptibleOV> articulos,@ExecutionArgParam("vm") ClienteVM vm){
		this.articulos = articulos;
		this.vm= vm;
		
		
		Session sess = Sessions.getCurrent();
		this.orden = (OrdenCargaDTO) sess.getAttribute("orden");
		this.descripcionCliente = this.orden.getDescripcionClienteActual();

	}

	
	@Command
	public void cancelar(){
		ventana.detach();
		ventana=null;
	}
	
	String [] codigos = {"Mot","Nex","Agf","Jak","Moto","Nxo","Aa","Gat","Mla","DELL","Agfa","ITR"};
	String [] nombres = {"Motorola","Nexo","Agfa","Jakarta","Motorola","Nexo","Agfa","Gatorade","Motorola","DELL","Agfa","ITR"};
	
	@Command
	public void cerrar(){

		Random rn = new Random();
	    int randomNum = rn.nextInt((8 - 1) + 1) + 1;
		
		ClienteOV cliente = new ClienteOV();
		cliente.setCodigo(codigos[randomNum]);
		cliente.setDescripcion(nombres[randomNum]);
		cliente.setCodigoBarra(orden.getCodigoBarraCliente());
		cliente.setArticulos(orden.getArticulos());
		
		orden.getClientes().add(cliente);

		vm.limpiarCliente();
		
		ventana.detach();
		ventana=null;
		
		BindUtils.postGlobalCommand(null, null,vm.retrieveMethod(), null);

	}
	
	private Window ventana;
	
	@Command
	public void asignarVentana(@BindingParam("window") Window ventana){
		this.ventana=ventana;
	}
}
