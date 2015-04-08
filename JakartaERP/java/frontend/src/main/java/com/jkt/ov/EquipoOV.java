package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ObjectView;

/**
 * {@link ObjectView} for entity {@link LaboratorioOV}
 * 
 * @author erubino
 *
 */
public class EquipoOV extends ObjectView {

	private String codigo;
	private String descripcion;
//	private Boolean activo=Boolean.FALSE;
	private List<ValoresTablaOV> marcas = new ArrayList();
	private ValoresTablaOV marca= new ValoresTablaOV();
	private DescriptibleOV clienteOV;
	private TipoProductoOV tipoProductoOV;
	private String nroSerie;
	
	private Long idMarca;
	private String descMarca;

	private Long idCliente;
	private String codCliente;
	private String descCliente;
	
	private Long idTipoProducto;
	private String codTipoProducto;
	
	private List<CaracteristicaProductoOV> caracteristicas = new ArrayList();
	private List<EquipoCaracteristicaOV> caracteristicasEquipo = new ArrayList();
	
	public String getCodTipoProducto() {
		return codTipoProducto;
	}

	public void setCodTipoProducto(String codTipoProducto) {
		this.codTipoProducto = codTipoProducto;
	}

	public String getDescMarca() {
		return descMarca;
	}

	public void setDescMarca(String descMarca) {
		this.descMarca = descMarca;
	}

	public String getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(String codCliente) {
		this.codCliente = codCliente;
	}

	public String getDescCliente() {
		return descCliente;
	}

	public void setDescCliente(String descCliente) {
		this.descCliente = descCliente;
	}

	public List<EquipoCaracteristicaOV> getCaracteristicasEquipo() {
		return caracteristicasEquipo;
	}

	public void setCaracteristicasEquipo(
			List<EquipoCaracteristicaOV> caracteristicasEquipo) {
		this.caracteristicasEquipo = caracteristicasEquipo;
	}

	public Long getIdTipoProducto() {
		return idTipoProducto;
	}

	public void setIdTipoProducto(Long idTipoProducto) {
		this.idTipoProducto = idTipoProducto;
	}

	public Long getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Long idCliente) {
		this.idCliente = idCliente;
	}

	public Long getIdMarca() {
		return idMarca;
	}

	public void setIdMarca(Long idMarca) {
		this.idMarca = idMarca;
	}

//	public Boolean getActivo() {
//		return activo;
//	}
//
//	public void setActivo(Boolean activo) {
//		this.activo = activo;
//	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public List<ValoresTablaOV> getMarcas() {
		return marcas;
	}

	public void setMarcas(List<ValoresTablaOV> marcas) {
		this.marcas = marcas;
	}

	public ValoresTablaOV getMarca() {
		return marca;
	}

	public void setMarca(ValoresTablaOV marca) {
		this.marca = marca;
	}

	public DescriptibleOV getClienteOV() {
		return clienteOV;
	}

	public void setClienteOV(DescriptibleOV clienteOV) {
		this.clienteOV = clienteOV;
	}

	public TipoProductoOV getTipoProductoOV() {
		return tipoProductoOV;
	}

	public void setTipoProductoOV(TipoProductoOV tipoProductoOV) {
		this.tipoProductoOV = tipoProductoOV;
	}

	public String getNroSerie() {
		return nroSerie;
	}

	public void setNroSerie(String nroSerie) {
		this.nroSerie = nroSerie;
	}

	public List<CaracteristicaProductoOV> getCaracteristicas() {
		return caracteristicas;
	}

	public void setCaracteristicas(List<CaracteristicaProductoOV> caracteristicas) {
		this.caracteristicas = caracteristicas;
	}
	
}
