package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.view.ObjectView;

/**
 * {@link ObjectView} for entity {@link LaboratorioOV}
 * 
 * @author erubino
 *
 */
@Data
@EqualsAndHashCode(of={"codigo"},callSuper=true)
public class EquipoOV extends ObjectView {

	private String codigo;
	private String descripcion;
//	private Boolean activo=Boolean.FALSE;
	private List<ValoresTablaOV> marcas = new ArrayList();
	private ValoresTablaOV marca= new ValoresTablaOV();
	private DescriptibleOV clienteOV;
	private TipoProductoOV tipoProductoOV;
	private String nroSerie;
	
	private String fluidoAislante;
	private String denominacionInterna;
	
	private Long idMarca;
	private String descMarca;

	private Long idCliente;
	private String codCliente;
	private String descCliente;
	
	private Long idTipoProducto;
	private String codTipoProducto;
	private String descTipoProducto;
	
	private List<CaracteristicaProductoOV> caracteristicas = new ArrayList();
	private List<EquipoCaracteristicaOV> caracteristicasEquipo = new ArrayList();
	
}
