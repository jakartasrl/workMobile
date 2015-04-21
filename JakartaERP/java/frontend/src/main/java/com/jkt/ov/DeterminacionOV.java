package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.view.ObjectView;

/**
 * {@link ObjectView} de una {@link Determinacion} Habria que tratar de no tener
 * 50 OVS para una determinacion, sino que la opcion es ir agregando los pocos
 * campos necesarios ac�.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
@EqualsAndHashCode(callSuper=true)
public class DeterminacionOV extends ObjectView {

	private String idItem;
	private String codigo;
	private String descripcion;
	private String codAnalisis;
	private String desAnalisis;
	private double importe;
	
	private DescriptibleOV moneda;
	private String leyendaValorCero;
	private boolean calculaResultado;
	
	private String tipoResultado;
			
	private Long idTipoResultado;
	private String descTipoResultado;
	
	private String formato;
	
	private Long idFormato;
	private String descFormato;
	
	private List<MetodoOV> metodos = new ArrayList<MetodoOV>();
	private List<VariableOV> variables = new ArrayList<VariableOV>();
	
	private List<DescriptibleOV> listTipoResultado = new ArrayList<DescriptibleOV>();
	private List<DescriptibleOV> listFormato = new ArrayList<DescriptibleOV>();
	
	private LaboratorioOV laboratorio;
	private long idLaboratorio;
	
}



