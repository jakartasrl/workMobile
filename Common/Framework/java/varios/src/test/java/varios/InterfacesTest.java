package varios;

import org.junit.Test;

import com.jkt.dominio.IClasificable;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.Componente;


public class InterfacesTest {

	@Test
	public void testing(){
		class Leonardo implements IClasificable{
			private String cadena;
		}
		
		new Leonardo();
		new Leonardo();
		new Leonardo();
		new Leonardo();
		
		boolean assignableFrom = IClasificable.class.isAssignableFrom(Leonardo.class);
		boolean assignable = IClasificable.class.isAssignableFrom(Clasificador.class);
		
		
		Class<?>[] classes = IClasificable.class.getClasses();
		int i=classes.length;
	}
}
