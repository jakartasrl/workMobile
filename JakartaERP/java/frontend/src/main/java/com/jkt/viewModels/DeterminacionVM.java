package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import lombok.Data;

import org.apache.commons.beanutils.BeanUtils;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.DeterminacionOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListValorEsperadoOV;
import com.jkt.ov.ListVariableOV;
import com.jkt.ov.MetodoOV;
import com.jkt.ov.ValorEsperadoOV;
import com.jkt.ov.VariableOV;

@Data
public class DeterminacionVM extends ViewModel implements IBasicOperations {
	
	private DeterminacionOV determinacion = new DeterminacionOV();
		
	@Init
	@NotifyChange("determinacion")
	public void init() {
		
		try {
			ViewModel recuperarDesdeSesion = recuperarDesdeSesion(this.getClass().getCanonicalName());
			if(recuperarDesdeSesion!=null){
				BeanUtils.copyProperties(this, recuperarDesdeSesion);
				return;// true; 
			}
		} catch (IllegalAccessException e) {
			throw new RuntimeException(e.getMessage());
		} catch (InvocationTargetException e) {
			throw new RuntimeException(e.getMessage());
		}
		
		this.setTitulo("Determinaciones");
		this.determinacion.setIdLaboratorio(1);
		this.determinacion.setListTipoResultado(this.cargarListTipoResultados());
		this.determinacion.setListFormato(this.cargarListFormato());
	}
	
	@Command
	@NotifyChange("determinacion")
	public void asignarUnicoResultado(){
		
		List<MetodoOV> metodos = this.determinacion.getMetodos();
		for (MetodoOV metodoOV : metodos) {
			metodoOV.setVariables(new ArrayList<VariableOV>());
			
			VariableOV variable=new VariableOV();
			variable.setCodigo("Resultado final");
			variable.setDescripcion("Resultado final");
			variable.setInput(true);
			
			metodoOV.getVariables().add(variable);
		}
		
	}

	@Command("guardar")
	@NotifyChange("determinacion")
	public void guardar() throws JakartaException {
		
		if(!validarDeterminacion()){
			return;
		}
		
		List<MetodoOV> metodos = this.getDeterminacion().getMetodos();
		for (MetodoOV metodoOV : metodos) {

			
			if(!validarTodosLosMetodos(metodos)){
				return;
			}
			
			metodoOV.setIdDeterminacion(-1L);

			List<VariableOV> variablesXMetodo = metodoOV.getVariables();

			List listaVariablesTransientes = new ArrayList<VariableOV>();
			for (VariableOV variableOV : variablesXMetodo) {
				VariableOV nuevaVar = new VariableOV();
				nuevaVar.setCodigo(variableOV.getCodigo());
				listaVariablesTransientes.add(nuevaVar);
			}

			for (VariableOV variableOV : variablesXMetodo) {
				variableOV.setVariables(listaVariablesTransientes);
			}

		}
	
//		this.parsearCadenaExpresion(metodos);

		this.determinacion.setDescTipoResultado(this.determinacion.getTipoResultado().getCodigo());
		this.determinacion.setDescFormato(this.determinacion.getFormato().getCodigo());
		
		Operaciones.ejecutar("saveDeterminacion", this.determinacion );
		Executions.sendRedirect("/pantallas/index/index-determinacion.zul");

		
	}

	private void parsearCadenaExpresion(List<MetodoOV> metodos) {
		
		for (MetodoOV metodoOV : metodos){
			List<VariableOV> variables = metodoOV.getVariables();
			for (VariableOV variableOV : variables) {
				
				String nuevaCadena = "";
				
				if (!variableOV.isInput()) {
					String cadenaExpresion = variableOV.getExpresionCadena();
					StringTokenizer tokens=new StringTokenizer(cadenaExpresion,"#{}");
					while(tokens.hasMoreTokens()){
						nuevaCadena = nuevaCadena + tokens.nextToken();
					}
					variableOV.setExpresionCadena(nuevaCadena);
				}
			}
		}
		
	}

