package com.jkt.viewModels;

import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;

import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.io.Files;
import org.zkoss.util.media.AMedia;
import org.zkoss.util.media.Media;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zk.ui.util.Clients;
import org.zkoss.zul.DefaultTreeModel;
import org.zkoss.zul.Filedownload;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.TreeNode;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ArchivoOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.FormaFacturacionOV;
import com.jkt.ov.HeaderHelpGenericoOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListItemsOV;
import com.jkt.ov.NotaOV;
import com.jkt.ov.SucursalOV;
import com.jkt.ov.UserOV;
import com.jkt.ov.tree.NodoArchivos;
import com.jkt.ov.tree.NodoNotas;
import com.jkt.varios.dominio.Especificacion;

@Data
public abstract class ComprobanteVM extends ViewModel {

	@Init(superclass=true)
	public void init(){}
	
	protected boolean modoAgenda=false;
	
	protected List<DescriptibleOV> categoriasArchivos = new ArrayList<DescriptibleOV>();
	protected DescriptibleOV clienteOV = new DescriptibleOV();
	protected SucursalOV sucursalOV = new SucursalOV();
	protected DescriptibleOV lPreciosOV = new DescriptibleOV();
	protected ListDescriptibleOV tiposVenta = new ListDescriptibleOV();
	protected List<ItemsOV> lDeterminacionesQuimicas = new ArrayList<ItemsOV>();
	protected List<ItemsOV> lDeterminacionesElectricas = new ArrayList<ItemsOV>();
	protected List<NotaOV> lNotas = new ArrayList<NotaOV>();
	protected List<ItemsOV> items = new ArrayList<ItemsOV>();
	protected List<ItemsOV> itemsArticulos = new ArrayList<ItemsOV>();
	protected ListDescriptibleOV lMonedas = new ListDescriptibleOV();
	protected DescriptibleOV vendedorOV = new DescriptibleOV();
	protected DescriptibleOV representanteOV = new DescriptibleOV();
	
	protected ListDescriptibleOV contactos = new ListDescriptibleOV();
	protected List<DescriptibleOV> contactosSeleccionados =  new ArrayList<DescriptibleOV>();
//	protected DescriptibleOV contactoSeleccionado = new DescriptibleOV();
	
	protected List<ArchivoOV> archivos = new ArrayList<ArchivoOV>();
	private DefaultTreeModel<ArchivoOV> arbolArchivos;
	private DefaultTreeModel<NotaOV> arbolNotas;

	private DescriptibleOV plantillaTemporal = new DescriptibleOV();

	@Command
	public void validarPlantilla(@BindingParam("plantilla") DescriptibleOV plantilla , @BindingParam("codigo") String codigo) throws JakartaException{
		this.plantillaTemporal=plantilla;
		this.validarCampo("plantilla", codigo , this.plantillaTemporal, "actualizarHTML");
	}
	
	@Command
	public void actualizarPlantilla(@BindingParam("ov") ItemsOV item, @BindingParam("plantilla") DescriptibleOV plantilla) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException{
		this.plantillaTemporal=plantilla;
		openHelper("plantilla", "", this.plantillaTemporal, "actualizarHTML", "Plantillas", "" , " ", false);
	}
	
	public void actualizarHTML(){
		ContainerOV container=new ContainerOV();
		container.setString1("plantilla");
		container.setString2(String.valueOf(plantillaTemporal.getId()));
		
		//recuperar la plantilla usando el id, para traer los datos con formato.
		ListDescriptibleOV listaDescriptibles = (ListDescriptibleOV) Operaciones.ejecutar("TraerPlantilla", container, com.jkt.ov.ListDescriptibleOV.class);
		DescriptibleOV plantillaL = (DescriptibleOV) listaDescriptibles.getList().get(0);

		plantillaTemporal.setCampoAdicional1(plantillaL.getCampoAdicional1());
		plantillaTemporal.setDescripcion(plantillaL.getCampoAdicional1());
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}
	
	protected String rutaCompartida = "c:\\tmp\\";
	protected UserOV userOV;

	public ComprobanteVM() {
		Session sess = Sessions.getCurrent();
		this.userOV = (UserOV) sess.getAttribute("userCredential");
	}

