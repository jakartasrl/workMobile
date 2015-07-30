package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.util.Clients;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.ListNotasOV;
import com.jkt.ov.NotaOV;

@Data
public class NotaVM extends ViewModel implements IBasicOperations {
	
	private String titulo;
	
	List<NotaOV> lsNotas = new ArrayList<NotaOV>();
	
	@Override
	@Command
	@NotifyChange("lsNotas")
	public void guardar() throws JakartaException {
		
		for (NotaOV nota : this.lsNotas ) {
			nota.setIdActividad(nota.getActividad().getId());
			nota.setIdSubActividad(nota.getSubActividad().getId());
			Operaciones.ejecutar("GuardarNota", nota);
		}
		
		Clients.showNotification("Se completo el guardado exitosamente", "info", null, "end_before", 1000);
		
	}

	@Override
	public void nuevo() throws JakartaException {
		
	}

	@Override
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		
	}

	@Override
	@NotifyChange({"lsNotas"})
	@GlobalCommand("updateAll")
	public void actualizar() {
		
	}

	@Override
	protected String retrieveMethod() {
		return "updateAll";
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		this.nuevo();
	}

	@Init(superclass=true)
	public void init() throws IllegalAccessException, InvocationTargetException{
				
		this.titulo="Notas";
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1("nota");
		
		this.lsNotas = ((ListNotasOV) Operaciones.ejecutar("TraerNota", containerOV, ListNotasOV.class)).getList();
		
		System.out.println();
	}
	
	@Command
	@NotifyChange("lsNotas")
	public void agregarElemento(){
		this.lsNotas.add(new NotaOV());
	}

}
