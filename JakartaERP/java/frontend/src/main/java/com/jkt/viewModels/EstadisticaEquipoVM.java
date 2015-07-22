package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;

import lombok.Data;

import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.EquipoOV;
import com.jkt.ov.ProtocoloOV;

@Data
public class EstadisticaEquipoVM extends ViewModel implements IBasicOperations {
	
	private ProtocoloOV protocoloOV = new ProtocoloOV();
	private EquipoOV equipoOV = new EquipoOV();

	@Override
	public void guardar() throws JakartaException {
		
	}

	@Override
	public void nuevo() throws JakartaException {
		
	}

	@Override
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		
	}

	@Override
	@GlobalCommand("actualizar")
	@NotifyChange({"protocoloOV","equipoOV"})
	public void actualizar() {
			
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		this.nuevo();
		Executions.sendRedirect(Executions.getCurrent().getDesktop().getFirstPage().getRequestPath());
	}

	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}
		
	@Init(superclass=true)
	@NotifyChange({"protocoloOV","equipoOV"})
	public void init(){
		
		if(isCargadoDesdeSession()){
			return;
		}

		this.setTitulo("Estadistica de Equipo");
		this.protocoloOV = new ProtocoloOV();
		this.equipoOV = new EquipoOV();
		
	}
	
	public void traerEquipo(){
		
		long idEquipo = this.equipoOV.getId();
		String entidad = "Equipo";
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(String.valueOf(idEquipo));
		containerOV.setString2(entidad);
		
		EquipoOV equipo = (EquipoOV) Operaciones.ejecutar("TraerEquipo", containerOV, EquipoOV.class);
		
		this.setEquipoOV(equipo);
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
		
	}

}
