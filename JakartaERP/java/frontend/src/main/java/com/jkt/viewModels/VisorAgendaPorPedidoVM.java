package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.dto.EventoDTO;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListPedidoOV;
import com.jkt.ov.ListTareaAgendaOV;
import com.jkt.ov.PedidoOV;
import com.jkt.ov.TareaAgendaOV;

@Data
public class VisorAgendaPorPedidoVM extends VisorAgendaVM {

	@Init
	public void init(){
		this.vistaPorPedido = true;
	}
	
	@Override
	@GlobalCommand("actualizarTodo")
	@NotifyChange({"allTasks"})
	public void actualizar() {

	}

	@Override
	protected String retrieveMethod() {
		return "actualizarTodo";
	}

	@Command
	@NotifyChange("allTasks")
	public void filtrar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		openComplexHelper("pedido", "", pedidoDescriptible, "postHelperPedido", "Pedidos Disponibles", "Nro Pedido", "Cliente",true, "Fecha" , "" );
	}

	public void postHelperPedido() throws JakartaException{

		ContainerOV container = new ContainerOV();
		container.setString1("pedido");
		container.setString2(String.valueOf(pedidoDescriptible.getId()));
		
		ListPedidoOV l = (ListPedidoOV) Operaciones.ejecutar("TraerPedidoConTareas", container, ListPedidoOV.class);
		List list = l.getList();
		if(list.isEmpty() || list.size()>1){
			Messagebox.show("Ocurrio un error al intentar recuperar el pedido y sus tareas.");
			return;
		}
		PedidoOV pedido = (PedidoOV) list.get(0);

		allTasks = pedido.getTareas();
		
		for (TareaAgendaOV tareaAgendaOV : allTasks) {
			tareaAgendaOV.setPedidoDescriptible(pedidoDescriptible);
			
			List allStates = ((ListDescriptibleOV) Operaciones.ejecutar("TraerEstadosTareas", ListDescriptibleOV.class)).getList();
			
			DescriptibleOV d;
			
			for (Object object : allStates) {
				d=(DescriptibleOV) object;
				if(d.getCodigo().equals(String.valueOf(tareaAgendaOV.getIdEstado()))){
					tareaAgendaOV.setEstado(d);
					break;//break the small for!
				}
			}
			
			DescriptibleOV sector = Operaciones.recuperarObjetoDescriptible("sector", tareaAgendaOV.getIdSector());
			tareaAgendaOV.setSector(sector);
		}
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);

	}
	
}
