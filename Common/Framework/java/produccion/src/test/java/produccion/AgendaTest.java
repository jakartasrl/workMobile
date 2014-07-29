package produccion;

import org.joda.time.LocalDate;
import org.junit.Test;

import com.jkt.agenda.Agenda;
import com.jkt.dominio.Tarea;

public class AgendaTest {

	@Test
	public void atrazarFechas(){
		
		Agenda agenda = new Agenda();
		agenda.setDescripcion("primera");
		Tarea tarea = new Tarea();
		tarea.setFechaInicio(LocalDate.now().minusDays(10));
		tarea.setFechaFin(LocalDate.now().minusDays(9));
		agenda.setDato(tarea);
		
		Agenda agenda2 = new Agenda();
		agenda2.setDescripcion("segunda");
		Tarea tarea2 = new Tarea();
		tarea2.setFechaInicio(LocalDate.now().minusDays(1));
		tarea2.setFechaFin(LocalDate.now().minusDays(2));
		agenda2.setDato(tarea2);
		
		agenda.agregarTarea(agenda2);

		agenda.atrazarFechas();
		
	}
	
}
