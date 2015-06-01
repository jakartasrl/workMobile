package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.zul.Window;

import com.jkt.excepcion.JakartaException;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ItemsOV;

@Data
public class EditorItemsVM {
	
	private List<ItemsOV> items;
	private List<ItemsOV> itemsArticulos;
	
	private List<ItemsOV> todosLosItems=new ArrayList<ItemsOV>();
	
	private PedidoVM pedidoVM;
	private DescriptibleOV tarea;
	
	@Init
	public void init(	@ExecutionArgParam("items") List<ItemsOV> items,
						@ExecutionArgParam("itemsArticulos") List<ItemsOV> itemsArticulos,
						@ExecutionArgParam("vm") PedidoVM vm,
						@ExecutionArgParam("tarea") DescriptibleOV tarea){
		this.items = items;
		this.itemsArticulos = itemsArticulos;
		this.tarea = tarea;
		this.pedidoVM = vm;
		
		this.todosLosItems.addAll(itemsArticulos);
		this.todosLosItems.addAll(items);
	}
	
	@Command
	public void cerrar(@BindingParam("window") Window w){
		w.detach();
	}

	@Command
	public void aceptar(@BindingParam("window") Window w) throws IllegalAccessException, InvocationTargetException, JakartaException{
		pedidoVM.actualizarTareasDesdeHelpExterno(todosLosItems, tarea);
		w.detach();
	}
	
}


