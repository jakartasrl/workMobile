package com.jkt.viewModels;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import lombok.Data;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.util.Clients;
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ClienteOV;
import com.jkt.ov.ClienteSucursalOV;
import com.jkt.ov.CondPagoOV;
import com.jkt.ov.ContactoOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.DomicilioEntregaOV;
import com.jkt.ov.ProvinciaOV;
import com.jkt.ov.RepresentanteOV;
import com.jkt.ov.VendedorOV;

@Data
public class ClienteVM extends ViewModel implements IBasicOperations {
	
	private String titulo;	
	private ClienteOV cliente = new ClienteOV();
	
	private ProvinciaOV provincia = new ProvinciaOV();
	private DescriptibleOV pais = new DescriptibleOV();
	
	private CondPagoOV condPago = new CondPagoOV();
	private RepresentanteOV representante = new RepresentanteOV();
	private VendedorOV vendedor = new VendedorOV();
	
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
	@NotifyChange({"cliente","provincia","pais","condPago","vendedor","representante"})
	public void traerCliente() throws IOException, Exception, JakartaException {
	
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(String.valueOf(this.cliente.getId()));
		
		this.cliente = (ClienteOV) Operaciones.ejecutar("TraerCliente", containerOV, ClienteOV.class);
		
		this.provincia.setId(this.cliente.getIdProvincia());
		this.provincia.setCodigo(this.cliente.getCodProvincia());
		this.provincia.setDescripcion(this.cliente.getDescProvincia());
		
		this.pais.setId(this.cliente.getIdPais());
		this.pais.setCodigo(this.cliente.getCodPais());
		this.pais.setDescripcion(this.cliente.getDescPais());
		
		this.condPago.setId(this.cliente.getIdCondPago());
		this.condPago.setCodigo(this.cliente.getCodCondPago());
		this.condPago.setDescripcion(this.cliente.getDescCondPago());
		
		this.vendedor.setId(this.cliente.getIdVendedor());
		this.vendedor.setCodigo(this.cliente.getCodVendedor());
		this.vendedor.setDescripcion(this.cliente.getDescVendedor());
		
		this.representante.setId(this.cliente.getIdRepresentante());
		this.representante.setCodigo(this.cliente.getCodRepresentante());
		this.representante.setDescripcion(this.cliente.getDescRepresentante());
		
		this.cargarVendedoresParaSucursales();
		this.cargarRepresentantesParaSucursales();
		
	}

	private void cargarRepresentantesParaSucursales() {
		for(ClienteSucursalOV clienteSucursal : this.cliente.getListaSucursales()){
			clienteSucursal.getRepresentante().setId(clienteSucursal.getIdRepresentante());
			clienteSucursal.getRepresentante().setCodigo(clienteSucursal.getCodRepresentante());
			clienteSucursal.getRepresentante().setDescripcion(clienteSucursal.getDescRepresentante());
		}
		
	}

	private void cargarVendedoresParaSucursales() {
		for(ClienteSucursalOV clienteSucursal : this.cliente.getListaSucursales()){
			clienteSucursal.getVendedor().setId(clienteSucursal.getIdVendedor());
			clienteSucursal.getVendedor().setCodigo(clienteSucursal.getCodVendedor());
			clienteSucursal.getVendedor().setDescripcion(clienteSucursal.getDescVendedor());
		}
		
	}

	@GlobalCommand("actualizar")
	@NotifyChange({"cliente","provincia","pais","condPago","vendedor","representante"})
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
	
	@Command
	@NotifyChange({"cliente"})
	public void agregarSucursal() throws JakartaException{
		
		ClienteSucursalOV clienteSucursal = new ClienteSucursalOV();
		
		if (this.getVendedor().getCodigo().equals("")){
			Messagebox.show("Debe ingresar un vendedor para el cliente.");
			return;
		} else {
			clienteSucursal.setVendedor(this.getVendedor());
		}
		
		if (this.getRepresentante().getCodigo().equals("")){
			Messagebox.show("Debe ingresar un representante para el cliente.");
			return;
		} else {
			clienteSucursal.setRepresentante(this.getRepresentante());
		}
		
		this.cliente.getListaSucursales().add(clienteSucursal);
	}

	@Command
	@NotifyChange({"cliente"})
	public void agregarDomicilioDeEntrega() throws JakartaException{
		this.cliente.getDomiciliosDeEntrega().add(new DomicilioEntregaOV());
	}
	
	@Command
	@NotifyChange({"cliente"})
	public void agregarContacto() throws JakartaException{
		this.cliente.getContactos().add(new ContactoOV());
	}
	
	@Command
	@NotifyChange({"cliente"})
	public void borrarContacto(@BindingParam("contacto") ContactoOV contacto) throws JakartaException {
		this.cliente.getContactos().remove(contacto);
	}
	
	@Command
	@NotifyChange({"cliente"})
	public void borrarSucursal(@BindingParam("sucursal") ClienteSucursalOV sucursal) throws JakartaException {
		this.cliente.getListaSucursales().remove(sucursal);
	}

	@Command
	@NotifyChange({"cliente"})
	public void borrarDomicilioDeEntrega(@BindingParam("domicilioEntrega") DomicilioEntregaOV domicilioEntrega) throws JakartaException{
		this.cliente.getDomiciliosDeEntrega().remove(domicilioEntrega);
	}
	
}

