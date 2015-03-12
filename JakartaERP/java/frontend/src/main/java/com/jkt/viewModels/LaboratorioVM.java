package com.jkt.viewModels;

import java.util.ArrayList;
import java.util.List;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;

import com.jkt.common.Operaciones;
import com.jkt.laboratorio.dominio.Laboratorio;
import com.jkt.ov.LaboratorioOV;

/**
 * ViewModel de la entidad {@link Laboratorio} que se encarga de procesar las diferentes peticiones.
 * 
 */
public class LaboratorioVM {
	
	private LaboratorioOV ov = new LaboratorioOV();
	private List coleccion = new ArrayList();
	
	
	public List getColeccion() {
		return coleccion;
	}

	public void setColeccion(List coleccion) {
		this.coleccion = coleccion;
	}

	public LaboratorioOV getOv() {
		return ov;
	}

	public void setOv(LaboratorioOV ov) {
		this.ov = ov;
	}

	@Command
	@NotifyChange("coleccion")
	public void init(){
		LaboratorioOV l1 = new LaboratorioOV();
		LaboratorioOV l2 = new LaboratorioOV();
		LaboratorioOV l3 = new LaboratorioOV();
		
		l1.setCodigo("cod");
		l1.setDescripcion("desc");
		l2.setCodigo("cod");
		l2.setDescripcion("desc");
		l3.setCodigo("cod");
		l3.setDescripcion("desc");
		
		coleccion.add(l1);
		coleccion.add(l2);
		coleccion.add(l3);
	}
	
	@Command
	public void guardar(){
		Operaciones.ejecutar("GuardarLaboratorio", this.ov);
	}
		
}
