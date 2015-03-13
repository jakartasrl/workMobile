package com.jkt.viewModels;

import java.util.List;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.laboratorio.dominio.Laboratorio;
import com.jkt.ov.LaboratorioOV;
import com.jkt.ov.ListLaboratorioOV;

/**
 * ViewModel de la entidad {@link Laboratorio} que se encarga de procesar las diferentes peticiones.
 * 
 */
public class LaboratorioVM {
	
	private LaboratorioOV ov = new LaboratorioOV();
	
	public LaboratorioOV getOv() {
		return ov;
	}

	public void setOv(LaboratorioOV ov) {
		this.ov = ov;
	}

	@Init
	@NotifyChange("ov")
	public void init(){
		this.traer();
	}
	
	@Command("guardar")
	@NotifyChange("ov")
	public void guardar(){
		Operaciones.ejecutar("saveLabo", this.ov);
		Messagebox.show("Laboratorio Guardado correctamente.");
		this.traer();
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

}
