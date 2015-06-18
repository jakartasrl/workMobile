import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import org.junit.Test;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.laboratorio.dominio.Expresion;

public class ExpresionesTest {

	@Test
	public void validarExpresion() {
		
		String expresion ="A + B - 100";
		Expresion exp = new Expresion();
		try {
			exp.validar(expresion);
		} catch (ValidacionDeNegocioException e) {
			System.out.println("Resultado de validacion : " +  e.getMessage());
		} 
				
	    transformarExpresion(expresion);
	   	   		
	}

	private void transformarExpresion(String exp) {
		
		List<String> operadores = new ArrayList<String>();
		String variablesYConstantes = "";
		
		for (int x=0; x < exp.length(); x++){
			switch (exp.codePointAt(x)) {
				case '+':
				case '-':
				case '*':
				case '/':
					String op = (new StringBuffer().append(exp.charAt(x))).toString();
					operadores.add(op);
					break;
				default:
					break;
			}
			
		}
		      
		StringTokenizer tokens=new StringTokenizer(exp," +-*/");
		while(tokens.hasMoreTokens()){
			String currentToken = tokens.nextToken();
			if (!this.esNumero(currentToken)){
				variablesYConstantes += "#{" + currentToken + "}" + "|";
			} else {
				variablesYConstantes += currentToken;
			}
		}
		
		this.armarExpresion(variablesYConstantes,operadores);
				
	}
	
	private void armarExpresion(String variablesYConstantes, List<String> operadores) {
		
		String result = "";
		
		int i = 0;
		StringTokenizer tokens = new StringTokenizer(variablesYConstantes,"|");
		while(tokens.hasMoreTokens()){
			String currentToken = tokens.nextToken();
			if (tokens.hasMoreTokens()){
				result += currentToken + operadores.get(i++);
			} else {
				result += currentToken;
			}
		}
		
		System.out.println("Cadena resultante: " + result);
		
	}

	private boolean esNumero(String cadena){
		try {
			Integer.parseInt(cadena);
			return true;
		} catch (NumberFormatException nfe){
			return false;
		}
		
	}
	
}
