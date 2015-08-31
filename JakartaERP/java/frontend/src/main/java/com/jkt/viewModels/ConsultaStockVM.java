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
import org.zkoss.zul.Messagebox;

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

	private static final String POSITION = "middle_center";
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
		Clients.showNotification(msg, tipo, null, POSITION, 1000);
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
		
		if(!preValidacionFiltros()){
			return;
		}
		
		
//		String codigo = formatCodigo();
//		String descripcion = formatDescripcion();
		
//		this.descripcionFiltro = String.format("Filtro : Codigo '%s' , Descripcion '%s'", codigo, descripcion);
//		this.descripcionFiltro = String.format("Filtro : Codigo '%s' , Descripcion '%s'", codigo, descripcion);
//		caption.setLabel(this.descripcionFiltro);
		
		this.productos=new ArrayList<DescriptibleOV>();
		
		
		FiltroProductosOV filtro = new FiltroProductosOV();
		filtro.setCodigo(this.filtroCodigo);
		filtro.setDescripcion(this.filtroDescripcion);
		if(this.tipoProductoSeleccionado!=null){
			filtro.setOidTipoProducto(String.valueOf(this.tipoProductoSeleccionado.getId()));
			filtro.setDetallesTipoProducto(this.detallesTipoProducto);
		}
		
		/*
		 * Se agrega el elemento a una lista ya que no esta el fwk en condiciones de enviar una clase comun y corriente...
		 */
		List<DetalleCaracteristicaProductoOV> detalles = filtro.getDetallesTipoProducto();

		//valida que se completen los combos.
//		if(this.filtroCodigo.isEmpty()){
		if(this.tipoProductoSeleccionado!=null){
			
		
			for (DetalleCaracteristicaProductoOV detalleCaracteristicaProductoOV : detalles) {
				if("COMPO".equals(detalleCaracteristicaProductoOV.getTipo())){
					if(detalleCaracteristicaProductoOV.getValorSeleccionado()==null){
						mostrarMensajeInfo("Complete el valor del filtro "+detalleCaracteristicaProductoOV.getDescripcion());
//						Clients.showNotification();
						return;
					}
				}
				
//				if("TEXT".equals(detalleCaracteristicaProductoOV.getTipo())){
//					if(detalleCaracteristicaProductoOV.getValorString()==null || detalleCaracteristicaProductoOV.getValorString().isEmpty()){
//						Messagebox.show("Complete el valor del filtro "+detalleCaracteristicaProductoOV.getDescripcion());
//						return;
//					}
//				}
				
			}
		
		}
		
		for (DetalleCaracteristicaProductoOV detalleCaracteristicaProductoOV : detalles) {
			if(detalleCaracteristicaProductoOV.getValorSeleccionado()!=null){
				detalleCaracteristicaProductoOV.setIdValorCombo(String.valueOf(detalleCaracteristicaProductoOV.getValorSeleccionado().getOid()));
				detalleCaracteristicaProductoOV.setCodigoCombo(detalleCaracteristicaProductoOV.getValorSeleccionado().getCodigo());
			}
		}
		
		this.productos = ((ListDescriptibleOV)Operaciones.ejecutar("buscarProductos", filtro, ListDescriptibleOV.class)).getList();
		groupBox.setOpen(false);
	}

	private boolean preValidacionFiltros() {
		
		if(this.filtroCodigo.isEmpty() && this.filtroDescripcion.isEmpty() && (this.tipoProductoSeleccionado==null || this.tipoProductoSeleccionado.getId()==0L)){
			this.mostrarMensajeInfo("Complete algun filtro para continuar.");
			return false;
		}
		
//		if(this.filtroCodigo.isEmpty() && this.filtroDescripcion.isEmpty()){
//			Messagebox.show("Complete el codigo o la descripción para realizar un filtro");
//			return false;
//		}

//		if(this.filtroCodigo.isEmpty()){ //si se filtra x descripcion, activar el filtro de productos
//			if(this.tipoProductoSeleccionado==null || this.tipoProductoSeleccionado.getId()==0L){
//				Messagebox.show("Complete el tipo de producto para realizar un filtro");
//				return false;
//			}
//		}
		
		return true;
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
