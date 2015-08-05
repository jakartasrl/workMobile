package com.jkt.viewModels;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import lombok.Data;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.util.Clients;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ClienteOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ListaClienteOV;
import com.jkt.ov.ProvinciaOV;

@Data
public class ClienteVM extends ViewModel implements IBasicOperations {
	
	private String titulo;	
	private ClienteOV cliente = new ClienteOV();
	
	private ProvinciaOV provincia = new ProvinciaOV();
	private DescriptibleOV pais = new DescriptibleOV();
	
	@Override
	@Command
	@NotifyChange({"cliente"})
	public void guardar() throws JakartaException {
		Operaciones.ejecutar("GuardarCondPago", cliente);
		Clients.showNotification("Se completo el guardado exitosamente", "info", null, "end_before", 1000);
		
	}

	@Override
	public void nuevo() throws JakartaException {
		
	}

	@Override
	@Command
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		this.openHelper("clientes", "", this.cliente, "traerCliente", "Clientes", "Código", "Descripción",false);
	}
	
	@SuppressWarnings("unchecked")
	@NotifyChange({"cliente","provincia","pais"})
	public void traerCliente() throws IOException, Exception, JakartaException {
	
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1("clientes");
		containerOV.setString2(String.valueOf(this.cliente.getId()));
		
		ListaClienteOV lsCliente = (ListaClienteOV) Operaciones.ejecutar("TraerCliente", containerOV, ListaClienteOV.class);
		this.cliente = (ClienteOV) lsCliente.getList().get(0);
		this.provincia.setId(this.cliente.getIdProvincia());
		this.provincia.setCodigo(this.cliente.getCodProvincia());
		this.provincia.setDescripcion(this.cliente.getDescProvincia());
		this.pais.setId(this.cliente.getIdPais());
		this.pais.setCodigo(this.cliente.getCodPais());
		this.pais.setDescripcion(this.cliente.getDescPais());
		
		
	}

	@GlobalCommand("actualizar")
	@NotifyChange({"cliente","provincia","pais"})
	public void actualizar() {
		log.warn("Actualizando datos...");
	}
	
	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		this.nuevo();
	}

	@Init(superclass=true)
	public void init() throws IllegalAccessException, InvocationTargetException{
		this.titulo="Clientes";	
	}
	
}

