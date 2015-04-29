package com.jkt.viewModels;

import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.io.Files;
import org.zkoss.util.media.AMedia;
import org.zkoss.util.media.Media;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zul.DefaultTreeModel;
import org.zkoss.zul.Filedownload;
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
import com.jkt.ov.ArchivoOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListItemsOV;
import com.jkt.ov.NotaOV;
import com.jkt.ov.SucursalOV;
import com.jkt.ov.UserOV;
import com.jkt.ov.tree.NodoNotas;

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
	protected List<ArchivoOV> archivos=new ArrayList<ArchivoOV>();
	private DefaultTreeModel<NotaOV> arbolNotas;
	
	protected String rutaCompartida="c:\\tmp\\";
	protected UserOV userOV;
	
	
	public ComprobanteVM(){
		Session sess = Sessions.getCurrent();
		this.userOV = (UserOV) sess.getAttribute("userCredential");
	}
	
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

	protected boolean validarDescriptible(DescriptibleOV desc, String mensaje){
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
	@Command
	@NotifyChange("archivos")
	public void agregarArchivo(){
		ArchivoOV archivoOV = new ArchivoOV();
		
		archivoOV.setIdUsuario(this.userOV.getId());
		archivoOV.setUsuario(this.userOV.getName()+" "+this.userOV.getLastName());
		
		this.archivos.add(0, archivoOV);
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

	protected void nuevo(){
		this.clienteOV = new DescriptibleOV();
		this.sucursalOV = new SucursalOV();
		this.lPreciosOV = new DescriptibleOV();
		this.lDeterminacionesQuimicas = new ArrayList<ItemsOV>();
		this.lDeterminacionesElectricas = new ArrayList<ItemsOV>();
		this.lNotas = new ArrayList<NotaOV>();
		
		this.items = new ArrayList<ItemsOV>();
		this.lMonedas = new ListDescriptibleOV();

		this.contactos = new ListDescriptibleOV();

		this.vendedorOV = new DescriptibleOV();
		this.representanteOV = new DescriptibleOV();
		
		this.contactoSeleccionado = new DescriptibleOV();
	}
	

	@Command
	@NotifyChange("archivos")
	public void subirArchivo(@BindingParam("archivo") Media media, @BindingParam("archivoActual") ArchivoOV archivoActual) throws IOException {

		if (media.isBinary()) {
			Files.copy(new File(generarRuta(media)), media.getStreamData());
		} else {
			BufferedWriter writer = new BufferedWriter(new FileWriter(generarRuta(media)));
			Files.copy(writer, media.getReaderData());
		}
		
		archivoActual.setFileName(media.getName());
		archivoActual.setFileURL(this.rutaCompartida);
		archivoActual.setContentType(media.getContentType());
		archivoActual.setFormat(media.getFormat());
		
	}

	
	@Command
	public void obtenerArchivo( @BindingParam("archivoActual") ArchivoOV archivoActual) throws IOException {
		
		if (archivoActual.getFileName()==null || archivoActual.getFileName().isEmpty()) {
			return;
		}
		
		File f = new File(archivoActual.getFileURL() + archivoActual.getFileName());
		byte[] buffer = new byte[(int) f.length()];
		FileInputStream fs = new FileInputStream(f);
		fs.read(buffer);
		fs.close();
		ByteArrayInputStream is = new ByteArrayInputStream(buffer);
		AMedia fileContent = new AMedia(archivoActual.getFileName(), archivoActual.getFormat(), archivoActual.getContentType(), is);

		Filedownload.save(fileContent);
	}
	
	protected String generarRuta(Media media) {
		return this.rutaCompartida+media.getName();
	}

	protected void crearArbolNotas() {

		NodoNotas root = new NodoNotas(new NotaOV(),true);
		
		Map<String, NodoNotas> actividades=new HashMap<String, NodoNotas>();
		
		for (NotaOV notaOV : this.lNotas) {
			
			String actividad = notaOV.getCodigoActividad();
			NodoNotas actividadNodo;

			if (actividades.get(actividad)==null) {
				NotaOV nuevoNodo = new NotaOV();
				nuevoNodo.setCodigo(actividad);
				actividadNodo = new NodoNotas(nuevoNodo,true);
				actividades.put(actividad, actividadNodo);
			}else{
				actividadNodo=actividades.get(actividad);
			}
			
			NodoNotas child = new NodoNotas(notaOV);
			actividadNodo.add(child);

		}
		
		for (NodoNotas actividadActual : actividades.values()) {
			root.add(actividadActual);
		}
		
		this.arbolNotas=new DefaultTreeModel<NotaOV>(root);
		
	}
	
}
