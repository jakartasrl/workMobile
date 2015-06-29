package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

import org.apache.commons.beanutils.BeanUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zk.ui.util.Clients;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ComentarioTareaOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ListTareaAgendaOV;
import com.jkt.ov.TareaAgendaOV;
import com.jkt.ov.UserOV;

@Data
public class EditorComentariosTareasVM {
	
	private TareaAgendaOV tarea;
	private List<ComentarioTareaOV> comentarios =  new ArrayList<ComentarioTareaOV>();
	private List<ComentarioTareaOV> comentariosAntiguos =  new ArrayList<ComentarioTareaOV>();
	private boolean existenNuevosComentarios = false;

	
	
	@Init
	public void init(@ExecutionArgParam("tarea") TareaAgendaOV tarea) throws IllegalAccessException, InvocationTargetException{
		ContainerOV container= new ContainerOV();
		container.setString1("tareaPedido");
		container.setString2(String.valueOf(tarea.getId()));
		
		List<TareaAgendaOV> listaTareas = ((ListTareaAgendaOV) Operaciones.ejecutar("TraerTareaConComentarios", container, ListTareaAgendaOV.class)).getList();
		if(listaTareas.isEmpty() || listaTareas.size()>1){
			Clients.showNotification("Ocurrio una inconsistencia al recuperar el historial de comentarios de la tarea");
		}else if(listaTareas.size()==1){
			this.tarea = listaTareas.get(0);
			
			this.comentariosAntiguos=this.tarea.getComentarios();
			
			for (ComentarioTareaOV comentario : this.tarea.getComentarios()) {
				
				ComentarioTareaOV comentarioTareaOV = new ComentarioTareaOV();
				
				BeanUtils.copyProperties(comentarioTareaOV, comentario);
				comentarioTareaOV.setNuevo(false);
				
				this.comentarios.add(comentarioTareaOV);  //Es una copia del original!
			}
			
		}
	}
	
	@Command
	public void cerrar(@BindingParam("window") Window w){
		w.detach();
	}

	@Command
	public void aceptar(@BindingParam("window") Window w) throws IllegalAccessException, InvocationTargetException, JakartaException{
		
		if(existenNuevosComentarios){
			
			/*
			 * Logica para guardar solo los nuevos, ya que los viejos deben quedar tal y como estaban.
			 * Desde la vista seria muy simple cambiar datos crudos de comentarios antiguos.
			 */
			
			tarea.setComentarios(comentariosAntiguos); //Agrego todos los comentarios provenientes de la base de datos
			
			for (ComentarioTareaOV comentarioTareaOV : comentarios) {
				if(comentarioTareaOV.isNuevo()){
					tarea.getComentarios().add(comentarioTareaOV); //y luego todos los nuevos.
				}
			}
			
			Operaciones.ejecutar("ActualizarComentariosTarea", tarea);
		}
		w.detach();
	}
	
	@Command
	@NotifyChange({"comentarios","existenNuevosComentarios"})
	public void agregarComentario(){
		ComentarioTareaOV comentario = new ComentarioTareaOV();
		
		comentario.setFecha(new Date());
		comentario.setNuevo(true);
		
		Session sess = Sessions.getCurrent();
		UserOV userOV = (UserOV) sess.getAttribute("userCredential");
		comentario.setUsuario(userOV.getName().concat(" ").concat(userOV.getLastName()));
		
		this.comentarios.add(comentario);
		
		existenNuevosComentarios=true;
	}
	
}
