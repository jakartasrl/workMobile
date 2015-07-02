package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.apache.commons.lang.StringUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.AgregarEmpresasAlUsuario;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.TareaAgendaOV;

@Data
public class EditorItemsVM {
	
	private List<ItemsOV> items;
	private Boolean agregacion;
	
	private List<ItemsOV> todosLosItems=new ArrayList<ItemsOV>();
	
	private PedidoVM pedidoVM;
	private DescriptibleOV tarea;
	private TareaAgendaOV tareaCompleta;
	
	@Init
	public void init(	@ExecutionArgParam("items") List<ItemsOV> items,
						@ExecutionArgParam("vm") PedidoVM vm,
						@ExecutionArgParam("tarea") DescriptibleOV tarea,
						@ExecutionArgParam("tareaCompleta") TareaAgendaOV tareaCompleta,
						@ExecutionArgParam("agregacion") Boolean agregacion
						){
		
		this.agregacion = agregacion;
		
		if(agregacion){
			this.items = items;
			this.tarea = tarea;
			this.pedidoVM = vm;
			
			for (ItemsOV itemsOV : items) {
				itemsOV.setDescripcion(StringUtils.EMPTY);
			}
			
			this.todosLosItems.addAll(items);
		}else{
			this.tareaCompleta = tareaCompleta;
		}
		
	}
	
	@Command
	public void cerrar(@BindingParam("window") Window w){
		w.detach();
	}

	@Command
	public void aceptar(@BindingParam("window") Window w) throws IllegalAccessException, InvocationTargetException, JakartaException{
		
		if(this.agregacion){
			for (ItemsOV itemsOV : todosLosItems) {
				
				if (itemsOV.getReferencia().isEmpty()) {
					Messagebox.show("Complete la referencia de todos los items");
					return;
				}
	
				if (itemsOV.getDescripcionAbreviada().isEmpty()) {
					Messagebox.show("Complete la descripción (abreviada) de todos los items");
					return;
				}
				
			}
			
			pedidoVM.actualizarTareasDesdeHelpExterno(todosLosItems, tarea);
		}else{
			//No Hacer Nada!
		}
		
		w.detach();
	}
	
}


