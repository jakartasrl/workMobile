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
import org.zkoss.zk.ui.util.Clients;
import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.CondPagoDetOV;
import com.jkt.ov.CondPagoOV;
import com.jkt.ov.ContainerOV;

@Data
public class CondicionPagoVM extends ViewModel implements IBasicOperations {
	
	private String titulo;	
	private CondPagoOV condPago = new CondPagoOV();
	private List<CondPagoDetOV> lsCondPagoDetalle = new ArrayList<CondPagoDetOV>();
	private boolean verDetalle = false;
	
	@Override
	@Command
	@NotifyChange({"condPago","lsCondPagoDetalle"})
	public void guardar() throws JakartaException {
		
		this.condPago.getDetalles().clear();
		this.condPago.getDetalles().addAll(this.lsCondPagoDetalle);
		
		Operaciones.ejecutar("GuardarCondPago", condPago);
		
		Clients.showNotification("Se completo el guardado exitosamente", "info", null, "end_before", 1000);
		
	}

	@Override
	public void nuevo() throws JakartaException {
		
	}

	@Override
	@Command
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		this.openHelper("condicionPago", "", this.condPago, "traerCondPago", "Condiciones de Pago", "Código", "Descripción",false);
	}
	
	@SuppressWarnings("unchecked")
	@NotifyChange({"condPago","lsCondPagoDetalle","verDetalle"})
	public void traerCondPago() throws IOException, Exception, JakartaException {
		
		this.lsCondPagoDetalle = new ArrayList<CondPagoDetOV>();
		this.verDetalle = true;
		
		long idCondPago = this.condPago.getId();
		String entidad = "CONDICION_PAGO";
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(String.valueOf(idCondPago));
		containerOV.setString2(entidad);
		
		this.condPago = (CondPagoOV) Operaciones.ejecutar("TraerCondPago", containerOV, CondPagoOV.class);
		this.lsCondPagoDetalle.addAll(this.condPago.getDetalles());
		System.out.println();
	}

	@GlobalCommand("actualizar")
	@NotifyChange({"condPago","lsCondPagoDetalle","verDetalle"})
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
	public void init() throws IllegalAccessException, InvocationTargetException{
		this.titulo="Condiciones de Pago";	
		this.verDetalle = false;
	}
	
	@Command
	@NotifyChange({"condPago","lsCondPagoDetalle"})
	public void agregarCondPago() throws JakartaException{
		this.lsCondPagoDetalle.add(new CondPagoDetOV());
	}
	
}
