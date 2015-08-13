package com.jkt.dominio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jkt.excepcion.JakartaException;
import com.jkt.persistencia.IServiceRepository;

/**
 * Se encarga de avanzar o retroceder tareas, sin importar la naturaleza a las mismas.
 * 
 * Se deberia instanciar desde una operación, o algo que maneje sesiones cosa que pase el service repository para trabajar contra la base.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class AdministradorTareas {

	protected IServiceRepository serviceRepository;

	public IServiceRepository getServiceRepository() {
		return serviceRepository;
	}

	@Autowired
	public void setServiceRepository(IServiceRepository serviceRepository) {
		this.serviceRepository = serviceRepository;
	}

	public void verEstadoDeTarea(int id){
		Tarea tarea = null;
		verEstadoDeTarea(tarea);
	}
	
	public Estado verEstadoDeTarea(Tarea tarea){
		return tarea.getEstadoActual();
	}
	
	public void avanzarEstadoTarea(long idTarea) throws Exception{
		Tarea t = recuperarTarea(idTarea);
		t.avanzarEstado();
		
		if(t.estadoFinal()){
			//comunicar a los siguiente
			for (Tarea tarea : t.getPosteriores()) {
				tarea.avanzarEstado(); //Se supone que el estado inicial es en espera de precedentes
			}
		}
	}

	private Tarea recuperarTarea(long idTarea) throws Exception {
		Tarea t = (Tarea) this.serviceRepository.getByOid(Tarea.class, idTarea);
		return t;
	}
	
	public void retrocederEstadoTarea(long idTarea) throws Exception{
		Tarea t = recuperarTarea(idTarea);
//		throw new JakartaException("Desde que estado se puede regresar? Pendiente -> No Iniciada -> Ejecucion -> Finalizada");
		
		List<Tarea> posteriores = t.getPosteriores();
		
		for (Tarea tarea : posteriores) {
			if(tarea.estadoFinal()){
				throw new JakartaException("No es posible revertir el estado de la tarea "+tarea.getNombre()+" debido a que alguna de sus tareas posteriores ya se finalizaron.");
			}
		}
		
		//Si llega a este punto, se puede revertir.
		
		
		
	}

}
