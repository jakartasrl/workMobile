package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;

import lombok.Data;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;

import com.jkt.excepcion.JakartaException;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.EquipoOV;
import com.jkt.ov.LaboratorioOV;
import com.jkt.ov.ProtocoloOV;
import com.jkt.ov.SucursalOV;

@Data
public class ProtocoloVM extends ViewModel implements IBasicOperations {
	
	private ProtocoloOV protocoloOV = new ProtocoloOV();
	private DescriptibleOV clienteOV = new DescriptibleOV();
	private SucursalOV sucursalOV = new SucursalOV();
	private LaboratorioOV laboratorioOV = new LaboratorioOV();
	private EquipoOV equipoOV = new EquipoOV();
	
	@Init
	public void init(){
		
		this.setTitulo("Protocolo");
		
		this.protocoloOV = new ProtocoloOV();
		this.clienteOV = new DescriptibleOV();
		this.sucursalOV = new SucursalOV();
		this.laboratorioOV = new LaboratorioOV();
		this.equipoOV = new EquipoOV();
		
	}
	
	@Override
	public void guardar() throws JakartaException {
		
	}

	@Command
	@NotifyChange({"protocolo","clienteOV","sucursalOV","laboratorioOV","equipoOV"})
	public void nuevo() throws JakartaException {
		this.init();
	}

	@Override
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
	
	}
	
	@Override
	@GlobalCommand("actualizar")
	@NotifyChange({"protocolo","clienteOV","sucursalOV","laboratorioOV","equipoOV"})
	public void actualizar() {
			
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		
	}

	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}
	
	public void actualizarCamposDependientesDeCliente() {
		this.sucursalOV = new SucursalOV();
	}
	
	public void actualizarCampoSucursal() {
		String text = this.clienteOV.getDescripcion().concat("/").concat(this.sucursalOV.getDescripcion());
		this.sucursalOV.setDescripcionCompleta(text);
	}

}
