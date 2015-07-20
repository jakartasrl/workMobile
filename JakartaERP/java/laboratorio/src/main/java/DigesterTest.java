

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import lombok.Data;
import org.apache.commons.digester3.Digester;
import org.junit.Test;
import com.jkt.contexto.PropiedadMatricial;
import com.jkt.excepcion.JakartaException;

@Data
public class DigesterTest {
		
	@Test
	public void validarPropiedades() throws Exception, Exception, JakartaException{
		
		String rutaPropiedades="caracteristicas.xml";		
		Digester digester = generateReaderOperaciones();
	
		InputStream in = this.getClass().getResourceAsStream(rutaPropiedades);
		
		List listPropiedades = (List) digester.parse(in);
		listPropiedades.size();
		
	}
	
	private Digester generateReaderOperaciones() {
		Digester digester = new Digester();
		digester.setValidating(false);
		
		digester.addObjectCreate("propiedades", ArrayList.class.getName());

		digester.addObjectCreate("propiedades/propiedad", PropiedadMatricial.class.getName());
		digester.addSetProperties("propiedades/propiedad");
		digester.addSetNext("propiedades/propiedad", "add", PropiedadMatricial.class.getName());
		
		return digester;
	}
		
}
