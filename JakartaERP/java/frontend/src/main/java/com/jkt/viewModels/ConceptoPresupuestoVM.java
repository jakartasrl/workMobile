package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;
import lombok.EqualsAndHashCode;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;

import com.jkt.common.Operaciones;
import com.jkt.cotizador.dominio.ConceptoPresupuesto;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ConceptoPresupuestoOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ListConceptoPresupuestoOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ParametroOV;

/**
 * {@link ViewModel} para la clase {@link ConceptoPresupuesto}
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class ConceptoPresupuestoVM extends ViewModel implements IBasicOperations{

	private static final String KEY_PARAMETRO_CLASIFICADOR = "ClasifConceptos";
	private long idClasificador;
	
	private List<ConceptoPresupuestoOV> conceptos = new ArrayList<ConceptoPresupuestoOV>();
	
	private List<DescriptibleOV> componentesValor = new ArrayList<DescriptibleOV>();
	private Map<String, DescriptibleOV> componentesValorMapa = new HashMap<String, DescriptibleOV>(); 
	
//	private List<DescriptibleOV> monedas=new ArrayList<DescriptibleOV>();
//	private List<DescriptibleOV> unidadesMedida=new ArrayList<DescriptibleOV>();
//	
	/*
	 * Mapas para recuperar con ID moneda, y unidad de medida.
	 * Con esto evito tener q ir a buscar a la base de datos todo el tiempo...
	 */
	
	
	@Init(superclass=true)
	public void init() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException{
		
		if(isCargadoDesdeSession()){
			return;
		}
		
		log.info("Recuperando parametro de clasificador...");
		ParametroOV paramClasificador = (ParametroOV) Operaciones.ejecutar("TraerParametro", new ContainerOV(KEY_PARAMETRO_CLASIFICADOR), ParametroOV.class);
		this.idClasificador = Long.valueOf(paramClasificador.getValorNumero());

		log.info("Recuperando componentes dependiente del parametro de clasificador...");
		HelperOV helperOV = new HelperOV();
		helperOV.setOidEntidadMaestra(String.valueOf(this.idClasificador));
		this.componentesValor = ((ListDescriptibleOV) Operaciones.ejecutar("FiltroValoresClasificador",helperOV , ListDescriptibleOV.class)).getList();

		for (DescriptibleOV descriptibleOV : componentesValor) {
			this.componentesValorMapa.put(String.valueOf(descriptibleOV.getId()), descriptibleOV);
		}
		
		this.buscar();

	}
	
	@Command("agregarElemento")
	@NotifyChange("conceptos")
	public void agregar(){
		ConceptoPresupuestoOV conceptoPresupuestoOV = new ConceptoPresupuestoOV();
		conceptoPresupuestoOV.setComponenteValor(this.componentesValor.isEmpty()?null:this.componentesValor.get(0));
		this.conceptos.add(conceptoPresupuestoOV);
	}
	
	
	@Override
	@GlobalCommand("actualizar")
	@NotifyChange({"conceptos"})
	public void actualizar() {}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		try {
			this.init();
		} catch (IllegalAccessException e) {
			throw new JakartaException("Ocurrio un error al intentar inicializar la pantalla.");
		} catch (IllegalArgumentException e) {
			throw new JakartaException("Ocurrio un error al intentar inicializar la pantalla.");
		} catch (InvocationTargetException e) {
			throw new JakartaException("Ocurrio un error al intentar inicializar la pantalla.");
		}
	}

	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}

	@Override
	@Command
	public void guardar() throws JakartaException {
		validar();
		
		//guarda uno a uno los conceptos presupuestos.
		for (ConceptoPresupuestoOV concepto : conceptos) {
			
			concepto.setIdComponenteValor(concepto.getComponenteValor().getId());
			concepto.setIdMoneda(concepto.getMoneda().getId());
			concepto.setIdUnidadMedida(concepto.getUnidadMedida().getId());
			
			Operaciones.ejecutar("guardarConcepto", concepto);
		}
		
		Executions.sendRedirect("/pantallas/index/index-conceptos.zul");

	}

	private void validar() throws JakartaException {
		for (ConceptoPresupuestoOV concepto : conceptos) {
			
			if(concepto.getMoneda().getId()==0L){
				throw new JakartaException("Valide la moneda en los items");
			}
			
			if(concepto.getUnidadMedida().getId()==0L){
				throw new JakartaException("Valide la unidad de medida en los items");
			}
			
		}
	}

	@Override
	public void nuevo() throws JakartaException {
		throw new JakartaException("No debería implementarse esta operación en esta clase.");
	}

	@Override
	@Command
	@NotifyChange("conceptos")
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		
		this.conceptos = ((ListConceptoPresupuestoOV) Operaciones.ejecutar("TraerConceptoPresupuesto", new ContainerOV("conceptoPresupuesto"), ListConceptoPresupuestoOV.class)).getList();

		for (ConceptoPresupuestoOV concepto : this.conceptos) {
			concepto.setComponenteValor(this.componentesValorMapa.get(String.valueOf(concepto.getIdComponenteValor())));
			
			/*
			 * Esta lineas hacen que no se tenga q ir a buscar a la base de datos por cada elemento,
			 * para tener q ir a buscar las monedas y unidades de medida.
			 * 
			 */
			
			DescriptibleOV unidadMedida =  new DescriptibleOV();
			unidadMedida.setId(concepto.getIdUnidadMedida());
			unidadMedida.setCodigo(concepto.getCodigoUnidadMedida());
			unidadMedida.setDescripcion(concepto.getDescripcionUnidadMedida());
			concepto.setUnidadMedida(unidadMedida);
			
			DescriptibleOV moneda =  new DescriptibleOV();
			moneda.setId(concepto.getIdMoneda());
			moneda.setCodigo(concepto.getCodigoMoneda());
			moneda.setDescripcion(concepto.getDescripcionMoneda());
			concepto.setMoneda(moneda);
			
		}
		
	}

}
