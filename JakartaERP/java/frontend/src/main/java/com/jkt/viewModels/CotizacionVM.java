package com.jkt.viewModels;

import static org.apache.commons.beanutils.BeanUtils.copyProperties;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Random;

import lombok.Data;

import org.apache.commons.beanutils.BeanUtils;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ArchivoOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.CotizacionOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.pedido.dominio.PedidoDet;

@Data
public class CotizacionVM extends ComprobanteVM implements IBasicOperations {

	private String titulo = "Solicitud de Cotización";
	private CotizacionOV cotizacionOV = new CotizacionOV();
	
	@SuppressWarnings("rawtypes")
	@Command
	public void guardar() throws JakartaException {
				
		if (!validarOV()) {
			return;
		}

		this.completarCotizacionOV();
		
		Operaciones.ejecutar("GuardarCotizacion", this.cotizacionOV );
//		Messagebox.show("Cotización Guardada Correctamente.");
		Executions.sendRedirect("/pantallas/index/index-cotizacion.zul");		

	}

	private void completarCotizacionOV() {
		this.cotizacionOV.setIdCliente(clienteOV.getId());
		this.cotizacionOV.setIdCliente(clienteOV.getId());
		this.cotizacionOV.setIdSucursal(sucursalOV.getId());
		this.cotizacionOV.setIdVendedor(vendedorOV.getId());
		this.cotizacionOV.setIdRepresentante(representanteOV.getId());
		this.cotizacionOV.setIdContactoReferencia(contactoSeleccionado.getId());
		this.cotizacionOV.setArchivos(this.archivos);
		
		ArrayList<ItemsOV> itemsFinal = new ArrayList<ItemsOV>();
		
		for (ItemsOV itemsOV : items) {
			itemsOV.setIdMoneda(itemsOV.getMoneda().getId());
			itemsOV.setDescripcion(itemsOV.getPlantilla().getDescripcion());
			itemsOV.setTipo(Integer.valueOf(itemsOV.getTipoVenta().getCodigo()));
			itemsOV.setTipoItem(PedidoDet.CHAR_ITEM);
			itemsFinal.add(itemsOV);
		}

		this.cotizacionOV.setItems(itemsFinal);
		
	}

