package com.jkt.viewModels;

import java.util.List;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.laboratorio.dominio.Laboratorio;
import com.jkt.ov.LaboratorioOV;
import com.jkt.ov.ListLaboratorioOV;

/**
 * ViewModel de la entidad {@link Laboratorio} que se encarga de procesar las diferentes peticiones.
 * 
 */
public class LaboratorioVM extends ViewModel implements IBasicOperations{
	
	private LaboratorioOV ov = new LaboratorioOV();
	
	public LaboratorioOV getOv() {
		return ov;
	}

	public void setOv(LaboratorioOV ov) {
		this.ov = ov;
	}

	@Init(superclass=true)
	@NotifyChange("ov")
	public void init(){
		this.setTitulo("Administracion de Laboratorios");
		this.traer();
	}
	
	@Command
	@NotifyChange("ov")
	public void guardar() throws JakartaException {
		actualizar();
		Messagebox.show("Se completo la operación de salvado correctamente.");
	}

	@Command("update")
	public void update(){
		@SuppressWarnings("rawtypes")
		List laboratorios = this.ov.getLaboratorios();
		
		LaboratorioOV l;
		for (Object laboratorio : laboratorios ) {
			l=(LaboratorioOV) laboratorio;
			Operaciones.ejecutar("saveLabo", l);
		}
	
	}
	
	@Command("traer")
	@NotifyChange("ov")
	public void traer(){
		ListLaboratorioOV list = (ListLaboratorioOV) Operaciones.ejecutar("TraerLabo", ListLaboratorioOV.class);
		this.ov.setLaboratorios(list.getList());
	}
	
	@Command
	public void cerrarModal(@BindingParam("window") Window win){
		win.detach();
	}

	@Override
	@Command
	public void nuevo() throws JakartaException {
		this.ov = new LaboratorioOV();
	}

	@Override
	@Command
	public void buscar() throws JakartaException {
		ListLaboratorioOV list = (ListLaboratorioOV) Operaciones.ejecutar("TraerLabo", ListLaboratorioOV.class);
		this.ov.setLaboratorios(list.getList());
	}

	@Override
	@Command
	public void actualizar() {
		@SuppressWarnings("rawtypes")
		List laboratorios = this.ov.getLaboratorios();
		
		LaboratorioOV l;
		for (Object laboratorio : laboratorios ) {
			l=(LaboratorioOV) laboratorio;
			Operaciones.ejecutar("saveLabo", l);
		}
	}

	@Override
	protected String retrieveMethod() {
		return "";
	}
	
	@Command("agregarLaboratorio")
	@NotifyChange("ov")
	public void agregarLaboratorio(){
		this.ov.getLaboratorios().add(new LaboratorioOV());
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		this.nuevo();
	}

}
