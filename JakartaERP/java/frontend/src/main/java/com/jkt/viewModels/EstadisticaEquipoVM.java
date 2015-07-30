package com.jkt.viewModels;

import static org.apache.commons.beanutils.BeanUtils.copyProperties;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import lombok.Data;

import org.joda.time.LocalDate;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zul.Hlayout;
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.laboratorio.dominio.ProtocoloEstadistica;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.EquipoOV;
import com.jkt.ov.ListProtocoloEstadisticaOV;
import com.jkt.ov.ProtocoloEstadisticaOV;
import com.jkt.ov.ProtocoloOV;
import com.jkt.ov.grid.GeneradorGrilla;

@Data
public class EstadisticaEquipoVM extends ViewModel implements IBasicOperations {
	
	private ProtocoloOV protocoloOV = new ProtocoloOV();
	private EquipoOV equipoOV = new EquipoOV();
	
	private Date fechaDesde = LocalDate.now().minusMonths(1).toDate();
	private Date fechaHasta = new Date();
	
	private Map<Date,List<ProtocoloEstadisticaOV>> mapFechas=new HashMap<Date,List<ProtocoloEstadisticaOV>>();

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
	@NotifyChange({"protocoloOV","equipoOV","fechaDesde","fechaHasta"})
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
	@NotifyChange({"protocoloOV","equipoOV","fechaDesde","fechaHasta"})
	public void init(){
		
		if(isCargadoDesdeSession()){
			return;
		}

		this.setTitulo("Historia de Equipos");
		this.protocoloOV = new ProtocoloOV();
		this.equipoOV = new EquipoOV();
		this.fechaDesde = new Date();
		this.fechaHasta = new Date();
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
	
	private void generarMatrizDeterminaciones(List<ProtocoloEstadisticaOV> listProtocoloEstadisticaOV) {

		for(ProtocoloEstadisticaOV protEstOV : listProtocoloEstadisticaOV){
			if (!this.mapFechas.containsKey(protEstOV.getFechaCreacion())){
				List<ProtocoloEstadisticaOV> listDeter=new ArrayList<ProtocoloEstadisticaOV>();
				listDeter.add(protEstOV);
				this.mapFechas.put(protEstOV.getFechaCreacion(), listDeter);
			} else {
				List<ProtocoloEstadisticaOV> listDeter=new ArrayList<ProtocoloEstadisticaOV>();
				listDeter = this.mapFechas.get(protEstOV.getFechaCreacion());
				listDeter.add(protEstOV);		
			}
		}	
	}

	@Command
	public void generarGrilla(@BindingParam("componente") Hlayout panel) throws InterruptedException, Exception, Exception{

		if(this.equipoOV.getId()==0){
			Messagebox.show("Complete el equipo.");
			return;
		}
		
		if(this.fechaDesde.after(this.fechaHasta)){
			Messagebox.show("Verifique la consistencia de filtro de fechas.");
			return;
		}
		
		limpiarGrilla(panel);

		ContainerOV container = new ContainerOV();
		container.setLong1(this.equipoOV.getId());		
		container.setFecha1(this.fechaDesde);
		container.setFecha2(this.fechaHasta);
		
		List<ProtocoloEstadisticaOV> listProtocoloEstadisticaOV =  ((ListProtocoloEstadisticaOV) Operaciones.ejecutar("RecuperarProtocolosEstadisticas", container, ListProtocoloEstadisticaOV.class)).getList();
		
		this.generarMatrizDeterminaciones(listProtocoloEstadisticaOV);

		
		//Cargamos la determinaciones en la matriz
		List<ProtocoloEstadistica> lsDeterminaciones = new ArrayList<ProtocoloEstadistica>();
		
		Iterator<List<ProtocoloEstadisticaOV>>  itDeter = this.mapFechas.values().iterator();
	
		while (itDeter.hasNext()) {
			
			List<ProtocoloEstadisticaOV> listDeter = new ArrayList<ProtocoloEstadisticaOV>();
			listDeter = itDeter.next();
			
			final Iterator<ProtocoloEstadisticaOV> itProtEst = listDeter.iterator();
		
			while (itProtEst.hasNext()) {
				ProtocoloEstadisticaOV protEstOV = new ProtocoloEstadisticaOV();
				ProtocoloEstadistica protEst = new ProtocoloEstadistica();
				protEstOV = itProtEst.next();
				copyProperties(protEst,protEstOV);
				lsDeterminaciones.add(protEst);
			}
			
		}

		GeneradorGrilla generadorGrilla = new GeneradorGrilla(panel,lsDeterminaciones);
		generadorGrilla.generar();
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}

	@NotifyChange
	private void limpiarGrilla(Hlayout panel) {
		panel.getChildren().clear();
	}

}