	@NotifyChange({ "items", "lDeterminacionesQuimicas", "lDeterminacionesElectricas", "itemsArticulos" })
	@Command
	public void actualizarImporteTotal(@BindingParam("item") ItemsOV items) {
		items.setImporteTotal(items.getImporte() * items.getCantidad());
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

		int nroItem = 1;
		for (ItemsOV itemActual : this.items) {

			if (!validarDescriptible(itemActual.getTipoVenta(), "Complete el tipo de venta del item " + nroItem)) {
				return false;
			}

			if (itemActual.getReferencia() == null || itemActual.getReferencia().isEmpty()) {
				Messagebox.show("Complete la referencia del item " + nroItem);
				return false;
			}

			if (!validarDescriptible(itemActual.getMoneda(), "Complete la moneda del item " + nroItem)) {
				return false;
			}

			if (itemActual.getPlantilla().getDescripcion() == null || itemActual.getPlantilla().getDescripcion().isEmpty()) {
				Messagebox.show("Complete la descripción del item " + nroItem);
				return false;
			}

			nroItem++;
		}

		nroItem = 1;
		for (ItemsOV itemActual : this.lDeterminacionesQuimicas) {
			if (!validarDescriptible(itemActual.getMoneda(), "Complete la moneda de la determinación quimica número " + nroItem)) {
				return false;
			}
			nroItem++;
		}

		nroItem = 1;
		for (ItemsOV itemActual : this.lDeterminacionesElectricas) {
			if (!validarDescriptible(itemActual.getMoneda(), "Complete la moneda de la determinación eléctrica número " + nroItem)) {
				return false;
			}
			nroItem++;
		}

		nroItem = 1;
		for (ItemsOV itemActual : this.itemsArticulos) {

			if (!validarDescriptible(itemActual.getMoneda(), "Complete la moneda de la solapa de materiales, item número " + nroItem)) {
				return false;
			}

			if (!validarDescriptible(itemActual.getProductoOV(), "Complete el producto de la solapa de materiales, item número " + nroItem)) {
				return false;
			}

			nroItem++;
		}

		if (!validarDescriptible(vendedorOV,"Complete el vendedor en la solapa 'Dato Comerciales'.")) {
			return false;
		}

		//Para no ir a buscar a la base ni generar uno nuevo
		if (representanteOV.getCodigo() == null || representanteOV.getCodigo().isEmpty()) {
			representanteOV.setId(-1);
		}
		
		for (ArchivoOV archivoOV : this.archivos) {
			if (archivoOV.getFileName() != null && !archivoOV.getFileName().isEmpty()) {
				if (archivoOV.getDescripcion() == null || archivoOV.getDescripcion().isEmpty()) {
					Messagebox.show("Complete las descripciones de los archivos cargados por favor.");
					return false;
				}
			}
		}
		
		return true;
	}

	protected boolean validarDescriptible(DescriptibleOV desc, String mensaje) {
		if (desc == null || desc.getCodigo() == null || desc.getCodigo().isEmpty()) {
			Messagebox.show(mensaje);
			return false;
		}
		return true;
	}

	@Command
	@NotifyChange("items")
	public void agregarElemento() {
		this.items.add(0, new ItemsOV());
	}
	
	@Command
	@NotifyChange("items")
	public void eliminarElemento(@BindingParam("indice") int indice) {
		if(this.items.isEmpty()){
			Messagebox.show("No existen items a eliminar.");
			return;
		}
		
		this.items.remove(indice);
	}
	

	@Command
	@NotifyChange("itemsArticulos")
	public void agregarElementoArticulo() {
		this.itemsArticulos.add(0, new ItemsOV());
	}

	@Command
	@NotifyChange("itemsArticulos")
	public void eliminarElementoArticulo(@BindingParam("elemento") ItemsOV item) {
		this.itemsArticulos.remove(item);
	}

	@Command
	@NotifyChange("arbolArchivos")
	public void agregarArchivo() {
		ArchivoOV archivoOV = new ArchivoOV();

		archivoOV.setIdUsuario(this.userOV.getId());
		archivoOV.setUsuario(this.userOV.getName() + " " + this.userOV.getLastName());

		int idCategoria = Especificacion.Categoria.ARCHIVOS.getId();
		archivoOV.setIdCategoria(idCategoria);

		NodoArchivos nodoArchivos = this.mapaCategoriasArchivos.get(String.valueOf(idCategoria));
		nodoArchivos.add(new NodoArchivos(archivoOV));
		
	}

