package com.jkt.viewModels;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListItemsOV;
import com.jkt.ov.NotaOV;
import com.jkt.ov.SucursalOV;

@Data
public abstract class ComprobanteVM extends ViewModel {

	protected DescriptibleOV clienteOV=new DescriptibleOV();
	protected SucursalOV sucursalOV=new SucursalOV();
	protected DescriptibleOV lPreciosOV=new DescriptibleOV();
	protected ListDescriptibleOV tiposVenta=new ListDescriptibleOV();
	protected List<ItemsOV> lDeterminacionesQuimicas=new ArrayList<ItemsOV>();
	protected List<ItemsOV> lDeterminacionesElectricas=new ArrayList<ItemsOV>();
	protected List<NotaOV> lNotas=new ArrayList<NotaOV>();
	protected List<ItemsOV> items = new ArrayList<ItemsOV>();
	protected List<ItemsOV> itemsArticulos = new ArrayList<ItemsOV>();
	protected ListDescriptibleOV lMonedas=new ListDescriptibleOV();
	protected DescriptibleOV vendedorOV=new DescriptibleOV();
	protected DescriptibleOV representanteOV=new DescriptibleOV();
	protected ListDescriptibleOV contactos=new ListDescriptibleOV();
	protected DescriptibleOV contactoSeleccionado= new DescriptibleOV();
	
	@NotifyChange({"items","lDeterminacionesQuimicas","lDeterminacionesElectricas","itemsArticulos"})
	@Command
	public void actualizarImporteTotal(@BindingParam("item") ItemsOV items){
		items.setImporteTotal(items.getImporte()*items.getCantidad());
	}
	
	protected boolean validarOV() {
		
		if (!validarDescriptible(clienteOV, "Complete el Cliente.")) {
			return false;
		}

		if (!validarDescriptible(sucursalOV, "Complete la sucursal.")) {
			return false;
		}

		if (!validarDescriptible(lPreciosOV, "Complete la lista de precios.")) {
			return false;
		}
		
		int nroItem=1;
		for (ItemsOV itemActual : this.items) {
			
			if (!validarDescriptible(itemActual.getTipoVenta(), "Complete el tipo de venta del item "+nroItem)) {
				return false;
			}

			if (itemActual.getReferencia()==null || itemActual.getReferencia().isEmpty()) {
				Messagebox.show("Complete la referencia del item "+nroItem);
				return false;
			}
			
			
			if(!validarDescriptible(itemActual.getMoneda(), "Complete la moneda del item "+nroItem)){
				return false;
			}

			if (itemActual.getPlantilla().getDescripcion()==null || itemActual.getPlantilla().getDescripcion().isEmpty()) {
				Messagebox.show("Complete la descripción del item "+nroItem);
				return false;
			}
			
			nroItem++;
		}
		
		nroItem=1;
		for (ItemsOV itemActual : this.lDeterminacionesQuimicas) {
			if(!validarDescriptible(itemActual.getMoneda(), "Complete la moneda de la determinación quimica número "+nroItem)){
				return false;
			}
			nroItem++;
		}

		nroItem=1;
		for (ItemsOV itemActual : this.lDeterminacionesElectricas) {
			if(!validarDescriptible(itemActual.getMoneda(), "Complete la moneda de la determinación eléctrica número "+nroItem)){
				return false;
			}
			nroItem++;
		}
		
		nroItem=1;
		for (ItemsOV itemActual : this.itemsArticulos) {
			
			if(!validarDescriptible(itemActual.getMoneda(), "Complete la moneda de la solapa de materiales, item número "+nroItem)){
				return false;
			}

			if(!validarDescriptible(itemActual.getProductoOV(), "Complete el producto de la solapa de materiales, item número "+nroItem)){
				return false;
			}

			nroItem++;
		}		
		
		if(!validarDescriptible(vendedorOV, "Complete el vendedor en la solapa 'Dato Comerciales'.")){
			return false;
		}

		if(!validarDescriptible(representanteOV, "Complete el representante en la solapa 'Dato Comerciales'.")){
			return false;
		}

		if(!validarDescriptible(contactoSeleccionado, "Complete el contacto de referencia en la solapa 'Dato Comerciales'. Compruebe que la sucursal contiene contactos de referencia.")){
			return false;
		}
		
		return true;
	}

	private boolean validarDescriptible(DescriptibleOV desc, String mensaje){
		if (desc==null || desc.getCodigo()==null || desc.getCodigo().isEmpty()) {
			Messagebox.show(mensaje);
			return false;
		}
		return true;
	}
	
