import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;
import java.util.StringTokenizer;

import net.sourceforge.jeval.EvaluationException;
import net.sourceforge.jeval.Evaluator;

import org.junit.Test;

import com.jkt.laboratorio.dominio.Variable;
import com.jkt.laboratorio.procesos.ExpresionVariableResolver;

public class ExpresionesTest implements Observer  {

	@Test
	public void validarResultados() throws EvaluationException{
		
		List<Variable> variablesDeMetodo = new ArrayList<Variable>();
		Variable v1 = new Variable();
		v1.setCodigo("A");
		v1.setValorInput(44);
		v1.setInput(true);
		
		Variable v2 = new Variable();
		v2.setCodigo("B");
		v2.setValorInput(55);
		v2.setInput(true);
		
		
		Variable vC = new Variable();
		vC.setCodigo("C");
		vC.setValorInput(55);
		vC.setInput(false);
		vC.setExpresion("A + B");
		
		Variable vR = new Variable();
		vR.setCodigo("D");
		vR.setValorInput(55);
		vR.setInput(false);
		vR.setExpresion("C + B");
		
		variablesDeMetodo.add(v1);
		variablesDeMetodo.add(v2);
		variablesDeMetodo.add(vC);
		
		List<Variable> variablesSimples = new ArrayList<Variable>();

		Evaluator evaluator = new Evaluator();
		Map<String, Variable> mapa= new HashMap<String, Variable>();

		for (Variable variable : variablesDeMetodo) {
			mapa.put(variable.getCodigo(), variable); 
		}

		evaluator.setVariables(mapa);
		evaluator.setVariableResolver(new ExpresionVariableResolver(this , mapa));
		String variableA = evaluator.getVariableValue("A");
		String variableC = evaluator.getVariableValue("C");
		
	}
	
		private String transformarExpresion(String exp) {

			List<String> operadores = new ArrayList<String>();
			String variablesYConstantes = "";

			for (int x = 0; x < exp.length(); x++) {
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

			StringTokenizer tokens = new StringTokenizer(exp, " +-*/");
			while (tokens.hasMoreTokens()) {
				String currentToken = tokens.nextToken();
				if (!this.esNumero(currentToken)) {
					variablesYConstantes += "#{" + currentToken + "}" + "|";
				} else {
					variablesYConstantes += currentToken;
				}
			}

			return this.armarExpresion(variablesYConstantes, operadores);

		}

		private String armarExpresion(String variablesYConstantes,
				List<String> operadores) {

			String result = "";
			int i = 0;
			StringTokenizer tokens = new StringTokenizer(variablesYConstantes, "|");
			while (tokens.hasMoreTokens()) {
				String currentToken = tokens.nextToken();
				if (tokens.hasMoreTokens()) {
					result += currentToken + operadores.get(i++);
				} else {
					result += currentToken;
				}
			}

			return result;

		}

		private boolean esNumero(String cadena) {
			try {
				Integer.parseInt(cadena);
				return true;
			} catch (NumberFormatException nfe) {
				return false;
			}
		}

		public void update(Observable arg0, Object arg1) {
			System.out.println();
		}
	
}