	@Command
	@NotifyChange("arbolArchivos")
	public void agregarArchivoFactura() {
		ArchivoOV archivoOV = new ArchivoOV();
		
		archivoOV.setIdUsuario(this.userOV.getId());
		archivoOV.setUsuario(this.userOV.getName() + " " + this.userOV.getLastName());
		int idCategoria = Especificacion.Categoria.COMPROBANTES.getId();
		archivoOV.setIdCategoria(idCategoria);

		NodoArchivos nodoArchivos = this.mapaCategoriasArchivos.get(String.valueOf(idCategoria));
		nodoArchivos.add(new NodoArchivos(archivoOV));
		
	}

	@Command
	@NotifyChange("arbolArchivos")
	public void agregarArchivoImagen() {
		ArchivoOV archivoOV = new ArchivoOV();
		
		archivoOV.setIdUsuario(this.userOV.getId());
		archivoOV.setUsuario(this.userOV.getName() + " " + this.userOV.getLastName());
		int idCategoria = Especificacion.Categoria.IMAGENES.getId();
		archivoOV.setIdCategoria(idCategoria);

		NodoArchivos nodoArchivos = this.mapaCategoriasArchivos.get(String.valueOf(idCategoria));
		nodoArchivos.add(new NodoArchivos(archivoOV));
		
//		this.archivos.add(0, archivoOV);
	}
	
	@Command
	@NotifyChange("arbolArchivos")
	public void eliminarArchivo(@BindingParam("elemento") NodoArchivos archivo){
//		this.archivos.remove(archivo);
		
		NodoArchivos nodoArchivo = this.mapaCategoriasArchivos.get(String.valueOf(archivo.getData().getIdCategoria()));
//		List<TreeNode<ArchivoOV>> children = nodoArchivos.getChildren();
//		for (TreeNode<ArchivoOV> treeNode : children) {
//			if(treeNode.getData()==archivo){
//				
//			}
//		}
		nodoArchivo.remove(archivo);
		
	}
	

	/**
	 * 
	 * Metodo ejecutado desde el post del helper generico de lista de precios.
	 * 
	 */
	public void actualizarDeterminaciones() {
		this.lDeterminacionesQuimicas = actualizarDeterminaciones("LaboratorioQuimico");
		this.lDeterminacionesElectricas = actualizarDeterminaciones("LaboratorioElectrico");
	}

	/**
	 * 
	 * Actualiza las determinaciones recibiendo el nombre del parametro de
	 * laboratorio y una coleccion dnd depositar los resultados
	 * 
	 */
	protected ArrayList<ItemsOV> actualizarDeterminaciones(String parametroLaboratorio) {
		Long idListaPrecio = this.lPreciosOV.getId();

		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(parametroLaboratorio);
		containerOV.setString2(String.valueOf(idListaPrecio));

		ListItemsOV list = (ListItemsOV) Operaciones.ejecutar("TraerDeterminacionConPrecio", containerOV, ListItemsOV.class);

		List list2 = list.getList();

		// Muestra monedas x defecto.
		List monedas = this.lMonedas.getList();
		if (!monedas.isEmpty()) {
			DescriptibleOV primerMoneda = (DescriptibleOV) monedas.get(0);
			for (Object itemsOV : list2) {
				ItemsOV d = (ItemsOV) itemsOV;
				d.setMoneda(primerMoneda);
			}
		}

		return (ArrayList<ItemsOV>) list2;
	}

	/**
	 * Solamente actualiza el campo que representa la descripcion completa de la sucursal.
	 * <p> ZK se encarga de actualizar el campo automaticamente con la ayuda del metodo actualizar que está en cada ViewModel.</p>
	 */
	public void actualizarCampoSucursal() {
		String text = this.clienteOV.getDescripcion().concat("/").concat(this.sucursalOV.getDescripcion());
		this.sucursalOV.setDescripcionCompleta(text);

		actualizarContactosReferencia();
	}

	protected void actualizarContactosReferencia() {

		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(String.valueOf(this.sucursalOV.getId()));

		this.contactos = (ListDescriptibleOV) Operaciones.ejecutar("RecuperarContactosDeSucursal", containerOV, ListDescriptibleOV.class);
		
		if (this.contactos.isEmpty()) {
			log.warn("La sucursal no tiene contactos de referencias. Esto puede ocacioner errores.");
		}

	}