	private boolean validarTodosLosMetodos(List<MetodoOV> metodos) {
		for (MetodoOV metodoOV : metodos) {
			List<VariableOV> variables = metodoOV.getVariables();
			for (VariableOV variableOV : variables) {
				
				if (this.variableRepetida(variableOV,variables) > 1){
					Messagebox.show(String.format("Metodo '%s' : La variable '%s' se encuentra repetida.", metodoOV.getMetodo(), variableOV.getCodigo()));
					return false;
				}
				
				if (!variableOV.isInput()) {
					
					if (variableOV.getExpresionCadena()==null || variableOV.getExpresionCadena().isEmpty()) {
						Messagebox.show(String.format("Metodo %s : Complete la expresión en la variable %s.", metodoOV.getMetodo(), variableOV.getCodigo()));
						return false;
					}
					
					if(!validarExpresion(metodoOV.getMetodo(),variableOV.getExpresionCadena(), variables)){
						return false;
					}
					
					if (verificarCodigo(variableOV, variableOV.getExpresionCadena())){
						Messagebox.show(String.format("Metodo '%s' : La variable '%s' se encuentra en ambos lados de la expresion.", metodoOV.getMetodo(), variableOV.getCodigo()));
						return false;
					}
					
				}
			}
		}
		return true;
	}

	private boolean verificarCodigo(VariableOV variableOV, String expresion) {
		
		expresion = this.transformarExpresion(expresion);
		
		Object containerOV=new ContainerOV(expresion);
		ListDescriptibleOV ejecutar = (ListDescriptibleOV) Operaciones.ejecutar("ValidarExpresion", containerOV, ListDescriptibleOV.class);
		List list = ejecutar.getList();
		
		DescriptibleOV currentExtVar;
		for (Object extractedVar : list) {
			currentExtVar=(DescriptibleOV) extractedVar;
			if (currentExtVar.getCodigo().equals(variableOV.getCodigo())) {
				return true;
			}
		}
		
		return false;
		
	}

	private int variableRepetida(VariableOV variableOV, List<VariableOV> variables) {
		
		int cont = 0;
		
		for (VariableOV var : variables){
			if (var.getCodigo().equals(variableOV.getCodigo())){
				cont++;
				
			}
		}
		
		return cont;
			
	}

	private boolean validarDeterminacion() {
		
		if (determinacion.getCodigo()==null || determinacion.getCodigo().isEmpty()) {
			Messagebox.show("Debe ingresar un codigo para la determinacion.");
			return false;
		}
		
		if (determinacion.getDescripcion()==null || determinacion.getDescripcion().isEmpty()) {
			Messagebox.show("Debe ingresar una descripcion para la determinacion.");
			return false;
		}
		
		if (determinacion.getFormato()==null) {
			Messagebox.show("Debe ingresar un formato.");
			return false;
		}
		if (determinacion.getTipoResultado()==null) {
			Messagebox.show("Debe ingresar un tipo de resultado.");
			return false;
		}
		if (determinacion.getMetodos().isEmpty()) {
			Messagebox.show("Debe ingresar como minimo un metodo.");
			return false;
		}
		return true;
	}

	@Command
	@NotifyChange({"determinacion"})
	public void nuevo() throws JakartaException {
		this.determinacion = new DeterminacionOV();
		
		this.init();
	}

	@Override
	@Command
	public void buscar() {
		try {
			openComplexHelper("determinacion", "", this.determinacion, "traerDeterminacion", "Determinaciones", "Código", "Descripción",true, "","");
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (JakartaException e) {
			e.printStackTrace();
		}

	}

	@GlobalCommand("actualizar")
	@NotifyChange("determinacion")
	public void actualizar() {
		log.warn("Actualizando datos...");
	}
	
	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}
	
