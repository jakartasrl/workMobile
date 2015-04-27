package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.Groupbox;
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.DeterminacionOV;
import com.jkt.ov.ListValorEsperadoOV;
import com.jkt.ov.ListVariableOV;
import com.jkt.ov.MetodoOV;
import com.jkt.ov.ValorEsperadoOV;
import com.jkt.ov.ValoresTablaOV;
import com.jkt.ov.VariableOV;

@Data
public class DeterminacionVM extends ViewModel implements IBasicOperations {
	
	private DeterminacionOV determinacion = new DeterminacionOV();
		
	@Init
	@NotifyChange("determinacion")
	public void init() {
		this.setTitulo("Determinaciones");
		this.determinacion.setIdLaboratorio(1);
		this.determinacion.setListTipoResultado(this.cargarListTipoResultados());
		this.determinacion.setListFormato(this.cargarListFormato());
	}

	@Command("guardar")
	@NotifyChange("determinacion")
	public void guardar() throws JakartaException {
		
		List<MetodoOV> metodos = this.getDeterminacion().getMetodos();
		for (MetodoOV metodoOV : metodos) {

			if (this.determinacion.getId() == 0) {
				metodoOV.setIdDeterminacion(-1L);
			}

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

		this.determinacion.setDescTipoResultado(this.determinacion.getTipoResultado().getDescripcion());
		this.determinacion.setDescFormato(this.determinacion.getFormato().getDescripcion());
		
		Operaciones.ejecutar("saveDeterminacion", this.determinacion );
		Messagebox.show("Determinacion Guardada Correctamente.");
		
	}

	@Command
	public void toogleAccordion(@BindingParam("element") Groupbox currentAccordion){
		if (currentAccordion.isOpen()) {
			currentAccordion.setOpen(false);
		}else{
			currentAccordion.setOpen(true);
		}
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
			this.openHelper("determinacion", "", this.determinacion, "traerDeterminacion", "Determinaciones", "Código", "Descripción");
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
		
		Long idTipoResultado = det.getIdTipoResultado();
		DescriptibleOV tipoResultadoSeleccionado=null;
		for (DescriptibleOV tipoResultado : det.getListTipoResultado()) {
			if (tipoResultado.getId()==idTipoResultado) {
				tipoResultadoSeleccionado=tipoResultado;
				break;
			}
		}
		
		det.setTipoResultado(tipoResultadoSeleccionado);
		
		Long idFormato = det.getIdFormato();
		DescriptibleOV formatoSeleccionado=null;
		for (DescriptibleOV formato : det.getListFormato()) {
			if (formato.getId()==idFormato) {
				formatoSeleccionado=formato;
				break;
			}
		}
		
		det.setFormato(formatoSeleccionado);
		
		this.setDeterminacion(det);
	}

	@Command
	@NotifyChange("determinacion")
	public void agregarMetodo(@BindingParam("dato") String name) throws JakartaException{
		
		this.validarMetodo(name);
		
		MetodoOV metodo = new MetodoOV();
		metodo.setMetodo(name);
		metodo.setIdDeterminacion(this.determinacion.getId()); // le seteamos el id de la determinacion
		this.determinacion.getMetodos().add(metodo);
	
	}
	
	private void validarMetodo(String name) throws JakartaException {
		
		if (name.equals("")){
			throw new JakartaException("Debe ingresar un nombre al metodo");
		}
		
		for (MetodoOV metodo : this.determinacion.getMetodos()){
			if (name.equals(metodo.getMetodo())){
				throw new JakartaException("Ya existe un metodo con el nombre: " + name);
			}
		}
	
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
		variable.setCodigo("Nueva Variable");
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
	public void validarExpresion(@BindingParam("expresion") String expresion, @BindingParam("variables") List<VariableOV> variables){
//		System.out.println();

//		Messagebox.show("TODO.");
//		for (VariableOV variableOV : variables) {
//			
//		}
		
	}

}
