package com.jkt.ov;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.lang.StringUtils;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.cotizador.dominio.CotizadorDet;
import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode(callSuper=true)
public class ItemsOV extends ObjectView {


	/*
	 * Atributos para modulos de pedido, presupuesto y cotizacion.
	 * Son los detalles de cada una de estas entidades.
	 */
	private DescriptibleOV plantilla=new DescriptibleOV();
	private String descripcion;
	
	private DescriptibleOV productoOV=new DescriptibleOV();
	private Long idProducto;
	
	private int idEstado;
	private boolean autorizado=false;
	
	private DescriptibleOV tipoVenta=new DescriptibleOV();
	private int tipo=0;
	
	private String referencia;
	private int cantidad;
	private DescriptibleOV moneda=new DescriptibleOV();
	private Long idMoneda;
	private String codMoneda;
	
	private double importe;
	private double importeTotal;
	
	private Long idDeterminacion;
	private String codDeterminacion;
	private String descDeterminacion;
	private String codigo;
	private String descripcionDeterminacion;
	private String codAnalisis;
	private String desAnalisis;
	
	private char tipoItem;
	
	
	public ItemsOV(){
		Random rand = new Random();
	    int randomNum = rand.nextInt((10000 - 1) + 1) + 1;
		
		this.plantilla.setId(randomNum);
	}
	
	/*
	 * Atributo descripcion abreviada para mostrar vacia en el editor de items de la planificacion de tareas
	 */
	private String descripcionAbreviada=StringUtils.EMPTY;
	
	
	/*
	 * Atributos usados para el cotizador
	 * Encabezado de una cotizacion cuando se usa el cotizador.
	 */
	private List<TituloModeloCotizadorOV> titulos=new ArrayList<TituloModeloCotizadorOV>();
	private String nroComprobante;
	private String vendedor;
	private String clienteSucursal;
//	private Date fecha;

	private CotizadorDet cotizadorDet;
	private long idCotizador;
	private Date fecha;
	
	private ModeloCotizadorOV modeloCotizador = new ModeloCotizadorOV();
	private long idModeloCotizador;
	private String codModeloCotizador;
	private String descModeloCotizador;

}
