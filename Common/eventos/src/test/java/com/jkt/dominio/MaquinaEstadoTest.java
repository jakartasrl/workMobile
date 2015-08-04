package com.jkt.dominio;

import org.junit.Test;

import com.jkt.excepcion.JakartaException;

public class MaquinaEstadoTest {

	@Test
	public void create() throws JakartaException{
		MaquinaEstado maquinaEstado = new MaquinaEstado();
		
		Estado e1=new Estado("Inicial");
		Estado e2=new Estado("Medio");
		Estado e22=new Estado("Medio2");
		Estado e3=new Estado("Final");
		
		maquinaEstado.agregarEstado(e1);
		maquinaEstado.agregarEstado(e2);
		maquinaEstado.agregarEstado(e22);
		maquinaEstado.agregarEstado(e3);
		
		class TareaProtocolo extends Tarea{
		}

		Tarea t = new TareaProtocolo();
		t.setMaquinaEstado(maquinaEstado);
		
		t.setEstadoActual(e2);
		System.out.println("Tarea actual:"+t.getEstadoActual().getDescripcion());

		t.avanzarEstado();
		System.out.println("Tarea actual:"+t.getEstadoActual().getDescripcion());
		
		t.avanzarEstado();
		System.out.println("Tarea actual:"+t.getEstadoActual().getDescripcion());

		t.retrocederEstado();
		System.out.println("Tarea actual:"+t.getEstadoActual().getDescripcion());
		
		t.retrocederEstado();
		System.out.println("Tarea actual:"+t.getEstadoActual().getDescripcion());
		
		t.retrocederEstado();
		System.out.println("Tarea actual:"+t.getEstadoActual().getDescripcion());
		
		t.retrocederEstado();
		System.out.println("Tarea actual:"+t.getEstadoActual().getDescripcion());
		
		t.retrocederEstado();
		System.out.println("Tarea actual:"+t.getEstadoActual().getDescripcion());

		t.retrocederEstado();
		System.out.println("Tarea actual:"+t.getEstadoActual().getDescripcion());
	
	}
	
}
