package com.jkt.viewModels;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.util.Clients;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.CategoriaImpuestoOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ImpuestoOV;
import com.jkt.ov.ListDescriptibleOV;

@Data
public class ImpuestoVM extends ViewModel implements IBasicOperations {
	
	private String titulo;	
	private ImpuestoOV impuesto = new ImpuestoOV();
	private List<CategoriaImpuestoOV> categorias = new ArrayList<CategoriaImpuestoOV>();
	private List<DescriptibleOV> comportamientos = new ArrayList<DescriptibleOV>();
	private DescriptibleOV comportamientoSeleccionado = new DescriptibleOV();
	
	@Override
	@Command
	@NotifyChange({"impuesto","categorias","comportamientos","comportamientoSeleccionado"})
	public void guardar() throws JakartaException {
		
		this.impuesto.getCategorias().clear();
		this.impuesto.getCategorias().addAll(this.categorias);
		this.impuesto.setComportamiento(String.valueOf(this.comportamientoSeleccionado.getId()));
		Operaciones.ejecutar("GuardarImpuesto", this.impuesto);
		
		Clients.showNotification("Se completo el guardado exitosamente", "info", null, "end_before", 1000);
		
	}

	@Command
	public void nuevo() throws JakartaException {
		Executions.sendRedirect(Executions.getCurrent().getDesktop().getFirstPage().getRequestPath());
	}

	@Override
	@Command
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		this.openHelper("impuesto", "", this.impuesto, "traerImpuesto", "Impuestos", "Código", "Descripción", false);
	}
	
	@SuppressWarnings("unchecked")
	@NotifyChange({"impuesto","categorias","comportamientos","comportamientoSeleccionado"})
	public void traerImpuesto() throws IOException, Exception, JakartaException {
		
		this.categorias = new ArrayList<CategoriaImpuestoOV>();
		
		long idImpuesto = this.impuesto.getId();
		String entidad = "impuesto";
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(String.valueOf(idImpuesto));
		containerOV.setString2(entidad);
		
		this.impuesto = (ImpuestoOV) Operaciones.ejecutar("TraerImpuesto", containerOV, ImpuestoOV.class);
		this.categorias.addAll(this.impuesto.getCategorias());
		this.comportamientoSeleccionado = this.completarCombo(this.comportamientos, Long.valueOf(this.impuesto.getComportamiento()));

	}

	@GlobalCommand("actualizar")
	@NotifyChange({"impuesto","categorias","comportamientos","comportamientoSeleccionado"})
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
	@NotifyChange({"impuesto","categorias","comportamientos","comportamientoSeleccionado"})
	public void init() throws IllegalAccessException, InvocationTargetException{
		
		this.titulo="Impuestos";			
		this.comportamientos = ((ListDescriptibleOV) Operaciones.ejecutar("TraerComportamientos", ListDescriptibleOV.class)).getList();
		
		this.impuesto = new ImpuestoOV();
		this.categorias = new ArrayList<CategoriaImpuestoOV>();
		this.comportamientoSeleccionado = new DescriptibleOV();

	}
	
	@Command
	@NotifyChange({"categorias"})
	public void agregarCategoria() throws JakartaException{
		this.categorias.add(new CategoriaImpuestoOV());
	}
		
}