	@Command
	@NotifyChange("items")
	public void agregarElemento(){
		this.items.add(0, new ItemsOV());
	}
	@Command
	@NotifyChange("itemsArticulos")
	public void agregarElementoArticulo(){
		this.itemsArticulos.add(0, new ItemsOV());
	}
	
	
	/**
	 * 
	 * Metodo ejecutado desde el post del helper generico de lista de precios.
	 * 
	 */
	public void actualizarDeterminaciones(){
		this.lDeterminacionesQuimicas = actualizarDeterminaciones("LaboratorioQuimico");
		this.lDeterminacionesElectricas = actualizarDeterminaciones("LaboratorioElectrico");
	}

	/**
	 * 
	 * Actualiza las determinaciones recibiendo el nombre del parametro de laboratorio y una coleccion dnd depositar los resultados
	 * 
	 */
	protected ArrayList<ItemsOV> actualizarDeterminaciones(String parametroLaboratorio) {
		Long idListaPrecio = this.lPreciosOV.getId();
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(parametroLaboratorio);
		containerOV.setString2(String.valueOf(idListaPrecio));
		
		ListItemsOV list = (ListItemsOV) Operaciones.ejecutar("TraerDeterminacionConPrecio",containerOV,ListItemsOV.class);
		
		List list2 = list.getList();
		
		//Muestra monedas x defecto.
		List monedas = this.lMonedas.getList();
		if (!monedas.isEmpty()) {
			DescriptibleOV primerMoneda = (DescriptibleOV) monedas.get(0);
			for (Object itemsOV : list2) {
				ItemsOV d=(ItemsOV) itemsOV;
				d.setMoneda(primerMoneda);
			}
		}
		
		return (ArrayList<ItemsOV>) list2;
	}
	
	/**
	 * Solamente actualiza el campo que representa la descripcion completa de la sucursal.
	 * <p>ZK se encarga de actualizar el campo automaticamente con la ayuda del metodo actualizar que está en cada ViewModel.</p>
	 */
	public void actualizarCampoSucursal(){
		String text= this.clienteOV.getDescripcion().concat("/").concat(this.sucursalOV.getDescripcion());
		this.sucursalOV.setDescripcionCompleta(text);
		
		actualizarContactosReferencia();
	}

	protected void actualizarContactosReferencia() {
		/*
		 * Actualiza los contactos de referencia
		 */
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(String.valueOf(this.sucursalOV.getId()));
		
		this.contactos = (ListDescriptibleOV) Operaciones.ejecutar("RecuperarContactosDeSucursal", containerOV, ListDescriptibleOV.class);
		
		if (this.contactos.isEmpty()) {
			log.warn("La sucursal no tiene contactos de referencias. Esto puede ocacioner errores.");
		}else{
			this.contactoSeleccionado=(DescriptibleOV) this.contactos.getList().get(0);
		}
		
	}
	
	/**
	 * Limpia ovs al momento de seleccionar un cliente.
	 */
	public void actualizarCamposDependientesDeCliente(){
		this.sucursalOV=new SucursalOV();
		this.contactos=new ListDescriptibleOV();
		this.contactoSeleccionado=null;
	}

	public ListDescriptibleOV getlMonedas() {
		return lMonedas;
	}

	public void setlMonedas(ListDescriptibleOV lMonedas) {
		this.lMonedas = lMonedas;
	}

	public List<ItemsOV> getlDeterminacionesQuimicas() {
		return lDeterminacionesQuimicas;
	}

	public void setlDeterminacionesQuimicas(List<ItemsOV> lDeterminacionesQuimicas) {
		this.lDeterminacionesQuimicas = lDeterminacionesQuimicas;
	}

	public List<ItemsOV> getlDeterminacionesElectricas() {
		return lDeterminacionesElectricas;
	}

	public void setlDeterminacionesElectricas(
			List<ItemsOV> lDeterminacionesElectricas) {
		this.lDeterminacionesElectricas = lDeterminacionesElectricas;
	}

	public DescriptibleOV getlPreciosOV() {
		return lPreciosOV;
	}

	public void setlPreciosOV(DescriptibleOV lPreciosOV) {
		this.lPreciosOV = lPreciosOV;
	}

	public List<NotaOV> getlNotas() {
		return lNotas;
	}

	public void setlNotas(List<NotaOV> lNotas) {
		this.lNotas = lNotas;
	}


}
