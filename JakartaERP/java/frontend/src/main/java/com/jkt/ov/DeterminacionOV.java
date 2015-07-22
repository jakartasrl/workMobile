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
public class DeterminacionOV extends DescriptibleOV {

	private String idItem;
	private String codAnalisis;
	private String desAnalisis;
	private double importe;
	
	private DescriptibleOV moneda;
	private String leyendaValorCero;
	private boolean calculaResultado;
	private boolean resultadoFinal;
	
	private DescriptibleOV tipoResultado;
			
	private String idTipoResultado;
	private String descTipoResultado;
	
	private DescriptibleOV formato;
	
	private String idFormato;
	private String descFormato;
	
	private List<MetodoOV> metodos = new ArrayList<MetodoOV>();
	private List<VariableOV> variables = new ArrayList<VariableOV>();
	
	private List<DescriptibleOV> listTipoResultado = new ArrayList<DescriptibleOV>();
	private List<DescriptibleOV> listFormato = new ArrayList<DescriptibleOV>();
	
	private LaboratorioOV laboratorio;
	private long idLaboratorio;
	
	private String comentario;
	private String descMetodo;
	
	private MetodoOV metodoUtilizado;
	private long idMetodoUtilizado;
	
}



