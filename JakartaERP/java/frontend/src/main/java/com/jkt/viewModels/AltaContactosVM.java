package com.jkt.viewModels;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;

import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.ov.ContactoOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ListDescriptibleOV;

@Data
public class AltaContactosVM {
	
	private ListDescriptibleOV tiposDeContacto =  new ListDescriptibleOV();
	private DescriptibleOV tipoDeContacto =  new DescriptibleOV();
	private ComprobanteVM vm;
	private ContactoOV contactoOV =  new ContactoOV();
	
	@Init
	public void init(@ExecutionArgParam("vm") ComprobanteVM vm){
		this.tiposDeContacto = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV("tipoContacto"), ListDescriptibleOV.class);
		this.vm = vm;
	}
	
	@Command
	public void cerrar(@BindingParam("window") Window x) {
		x.detach();
	}
	
	@Command
	public void aceptar(@BindingParam("window") Window x) {
		
		long idSucursal = this.vm.sucursalOV.getId();
		if(idSucursal==0L){
			Messagebox.show("Seleccione una sucursal antes de agregar nuevos contactos de referencia");
			x.detach();
			return;
		}else{
			this.contactoOV.setClienteSucursalId(idSucursal);
		}
		
		this.contactoOV.setIdTipoContacto(this.tipoDeContacto.getId());
		
		if(!validarTipoContacto()){
			Messagebox.show("Complete todos los datos del contacto.");
//			x.detach();
			return;
		}
		
		ContactoOV contactoGuardado = (ContactoOV) Operaciones.ejecutar("GuardarContactoEnSucursal", this.contactoOV, ContactoOV.class);
		
		DescriptibleOV descriptibleOV = new DescriptibleOV();
		descriptibleOV.setId(contactoGuardado.getId());
		descriptibleOV.setCodigo(contactoGuardado.getApellidoYNombre());
		descriptibleOV.setDescripcion(contactoGuardado.getTelefono());
		descriptibleOV.setCampoAdicional1(contactoGuardado.getMail());
		descriptibleOV.setCampoAdicional2(contactoGuardado.getDescripcionTipo());
		
		
		/*
		 * Guarda la lista de los seleccionados temporalmente,
		 * toma todos los contactos existentes, y usando ambas lista, agrega de la lista total a la lista de elementos seleccionados.
		 * todo esto para agregar el nuevo elemento a la lista y no borrar los que ya selecciono previamente...
		 */
		
		this.vm.actualizarContactosReferencia();
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(String.valueOf(idSucursal));

		this.vm.contactos = (ListDescriptibleOV) Operaciones.ejecutar("RecuperarContactosDeSucursal", containerOV, ListDescriptibleOV.class);

		
		List<DescriptibleOV> contactosSeleccionados = this.vm.contactosSeleccionados;
		
		Map<String, DescriptibleOV> mapa = new HashMap<String, DescriptibleOV>();
		List<DescriptibleOV> listaContactosTotal = this.vm.contactos.getList();
		for (DescriptibleOV contacto : listaContactosTotal) {
			mapa.put(String.valueOf(contacto.getId()), contacto);
		}
		
		this.vm.contactosSeleccionados = new ArrayList<DescriptibleOV>();
		
		for (DescriptibleOV contactoTmp : contactosSeleccionados) {
			this.vm.contactosSeleccionados.add(mapa.get(String.valueOf(contactoTmp.getId())));
		}
		
		BindUtils.postGlobalCommand(null, null,this.vm.retrieveMethod(), null);
		x.detach();
	}

	private boolean validarTipoContacto() {
		if(contactoOV.getApellidoYNombre()==null || contactoOV.getApellidoYNombre().isEmpty() ){
			return false;
		}
		
		if(contactoOV.getTelefono()==null || contactoOV.getTelefono().isEmpty() ){
			return false;
		}
		if(contactoOV.getIdTipoContacto()==0){
			return false;
		}
		
		return true;
	}
	
}
