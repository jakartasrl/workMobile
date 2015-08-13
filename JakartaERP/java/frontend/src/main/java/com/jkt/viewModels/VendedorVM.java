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
import com.jkt.ov.ListVendedoresOV;
import com.jkt.ov.VendedorOV;

@Data
public class VendedorVM extends ViewModel implements IBasicOperations {
	
	private String titulo;
	
	List<VendedorOV> lsVendedor = new ArrayList<VendedorOV>();
	
	@Override
	@Command
	@NotifyChange("lsVendedor")
	public void guardar() throws JakartaException {
		
		for (VendedorOV vendedor : this.lsVendedor ) {
			Operaciones.ejecutar("GuardarVendedor", vendedor);
		}
		
		Clients.showNotification("Se completo el guardado exitosamente", "info", null, "end_before", 1000);
		
	}

	@Override
	public void nuevo() throws JakartaException {
		
	}

	@Override
	@Command
	@NotifyChange("lsVendedor")
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1("vendedor");
		this.lsVendedor = ((ListVendedoresOV) Operaciones.ejecutar("TraerVendedor", containerOV, ListVendedoresOV.class)).getList();
	}

	@Override
	@NotifyChange({"lsVendedor"})
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
				
		this.titulo="Vendedores";
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1("vendedor");
		
		this.lsVendedor = ((ListVendedoresOV) Operaciones.ejecutar("TraerVendedor", containerOV, ListVendedoresOV.class)).getList();
		
	}
	
	@Command
	@NotifyChange("lsVendedor")
	public void agregarElemento(){
		this.lsVendedor.add(new VendedorOV());
	}

}