	@SuppressWarnings("unchecked")
	@NotifyChange("determinacion")
	public void traerDeterminacion() {
		
		long idDeterminacion = determinacion.getId();
		determinacion=new DeterminacionOV();
		String entidad = "Determinacion";
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(String.valueOf(idDeterminacion));
		containerOV.setString2(entidad);
		
		DeterminacionOV det = (DeterminacionOV) Operaciones.ejecutar("TraerDeterminacion", containerOV, DeterminacionOV.class);
		
		ContainerOV containerOV2 = new ContainerOV();
		for (MetodoOV metodo : det.getMetodos()) {
			
			long idMetodo = metodo.getId();
			containerOV2.setString1(String.valueOf(idMetodo));
		
			List<ValorEsperadoOV> valoresEsperados = ((ListValorEsperadoOV) Operaciones.ejecutar("TraerValoresEsperados", containerOV2, ListValorEsperadoOV.class)).getList();
			
			ContainerOV containerOV3 = new ContainerOV();
			containerOV3.setString1(String.valueOf(idMetodo));
			List<VariableOV> variables = ((ListVariableOV) Operaciones.ejecutar("TraerVariables", containerOV3, ListVariableOV.class)).getList();
			
			metodo.setVariables(variables);
			metodo.setValoresEsperados(valoresEsperados);
			metodo.getDeterminacion().setId(this.determinacion.getId());
			metodo.setIdDeterminacion(this.determinacion.getId());
			
		}
		
		det.setListTipoResultado(this.cargarListTipoResultados());
		det.setListFormato(this.cargarListFormato());
		
		String idTipoResultado = det.getIdTipoResultado();
		DescriptibleOV tipoResultadoSeleccionado=null;
		for (DescriptibleOV tipoResultado : det.getListTipoResultado()) {
			if (tipoResultado.getCodigo().equals(idTipoResultado)) {
				tipoResultadoSeleccionado=tipoResultado;
				break;
			}
		}
		
		det.setTipoResultado(tipoResultadoSeleccionado);
		
		String cadenaFormato = det.getIdFormato();
		DescriptibleOV formatoSeleccionado=null;
		for (DescriptibleOV formato : det.getListFormato()) {
			if (formato.getCodigo().equals(cadenaFormato)) {
				formatoSeleccionado=formato;
				break;
			}
		}
		
		det.setFormato(formatoSeleccionado);
		
		this.setDeterminacion(det);
	}

	@Command
	@NotifyChange("determinacion")
	public void agregarMetodo(@BindingParam("dato") String name, @BindingParam("componente") Textbox text) throws JakartaException{
		
		if(!this.validarMetodo(name)){
			return;
		};
		
		MetodoOV metodo = new MetodoOV();
		metodo.setMetodo(name);
		metodo.setIdDeterminacion(this.determinacion.getId()); // le seteamos el id de la determinacion
		this.determinacion.getMetodos().add(metodo);
		text.setValue("");
	
	}

	@Command
	@NotifyChange("determinacion")
	public void eliminarMetodo(@BindingParam("nroMetodo") int nroMetodo) throws JakartaException{
		
		if (this.determinacion.getMetodos().isEmpty()) {
			Messagebox.show("No hay metodos a eliminar.");
		}else{
//			int pos = this.determinacion.getMetodos().size();
			this.determinacion.getMetodos().remove(nroMetodo);
		}
	
	
	}
	
	private boolean validarMetodo(String name) throws JakartaException {
		
		if (name.equals("")){
			Messagebox.show("Debe ingresar un nombre al metodo");
			return false;
		}
		
		for (MetodoOV metodo : this.determinacion.getMetodos()){
			if (name.equals(metodo.getMetodo())){
				Messagebox.show("Ya existe un metodo con el nombre: " + name);
				return false;
			}
		}
		return true;
	
	}

	@Command
	@NotifyChange("determinacion")
	public void borrarValor(@BindingParam("metodoActual") MetodoOV m){
	
		if (m.getValoresEsperados().isEmpty()) {
			Messagebox.show("No hay valores a borrar.");
			return;
		}
		m.getValoresEsperados().remove(m.getValoresEsperados().size()-1);
		
	}