	@Command
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		openComplexHelper("cotizacion", "", this.cotizacionOV, "traerCotizacion", "Cotizaciones", "Nro Cotizacion", "Cliente",false, "Fecha","");
	}

	@GlobalCommand("actualizar")
	@NotifyChange({"cotizacionOV","clienteOV","sucursalOV","vendedorOV","representanteOV","contactoSeleccionado","contactos","items","itemsArticulos","archivos"})
	public void actualizar() {
		log.warn("Actualizando datos...");
	}

	protected String retrieveMethod() {
		return "actualizar";
	}
	
	@Command
	@NotifyChange({"cotizacionOV","clienteOV","sucursalOV","vendedorOV","representanteOV","contactoSeleccionado","contactos","items","itemsArticulos","archivos"})
	public void nuevo(){
//		super.nuevo();
//		this.cotizacionOV= new CotizacionOV();
		init();
	}
	
	@Init
	public void init(){
		
		try {
			ViewModel recuperarDesdeSesion = recuperarDesdeSesion(this.getClass().getCanonicalName());
			if(recuperarDesdeSesion!=null){
				BeanUtils.copyProperties(this, recuperarDesdeSesion);
				return;// true; 
			}
		} catch (IllegalAccessException e) {
			throw new RuntimeException(e.getMessage());
		} catch (InvocationTargetException e) {
			throw new RuntimeException(e.getMessage());
		}

		
		super.nuevo();
		log.info("Iniciando ViewModel de Cotizacion.");
		
		log.info("Inicializando items...");
		this.items=new ArrayList<ItemsOV>();
		this.items.add(new ItemsOV());

		log.info("Iniciando tipos de venta...");
		this.tiposVenta=(ListDescriptibleOV) Operaciones.ejecutar("TraerTiposDeVenta", ListDescriptibleOV.class);
		
		log.info("Inicializando items para articulos...");
		this.itemsArticulos=new ArrayList<ItemsOV>();
		this.itemsArticulos.add(new ItemsOV());
		
		log.info("Inicializando contactos...");
		this.contactos = new ListDescriptibleOV();
		this.contactoSeleccionado = new DescriptibleOV();
		
		this.cotizacionOV= new CotizacionOV();
		this.archivos=new ArrayList<ArchivoOV>();
		
	}
	
	@SuppressWarnings("unchecked")
	@NotifyChange("cotizacionOV")
	public void traerCotizacion() throws IllegalAccessException, InvocationTargetException, JakartaException {
		
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.cotizacionOV.getId()));
		CotizacionOV cotizacionOV = (CotizacionOV) Operaciones.ejecutar("TraerSolicitudCotizacion", objetoOV, CotizacionOV.class);
		
		cargarDesdeOV(cotizacionOV);
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
		
	}

	private void cargarDesdeOV(CotizacionOV cotizacionOV) throws JakartaException, IllegalAccessException, InvocationTargetException {
		
		this.vendedorOV = Operaciones.recuperarObjetoDescriptible("vendedor",cotizacionOV.getIdVendedor());
		this.representanteOV = Operaciones.recuperarObjetoDescriptible("representante",cotizacionOV.getIdRepresentante());
		this.clienteOV =  Operaciones.recuperarObjetoDescriptible("clientes",cotizacionOV.getIdCliente());
		
		DescriptibleOV sucursal = Operaciones.recuperarObjetoDescriptible("clienteSucursal",cotizacionOV.getIdSucursal());
		copyProperties(this.sucursalOV, sucursal);
		
		actualizarCampoSucursal();
		
		this.cotizacionOV.setId(cotizacionOV.getId());
		this.cotizacionOV.setItems(new ArrayList<ItemsOV>());
		
		this.items=new ArrayList<ItemsOV>();
		
		actualizarContactosReferencia();
		this.contactoSeleccionado = completarCombo(this.contactos.getList(), cotizacionOV.getIdContactoReferencia());
		
		DescriptibleOV plantilla;
		
		for (ItemsOV itemsOV : cotizacionOV.getItems()) {
			
			itemsOV.setTipoVenta(completarCombo(this.tiposVenta.getList(), Long.valueOf(itemsOV.getTipo())));
		
			plantilla = new DescriptibleOV();
			
			Random rand = new Random();
		    int randomNum = rand.nextInt((10000 - 1) + 1) + 1;
			
			plantilla.setId(randomNum);
			
			plantilla.setDescripcion(itemsOV.getDescripcion());
			itemsOV.setPlantilla(plantilla);
			
			this.items.add(itemsOV);
		
		}
		
		this.cotizacionOV.setFecha(cotizacionOV.getFecha());
		this.cotizacionOV.setFechaVencimiento(cotizacionOV.getFechaVencimiento());
		this.cotizacionOV.setReferencia(cotizacionOV.getReferencia());
		this.cotizacionOV.setNroCotizacion(cotizacionOV.getNroCotizacion());
		
		this.archivos=new ArrayList<ArchivoOV>();
		this.archivos=cotizacionOV.getArchivos();

	}
	
	@Override
	protected boolean validarOV() {
		
		if (!validarDescriptible(clienteOV, "Complete el Cliente.")) {
			return false;
		}

		if (!validarDescriptible(sucursalOV, "Complete la sucursal.")) {
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
			
			
			if (itemActual.getPlantilla().getDescripcion()==null || itemActual.getPlantilla().getDescripcion().isEmpty()) {
				Messagebox.show("Complete la descripción del item "+nroItem);
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

		for (ArchivoOV archivoOV : this.archivos) {
			if (archivoOV.getFileName() !=null && !archivoOV.getFileName().isEmpty()) {
				if (archivoOV.getDescripcion()==null || archivoOV.getDescripcion().isEmpty()) {
					Messagebox.show("Complete las descripciones de los archivos cargados por favor.");
					return false;
				}
			}
		}
		
		return true;
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		this.nuevo();
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}

}
