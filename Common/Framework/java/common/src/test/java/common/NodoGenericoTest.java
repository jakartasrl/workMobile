package common;

import org.apache.commons.collections.Closure;
import org.joda.time.LocalDate;
import org.junit.Test;

import com.jkt.grafo.DatoNodo;
import com.jkt.grafo.NodoGenerico;

public class NodoGenericoTest {

	@Test
	public void isComplete() {

		class Tarea extends DatoNodo {

			public Tarea() {
				this.fechaInicio=LocalDate.now();
				this.fechaFin=LocalDate.now().plusDays(1);
			}
			
			public Tarea(LocalDate init, LocalDate end) {
				this.fechaInicio=init;
				this.fechaFin=end;
			}
			
			private LocalDate fechaInicio;
			private LocalDate fechaFin;

			public LocalDate getFechaInicio() {
				return fechaInicio;
			}

			public void setFechaInicio(LocalDate fechaInicio) {
				this.fechaInicio = fechaInicio;
			}

			public LocalDate getFechaFin() {
				return fechaFin;
			}

			public void setFechaFin(LocalDate fechaFin) {
				this.fechaFin = fechaFin;
			}

			@Override
			protected boolean sePuedeIniciar() {
				return false;
			}

			@Override
			protected boolean sePuedeFinalizar() {
				// TODO Auto-generated method stub
				return false;
			}
			
			
		}

		@SuppressWarnings("unused")
		class Agenda extends NodoGenerico<Tarea> {
			public Agenda(String desc) {
				super();
				setDescripcion(desc);
			}
			
			public void aumentarDias(){
				this.dfs(new Closure() {
					
					public void execute(Object input) {
						Agenda agenda=(Agenda) input;
						agenda.getDato().setFechaInicio(agenda.getDato().getFechaInicio().plusDays(4));
						System.out.println(agenda.getDato().getFechaInicio());
					}
				});
			}
			
//			public void agregarTarea(Tarea tarea){
//				if (tarea.getFechaInicio()>this.getDato().getFechaFin()) {
//				}
//			}
			
		}

		Agenda agenda = new Agenda("agenda");
		agenda.setDato(new Tarea());
		
		Agenda nodo2 = new Agenda("dos");
		nodo2.setDato(new Tarea());
		
		Agenda nodo3 = new Agenda("tres");
		nodo3.setDato(new Tarea());
		
		Agenda nodo4 = new Agenda("cuatro");
		nodo4.setDato(new Tarea());
		
		//armado de las relaciones
		agenda.agregarPosterior(nodo2);
		agenda.agregarPosterior(nodo3);
		nodo2.agregarPosterior(nodo4);
		nodo3.agregarPosterior(nodo4);
		nodo4.agregarPosterior(agenda);
		
		agenda.aumentarDias();
	}

}