	@Command
	@NotifyChange("determinacion")
	public void borrarVar(@BindingParam("metodoActual") MetodoOV m){
		
		if (m.getVariables().isEmpty()) {
			Messagebox.show("No hay variables a borrar.");
			return;
		}
		m.getVariables().remove(m.getVariables().size()-1);
		
	}
	
	@Command("agregarValor")
	@NotifyChange("determinacion")
	public void agregarValor(@BindingParam("metodoActual") MetodoOV m){
		
		ValorEsperadoOV valor = new ValorEsperadoOV();
		m.getValoresEsperados().add(valor);

	}
	
	@Command("agregarVariable")
	@NotifyChange("determinacion")
	public void agregarVariable(@BindingParam("metodoActual") MetodoOV m){
		
		VariableOV variable = new VariableOV();
//		variable.setCodigo("Nueva Variable");
		m.getVariables().add(variable);
		
	}
	
	private List<DescriptibleOV> cargarListFormato() {
		
		List <DescriptibleOV> listFormato = new ArrayList();
		
		listFormato.add(new DescriptibleOV("0"));
		listFormato.add(new DescriptibleOV("0.0"));
		listFormato.add(new DescriptibleOV("0.00"));
		listFormato.add(new DescriptibleOV("0.000"));
		listFormato.add(new DescriptibleOV("0.0000"));
		listFormato.add(new DescriptibleOV("0E-000"));
		
		return listFormato;
			
	}
	
	private List<DescriptibleOV> cargarListTipoResultados() {
		
		List <DescriptibleOV> listTipoResultado = new ArrayList();
		
		listTipoResultado.add(new DescriptibleOV("Numero"));
		listTipoResultado.add(new DescriptibleOV("Boolean"));
		listTipoResultado.add(new DescriptibleOV("Leyenda"));
		
		return listTipoResultado;
		
	}
	
	@Command
	public boolean validarExpresion(@BindingParam("metodo") String metodoName, @BindingParam("expresion") String expresion, @BindingParam("variables") List<VariableOV> variables){
		
		String expresionTransformada = "";
		expresionTransformada = this.transformarExpresion(expresion);
		
		/*
		 * Se valida el formato
		 */
		Object containerOV=new ContainerOV(expresionTransformada);
		ListDescriptibleOV ejecutar = (ListDescriptibleOV) Operaciones.ejecutar("ValidarExpresion", containerOV, ListDescriptibleOV.class);
		List list = ejecutar.getList();
		
		/*
		 * Si la expresion es validar, se validan todas las variables y su inclusion en el conjunto ya existente.
		 */
		
		/*
		 * Se carga la lista de variables en cadenas simples para luego comparar con equals
		 */
		List<String> variablesCargadas=new ArrayList<String>();
		for (VariableOV variableOV : variables) {
			variablesCargadas.add(variableOV.getCodigo());			
		}
		
		DescriptibleOV currentExtVar;
		for (Object extractedVar : list) {
			currentExtVar=(DescriptibleOV) extractedVar;
			if (!variablesCargadas.contains(currentExtVar.getCodigo())) {
				Messagebox.show(String.format("Metodo %s . No existe la variable '%s' para la expresion '%s'", metodoName, currentExtVar.getCodigo(), expresion));
				return false;
			}
		}
			
		return true;
		
		
	}

	private String transformarExpresion(String exp) {
		
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
		
		return this.armarExpresion(variablesYConstantes,operadores);
		
	}

	private String armarExpresion(String variablesYConstantes, List<String> operadores) {
	
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
		
		return result;
		
	}

	private boolean esNumero(String cadena){
		try {
			Integer.parseInt(cadena);
			return true;
		} catch (NumberFormatException nfe){
			return false;
		}
		
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		this.nuevo();
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}

}