	/**
	 * Limpia ovs al momento de seleccionar un cliente.
	 */
	public void actualizarCamposDependientesDeCliente() {
		this.sucursalOV = new SucursalOV();
		this.contactos = new ListDescriptibleOV();
		this.contactosSeleccionados = new ArrayList<DescriptibleOV>();
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

	public void setlDeterminacionesQuimicas(
			List<ItemsOV> lDeterminacionesQuimicas) {
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

	protected void nuevo() {
		this.clienteOV = new DescriptibleOV();
		this.sucursalOV = new SucursalOV();
		this.lPreciosOV = new DescriptibleOV();
		this.lDeterminacionesQuimicas = new ArrayList<ItemsOV>();
		this.lDeterminacionesElectricas = new ArrayList<ItemsOV>();
		this.lNotas = new ArrayList<NotaOV>();

		this.items = new ArrayList<ItemsOV>();
		this.lMonedas = new ListDescriptibleOV();

		this.contactos = new ListDescriptibleOV();
		this.contactosSeleccionados = new ArrayList<DescriptibleOV>();

		this.vendedorOV = new DescriptibleOV();
		this.representanteOV = new DescriptibleOV();

		this.archivos = new ArrayList<ArchivoOV>();
		
	}

	@Command
	@NotifyChange("arbolArchivos")
	public void subirArchivo(@BindingParam("archivo") Media media,@BindingParam("archivoActual") ArchivoOV archivoActual)throws IOException {

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
	public void obtenerArchivo(@BindingParam("archivoActual") ArchivoOV archivoActual) throws IOException {

		if (archivoActual.getFileName() == null || archivoActual.getFileName().isEmpty()) {
			return;
		}

		File f = new File(archivoActual.getFileURL() + archivoActual.getFileName());
		byte[] buffer = new byte[(int) f.length()];
		FileInputStream fs = new FileInputStream(f);
		fs.read(buffer);
		fs.close();
		ByteArrayInputStream is = new ByteArrayInputStream(buffer);
		AMedia fileContent = new AMedia(archivoActual.getFileName(), archivoActual.getFormat(), archivoActual.getContentType(), is);

		if (fileContent.getFormat().equals("jpeg") || fileContent.getFormat().equals("png") || fileContent.getFormat().equals("pdf")) {
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("media", fileContent);
			Window window = (Window) Executions.createComponents("/pantallas/visorArchivos.zul", null, hashMap);
			window.doModal();
		} else {
			Filedownload.save(fileContent);
		}

	}

	protected String generarRuta(Media media) {
		return this.rutaCompartida + media.getName();
	}

	
	Map<String,NodoArchivos > mapaCategoriasArchivos =  new HashMap<String, NodoArchivos>();
	
	protected void actualizarArbolArchivos(List<ArchivoOV> archivos) {
		
		crearArbolArchivos();
		
		for (ArchivoOV archivoOV : archivos) {
			NodoArchivos nodo = this.mapaCategoriasArchivos.get(String.valueOf(archivoOV.getIdCategoria()));
			nodo.add(new NodoArchivos(archivoOV));
		}
	}

	protected List<ArchivoOV> completarListaDesdeArbol(){
		DefaultTreeModel<ArchivoOV> arbolArchivos = this.arbolArchivos;
		List<ArchivoOV> archivos = new ArrayList<ArchivoOV>();

		List<TreeNode<ArchivoOV>> children = arbolArchivos.getRoot().getChildren();
		for (TreeNode<ArchivoOV> categoria : children) {
			NodoArchivos nodoCategoria = (NodoArchivos) categoria;
			List<TreeNode<ArchivoOV>> archivosCategoria = nodoCategoria.getChildren();
			for (TreeNode<ArchivoOV> hoja : archivosCategoria) {
				archivos.add(hoja.getData());
			}
		}
		
		return archivos;
	}
	
	protected void crearArbolArchivos(){
		this.categoriasArchivos = ((ListDescriptibleOV) Operaciones.ejecutar("TraerTiposDeArchivos", com.jkt.ov.ListDescriptibleOV.class)).getList();
		//Armar el arbol directamente
		
		NodoArchivos root = new NodoArchivos(new ArchivoOV(), true);
		
		for (DescriptibleOV categoria : this.categoriasArchivos) {
			ArchivoOV data = new ArchivoOV();
			data.setId(categoria.getId());
			data.setDescripcion(categoria.getDescripcion());
			NodoArchivos hijo = new NodoArchivos(data, true);
			this.mapaCategoriasArchivos.put(String.valueOf(data.getId()), hijo);
			root.add(hijo);
		}
		
		this.arbolArchivos = new DefaultTreeModel<ArchivoOV>(root);
		
	}
	
	protected void crearArbolNotas() {

		NodoNotas root = new NodoNotas(new NotaOV(), true);

		Map<String, NodoNotas> actividades = new HashMap<String, NodoNotas>();
		Map<String, Map<String, NodoNotas>> subActividades = new HashMap<String, Map<String, NodoNotas>>();

		for (NotaOV notaOV : this.lNotas) {

			String actividad = notaOV.getCodigoActividad();
			NodoNotas nodoLevelUno;

			if (actividades.get(actividad) == null) { //Si ya existe el primer nivel...
				
				//Creo el nodo actual
				NotaOV nuevoNodo = new NotaOV();
				nuevoNodo.setCodigo(actividad);
				nodoLevelUno = new NodoNotas(nuevoNodo, true);
				
				//Pongo en el mapa la nueva actividad
				actividades.put(actividad, nodoLevelUno);
				
				NotaOV nuevoSubNodo = new NotaOV();
				nuevoSubNodo.setCodigo(notaOV.getCodigoSubActividad());
				NodoNotas subNodo = new NodoNotas(nuevoSubNodo, true);
				
				nodoLevelUno.add(subNodo);
				
				//cargo en el mapa la referencia a CODPRINCIPAL- > (SUBCODIGO, NODO) 
				Map<String,NodoNotas> subMapa = new HashMap<String, NodoNotas>();
				subMapa.put(notaOV.getCodigoSubActividad(), subNodo);
				subActividades.put(notaOV.getCodigoActividad(),subMapa);
					
				//tercer nivel
				NodoNotas child = new NodoNotas(notaOV);
				subNodo.add(child);
				
			} else {
				nodoLevelUno = actividades.get(actividad);
				NodoNotas subNodo = subActividades.get(notaOV.getCodigoActividad()).get(notaOV.getCodigoSubActividad());
				
				//Puede existir A->B, pero no A->C, con lo cual tengo que crear C...
				if(subNodo==null){
					NotaOV nuevoSubNodo = new NotaOV();
					nuevoSubNodo.setCodigo(notaOV.getCodigoSubActividad());
					subNodo = new NodoNotas(nuevoSubNodo, true);
					 
					Map<String, NodoNotas> mapaSubNodos = subActividades.get(notaOV.getCodigoActividad());
					mapaSubNodos.put(notaOV.getCodigoSubActividad(), subNodo);
					subActividades.put(notaOV.getCodigoActividad(), mapaSubNodos);

				}
				
				NodoNotas child = new NodoNotas(notaOV);
				subNodo.add(child);
			}

		}

		for (NodoNotas actividadActual : actividades.values()) {
			root.add(actividadActual);
		}

		this.arbolNotas = new DefaultTreeModel<NotaOV>(root);

	}
	
	protected boolean validaFacturaciones(List<FormaFacturacionOV> facturaciones) {
		
		int i=1;
		for (FormaFacturacionOV formaFacturacionOV : facturaciones) {

			if(!this.validarDescriptible(formaFacturacionOV.getCondicionDePago(), "Complete la condicion de pago de elemento "+i+" en la \n solapa 'Formas de facturación'.")){
				return false;
			}
			
			if (formaFacturacionOV.getDescripcion()==null || formaFacturacionOV.getDescripcion().isEmpty()) {
				Messagebox.show("Complete la descripción del item "+i+" en la solapa 'Formas de facturación'.");
				return false;
			}
			i++;
		}
		
		if (facturaciones.isEmpty()) {
			return true;
		}else{
			double porcentaje=0;
			for (FormaFacturacionOV formaFacturacionOV : facturaciones) {
				porcentaje+=formaFacturacionOV.getPorcentaje();
			}
			if (porcentaje!=100) {
				Messagebox.show("La suma de todas las formas de facturación deben sumar 100%.");
				return false;
			}
		}
		
		return true;
	}

	@Command
	public void nuevoContacto(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("vm", this);
		Window window = (Window) Executions.createComponents("/pantallas/pedido/altaContactos.zul", null, map);
		window.doModal();
	}
	
	protected void actualizarContactosSeleccionados(List<DescriptibleOV> contactosReferencia) {
		Map<String, DescriptibleOV> mapa = new HashMap<String, DescriptibleOV>();
		List<DescriptibleOV> listaContactosTotal = this.contactos.getList();
		for (DescriptibleOV descriptibleOV : listaContactosTotal) {
			mapa.put(String.valueOf(descriptibleOV.getId()), descriptibleOV);
		}
		
		this.contactosSeleccionados = new ArrayList<DescriptibleOV>();
		
		for (DescriptibleOV descriptibleOV : contactosReferencia) {
			this.contactosSeleccionados.add(mapa.get(String.valueOf(descriptibleOV.getId())));
		}
	}

	
}
