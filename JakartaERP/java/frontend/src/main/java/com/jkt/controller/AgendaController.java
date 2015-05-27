package com.jkt.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import lombok.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
import com.jkt.dto.EventoDTO;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ListPedidoOV;
import com.jkt.ov.PedidoOV;
import com.jkt.ov.TareaAgendaOV;
import com.jkt.viewModels.IBasicOperations;
import com.jkt.viewModels.ViewModel;

@Controller
@RequestMapping(value = "/agenda")
@Data
public class AgendaController extends ViewModel implements IBasicOperations {

	@Autowired
	private ServletContext servletContext;
	
	private DescriptibleOV pedidoDescriptible= new DescriptibleOV();
	
	@RequestMapping(method = RequestMethod.GET, value="/{id}")
	public @ResponseBody ArrayList<EventoDTO> obtenerEventos(ServletRequest request, ServletResponse response, @PathVariable("id") String idPedido){
		
		String serverName = request.getServerName();
		int serverPort = request.getServerPort();
		String contextPath = servletContext.getContextPath();
		
		Operaciones.url = "http://" + serverName + ":" + serverPort + "/" + contextPath + "/api/processorHTML5/xml";

		ContainerOV container = new ContainerOV();
		container.setString1("pedido");
//		container.setString2(String.valueOf(pedidoDescriptible.getId()));
		container.setString2(idPedido);
//		container.setString2(String.valueOf(3375104L));
		
		ListPedidoOV l = (ListPedidoOV) Operaciones.ejecutar("TraerPedidoConTareas", container, ListPedidoOV.class);
		List list = l.getList();
		if(list.isEmpty() || list.size()>1){
			Messagebox.show("Ocurrio un error al intentar recuperar el pedido y su planificación.");
			return null;
		}
		PedidoOV pedido = (PedidoOV) list.get(0);

		java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd");
		ArrayList<EventoDTO> result = new ArrayList<EventoDTO>();
		for (TareaAgendaOV tarea : pedido.getTareas()) {
			String value=String.format("%s - %s", tarea.getCodigoTarea(), tarea.getDescripcionTarea());
			
			String color="orange";
			if(tarea.getIdEstado()==1){
				//no iniciaco
			}else if(tarea.getIdEstado()==2){
				//en ejecucion
				color="#3A87AD";
			}else{
				//finalizado
				color="#99D86F";
			}
			
			result.add(new EventoDTO(1L,value , sdf.format(tarea.getFechaLimite()), sdf.format(tarea.getFechaCumplimiento()), color, color));
		}
		
		return result;
		
	}
	
	@Init
	public void init(){
		this.setTitulo("Agenda");
	}

	@Override
	public void guardar() throws JakartaException {
		
	}

	@Override
	public void nuevo() throws JakartaException {
		
	}

	@Override
	public void buscar() throws JakartaException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		
	}

	@Override
	@GlobalCommand("update")
	@NotifyChange("pedidoDescriptible")
	public void actualizar() {

	}

	@Override
	protected String retrieveMethod() {
		return "update";
	}
	
	

}
