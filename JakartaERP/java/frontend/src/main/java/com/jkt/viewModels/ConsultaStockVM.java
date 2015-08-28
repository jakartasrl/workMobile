package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.apache.commons.lang.StringUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.util.Clients;
import org.zkoss.zul.Caption;
import org.zkoss.zul.Groupbox;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.DetalleCaracteristicaProductoOV;
import com.jkt.ov.FiltroProductosOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListDetalleCaracteristicaProductoListOV;

@Data
public class ConsultaStockVM extends ViewModel {

	private static final String ADDITIONAL = "...";
	private static final int MAX_WIDTH_DESCRIPTION = 9;
	private static final int MAX_WIDTH_CODIGO = 4;
	private String filtroCodigo="";
	private String filtroDescripcion="";
	private String descripcionFiltro="Filtro";
	private boolean filtroProductoActivo=false;
	private DescriptibleOV tipoProductoSeleccionado;
	
	private List<DescriptibleOV> productos = new ArrayList<DescriptibleOV>();
	private List<DescriptibleOV> tiposDeProducto = new ArrayList<DescriptibleOV>();
	private List<DetalleCaracteristicaProductoOV> detallesTipoProducto = new ArrayList<DetalleCaracteristicaProductoOV>();
	
	private void mostrarMensajeInfo(String msg){
		mostrarMensaje(msg,"info");
	}
	
	private void mostrarMensajeError(String msg){
		mostrarMensaje(msg,"error");
	}
	
	private void mostrarMensaje(String msg, String tipo){
		Clients.showNotification(msg, tipo, null, "center", 1000);
	}
	
	@Init
	public void init(){
		tiposDeProducto = ((ListDescriptibleOV)Operaciones.ejecutar("TraerTiposDeProducto", ListDescriptibleOV.class)).getList();
	}
	
	@Override
	@GlobalCommand("actualizacionGrilla")
	@NotifyChange("productos")
	public void actualizar() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException {}

	@Override
	public void cancelarCustomizado() throws JakartaException {

	}

	@Override
	protected String retrieveMethod() {
		return "actualizacionGrilla";
	}
	
	@Command
	@NotifyChange({"productos","descripcionFiltro"})
	public void filtrar(@BindingParam("groupbox") Groupbox groupBox, @BindingParam("caption") Caption caption){
		
		groupBox.setOpen(false);
		
		String codigo = formatCodigo();
		String descripcion = formatDescripcion();
		
		this.descripcionFiltro = String.format("Filtro : Codigo '%s' , Descripcion '%s'", codigo, descripcion);
		caption.setLabel(this.descripcionFiltro);
		
		this.productos=new ArrayList<DescriptibleOV>();
		
		
		FiltroProductosOV filtro = new FiltroProductosOV();
		filtro.setCodigo(this.filtroCodigo);
		filtro.setDescripcion(this.filtroDescripcion);
		filtro.setOidTipoProducto(String.valueOf(this.tipoProductoSeleccionado.getId()));
		filtro.setDetallesTipoProducto(this.detallesTipoProducto);
		
		/*
		 * Se agrega el elemento a una lista ya que no esta el fwk en condiciones de enviar una clase comun y corriente...
		 */
		List<DetalleCaracteristicaProductoOV> detalles = filtro.getDetallesTipoProducto();
		for (DetalleCaracteristicaProductoOV detalleCaracteristicaProductoOV : detalles) {
			if(detalleCaracteristicaProductoOV.getValorSeleccionado()!=null){
				detalleCaracteristicaProductoOV.setIdValorCombo(String.valueOf(detalleCaracteristicaProductoOV.getValorSeleccionado().getOid()));
				detalleCaracteristicaProductoOV.setCodigoCombo(detalleCaracteristicaProductoOV.getValorSeleccionado().getCodigo());
			}
		}
		
		this.productos = ((ListDescriptibleOV)Operaciones.ejecutar("buscarProductos", filtro, ListDescriptibleOV.class)).getList();
	}

	private String formatCodigo() {
		String codigo = this.filtroCodigo;
		if(codigo.length()>MAX_WIDTH_CODIGO){
			codigo = StringUtils.substring(codigo, 0, MAX_WIDTH_CODIGO);
			codigo.concat(ADDITIONAL);
		}
		return codigo;
	}

	private String formatDescripcion() {
		String descripcion = this.filtroDescripcion;
		if(descripcion.length()>MAX_WIDTH_DESCRIPTION){
			descripcion = StringUtils.substring(descripcion, 0, MAX_WIDTH_DESCRIPTION);
			descripcion.concat(ADDITIONAL);
		}
		return descripcion;
	}

	@Command
	public void limpiar(){
		redirectToMyself();
	}
	
	@Command
	@NotifyChange({"filtroProductoActivo","detallesTipoProducto"})
	public void activarFiltro(){
		this.filtroProductoActivo=true;
		
		ContainerOV container = new ContainerOV();
		container.setString1(String.valueOf(tipoProductoSeleccionado.getId()));
		detallesTipoProducto = ((ListDetalleCaracteristicaProductoListOV)Operaciones.ejecutar("RecuperarDetallesCaracteristicaProducto", container, ListDetalleCaracteristicaProductoListOV.class)).getList();
	}
	
}
