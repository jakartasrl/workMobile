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
import com.jkt.ov.ListRepresentantesOV;
import com.jkt.ov.RepresentanteOV;

@Data
public class RepresentanteVM extends ViewModel implements IBasicOperations {
	
	private String titulo;
	
	List<RepresentanteOV> lsRepresentante = new ArrayList<RepresentanteOV>();
	
	@Override
	@Command
	@NotifyChange("lsRepresentante")
	public void guardar() throws JakartaException {
		
		for (RepresentanteOV representante : this.lsRepresentante ) {
			Operaciones.ejecutar("GuardarRepresentante", representante);
		}
		
		Clients.showNotification("Se completo el guardado exitosamente", "info", null, "end_before", 1000);
		
	}

	@Override
	public void nuevo() throws JakartaException {
		
	}

	@Override
	@Command
	@NotifyChange("lsRepresentante")
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1("representante");
		this.lsRepresentante = ((ListRepresentantesOV) Operaciones.ejecutar("TraerRepresentante", containerOV, ListRepresentantesOV.class)).getList();
	}

	@Override
	@NotifyChange({"lsRepresentante"})
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
				
		this.titulo="Representantes";
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1("representante");
		
		this.lsRepresentante = ((ListRepresentantesOV) Operaciones.ejecutar("TraerRepresentante", containerOV, ListRepresentantesOV.class)).getList();
		
	}
	
	@Command
	@NotifyChange("lsRepresentante")
	public void agregarElemento(){
		this.lsRepresentante.add(new RepresentanteOV());
	}

}
