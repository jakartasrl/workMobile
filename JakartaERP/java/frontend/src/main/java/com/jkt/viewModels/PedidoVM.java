package com.jkt.viewModels;

import static org.apache.commons.beanutils.BeanUtils.copyProperties;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import lombok.Data;

import org.jsoup.Jsoup;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Checkbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.TreeNode;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.grafo.DatoNodo.Estado;
import com.jkt.ov.AgendaOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.FormaFacturacionOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListNotasOV;
import com.jkt.ov.ListPedidoOV;
import com.jkt.ov.NotaOV;
import com.jkt.ov.ParametroOV;
import com.jkt.ov.PedidoDocumentacionOV;
import com.jkt.ov.PedidoOV;
import com.jkt.ov.PrecedenteOV;
import com.jkt.ov.TareaAgendaOV;
import com.jkt.ov.TareaPrecedenteOV;
import com.jkt.ov.tree.NodoTareaAgenda;
import com.jkt.pedido.dominio.Pedido;
import com.jkt.pedido.dominio.PedidoDet;

/**
 * ViewModel de la entidad {@link Pedido} que se encarga de procesar las diferentes peticiones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class PedidoVM extends ComprobanteVM implements IBasicOperations {

	/**
	 * Se utiliza para saber cuando el usuario selecciono un pedido, y de esto modo,
	 * se puede comenzar a planificar sus tareas.
	 */
	private boolean seleccionoPedido=false;
	
	/*
	 * Variables para la planificacion de la agenda
	 */
	private TareaAgendaOV tareaAgregada;
	private NodoTareaAgenda siguienteRoot;
	
	private AgendaOV agenda;
	private String codigoTareaNueva;
	private ListDescriptibleOV estados;
	
	/*
	 * Atributos de un pedido sin planificacion
	 */
	private String titulo="Ingreso de Pedido";
	
	private List<DescriptibleOV> lDocumentacion=new ArrayList<DescriptibleOV>();
	private List<DescriptibleOV> docEntregados=new ArrayList<DescriptibleOV>();
	
	private PedidoOV comprobanteOV=new PedidoOV();
	
	private DescriptibleOV plantillaDescriptible = new DescriptibleOV();

	PedidoOV pedidoDescriptible = new PedidoOV();
	DescriptibleOV presupuestoDescriptible = new DescriptibleOV();
	
	@Command
	@NotifyChange("comprobanteOV")
	public void agregarFormaFacturacion(){
		this.comprobanteOV.getFacturaciones().add(0, new FormaFacturacionOV());
	}
	
	@Command
	public void guardar(){
		
		if (modoAgenda) {
			planificarPedido();
		}else{
			if(!super.validarOV()){
				return;
			}
			
			if(!this.validaFacturaciones(this.comprobanteOV.getFacturaciones())){
				return;
			}

			completarOV();
			Operaciones.ejecutar("GuardarPedido", comprobanteOV);
			Messagebox.show("Se ha guardado el pedido correctamente.", "Mensaje",null, null,null);
		}
	}
	
	/**
	 * Es el guardar, cuando la funcionalidad está en modo agenda
	 */
	public void planificarPedido(){
		
		if(!validarTareas()){
			Messagebox.show("Debe completar el sector en todas las tareas.");
			return;
		}
		
		List<TreeNode<TareaPrecedenteOV>> nodosPrincipales = this.agenda.getArbolPrecedencias().getRoot().getChildren();
		
		List<TareaAgendaOV> tareas=new ArrayList<TareaAgendaOV>();//Todas las tareas a enviar a la operacion
		TareaAgendaOV tarea;
		
		List<TreeNode<TareaPrecedenteOV>> hijos;//Cada lista sera la lista de hijos

		for (TreeNode<TareaPrecedenteOV> nodoActual : nodosPrincipales) {
			tarea = nodoActual.getData().getTarea();

			tarea.setIdTarea(tarea.getTarea().getId());
			tarea.setCodigoTarea(tarea.getTarea().getCodigo());
			tarea.setIdSector(tarea.getSector().getId());
			
//			tarea.setIdEstado(Integer.valueOf(tarea.getEstado().getCodigo()));
//			tarea.setIdEstado(Estado.NO_INICIADO.getValue());
			
			tareas.add(tarea);//tarea level0, agregarla a la lista de tareas SI O SI
			
			hijos = nodoActual.getChildren();
			
			//si la tarea se agrego recien, solamente se asigna por defecto el estado no iniciado, de modo contrario se verifican sus precedencias
			if(tarea.getIdEstado()==0){
				tarea.setIdEstado(Estado.NO_INICIADO.getValue());
			}else{ //si la tarea ya existia pero se le borraron los precedentes, debo actualizar el estado, y ponerla como no iniciada
				
				boolean noTienePrecedentes = true;
				for (TreeNode<TareaPrecedenteOV> treeNode : hijos) {
					if(treeNode.getData().getEsPrecedente()){
						noTienePrecedentes = false;
						break;
					}
				}
				
				if(noTienePrecedentes){
					tarea.setIdEstado(Estado.NO_INICIADO.getValue());
				}
			}
			
			List<DescriptibleOV> listaPrecedencias=new ArrayList<DescriptibleOV>();
			for (TreeNode<TareaPrecedenteOV> nodoLevel2 : hijos) {
				if (nodoLevel2.getData().getEsPrecedente()) {
						
					//Si un solo precedente tiene el estado NO FINALIZADO, se pone la tarea en espera!
					if(nodoLevel2.getData().getTarea().getIdEstado()!=Estado.FINALIZADO.getValue()){
						tarea.setIdEstado(Estado.EN_ESPERA.getValue());
					}
					
					DescriptibleOV descriptibleOV = new DescriptibleOV();
					descriptibleOV.setCodigo(String.valueOf(nodoLevel2.getData().getTarea().getRandomNumber()));
					listaPrecedencias.add(descriptibleOV);
				}
			}
			tarea.setPrecedenciasEnNumeros(listaPrecedencias);
		}
		
		PedidoOV pedidoAGuardar = this.agenda.getPedido();
		pedidoAGuardar.setId(this.pedidoDescriptible.getId());
		pedidoAGuardar.setTareas(tareas);
		Operaciones.ejecutar("GenerarPlanificacionPedido", pedidoAGuardar);
		
		Messagebox.show("Se planifico el pedido correctamente.");
	}
	
	/**
	 * Valida si TODAS las tareas tiene un sector seleccionado.
	 */
	private boolean validarTareas() {
		for (TareaAgendaOV tareaAgendaOV : this.agenda.getTareasGenerales()) {
			long id = tareaAgendaOV.getSector().getId();
			if (id==0) { //significa que no se selecciono un sector para la tarea actual
				return false;
			}
		}
		return true;
	}
	
	public void recuperarAgendaPedido() throws IllegalAccessException, InvocationTargetException, JakartaException{
//		this.setTitulo("Planificación del Pedido '"+this.pedidoDescriptible.getNro()+"' .");
		this.setTitulo("Planificación del Pedido");
		
		this.agenda=new AgendaOV();
		
		ContainerOV container = new ContainerOV();
		container.setString1("pedido");
		container.setString2(String.valueOf(pedidoDescriptible.getId()));
		
		ListPedidoOV l = (ListPedidoOV) Operaciones.ejecutar("TraerPedidoConTareas", container, ListPedidoOV.class);
		List list = l.getList();
		if(list.isEmpty() || list.size()>1){
			Messagebox.show("Ocurrio un error al intentar recuperar el pedido y su planificación.");
			return;
		}
		PedidoOV pedido = (PedidoOV) list.get(0);
		
		/*
		 * Genero el grafo.
		 */
		for (TareaAgendaOV tareaAgendaOV : pedido.getTareas()) {
			
			DescriptibleOV tarea = new DescriptibleOV();
			tarea.setCodigo(tareaAgendaOV.getCodigoTarea());
			tarea.setDescripcion(tareaAgendaOV.getDescripcionTarea());
			
			tareaAgendaOV.setTarea(tarea);
			
			tareaAgendaOV.setSector(Operaciones.recuperarObjetoDescriptible("sector",tareaAgendaOV.getIdSector()));
			
			
			//Asigna el estado al combo.
			DescriptibleOV estadoActual;
			for (Object object : this.estados.getList()) {
				estadoActual=(DescriptibleOV) object;
				if (estadoActual.getCodigo().equals(String.valueOf(tareaAgendaOV.getIdEstado()))) {
					tareaAgendaOV.setEstado(estadoActual);
				}
			}
			
			
			this.tareaAgregada=tareaAgendaOV;
			this.agenda.getTareasGenerales().add(this.tareaAgregada);
			TareaPrecedenteOV tareaPrecedenteOV = new TareaPrecedenteOV();
			tareaPrecedenteOV.setTarea(this.tareaAgregada);
			this.siguienteRoot=new NodoTareaAgenda(tareaPrecedenteOV, true);
			this.agenda.getArbolPrecedencias().getRoot().add(siguienteRoot);
			
			actualizarArboles();
		}
		
		/*
		 * Recorro el grafo, y para cada hijo del primer nivel, busco si esta en la lista de precedentes.
		 */
		List<TreeNode<TareaPrecedenteOV>> children = this.agenda.getArbolPrecedencias().getRoot().getChildren();
		for (TreeNode<TareaPrecedenteOV> treeNode : children) {
			TareaAgendaOV tareaActual = treeNode.getData().getTarea();
			
			//Busco el precedente actual en la lista recuperada de la base. de seguro existirá, pero debo dar con el.
			PrecedenteOV precedenteActual=null;
			for (PrecedenteOV precedente : pedido.getPrecedentesPlanos()) {
				if(precedente.getCodigo().equals(String.valueOf(tareaActual.getId()))){
					precedenteActual=precedente;
					break;
				}
			}
			
			if (precedenteActual==null) {
				Messagebox.show("Ocurrio un error al cargar las precedencias de pedido seleccionado.");//en el OK redireccionar...
				return;
			}
			
			//Una vez encontrado el precedente en la lista recuperada de la base.
			//Para cada hijo del arbol, es decir, precedencia en arbol, hay que buscar y matchear su correspondencia con la lista de precedentes planos...
			//Si existe lo seteo como precedente, y de modo contrario, no...
			
			List<TreeNode<TareaPrecedenteOV>> hijosLevel2 = treeNode.getChildren();
			for (TreeNode<TareaPrecedenteOV> hijoLevel2 : hijosLevel2) {
				
				for (DescriptibleOV descriptibleOV : precedenteActual.getPrecedentes()) {
					if (String.valueOf(hijoLevel2.getData().getTarea().getId()).equals(descriptibleOV.getCodigo())) {
						hijoLevel2.getData().setEsPrecedente(true);
						break;
					}
				}
				
			}
			
		}
		
	}

	
	
	
	@Command
	@NotifyChange({"agenda","pedidoDescriptible","titulo","arbolNotas","archivos","comprobanteOV","contactoSeleccionado","contactos","lNotas","items","itemsArticulos","lDocumentacion","clienteOV","sucursalOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas","vendedorOV","representanteOV"})
	public void nuevo(){
		super.nuevo();
		this.lDocumentacion = new ArrayList<DescriptibleOV>();
		this.docEntregados= new ArrayList<DescriptibleOV>();
		this.comprobanteOV= new PedidoOV();
		try {
			init(String.valueOf(this.modoAgenda));
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	
	@Command
	@NotifyChange({"titulo","agenda","pedidoDescriptible"})
	public void buscar() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException{
		openComplexHelper("pedido", "", pedidoDescriptible, "recuperarPedido", "Pedidos Disponibles", "Nro Pedido", "Cliente",true, "Fecha" , "" );
	}
	
	/**
	 * A partir de un presupuesto, completa datos para el nuevo pedido.
	 */
	public void cargarPresupuesto() throws IllegalAccessException, InvocationTargetException, JakartaException{
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.presupuestoDescriptible.getId()));
		PedidoOV ovRecuperado = (PedidoOV) Operaciones.ejecutar("TraerPresupuestoParaPedido", objetoOV, PedidoOV.class);
		
		cargarDesdeOV(ovRecuperado);
		
		this.lDocumentacion = ((ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV("documentacion"), ListDescriptibleOV.class)).getList();
		this.docEntregados=new ArrayList<DescriptibleOV>();
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}
	
	
	/**
	 * Actualiza los datos recuperados desde el help de pedido.
	 * Debera setear todas las entidades con el objetivo de mostrar todos los datos previamente salvados.
	 */
	public void recuperarPedido() throws JakartaException, IllegalAccessException, InvocationTargetException{
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.pedidoDescriptible.getId()));
		
		PedidoOV ovRecuperado = (PedidoOV) Operaciones.ejecutar("TraerPedido", objetoOV, PedidoOV.class);

		cargarDesdeOV(ovRecuperado);
		actualizarDocs(ovRecuperado);
		
		this.comprobanteOV.setCargaACargoDeCliente(ovRecuperado.getCargaACargoDeCliente());
		this.comprobanteOV.setTransporteACargoDeCliente(ovRecuperado.getTransporteACargoDeCliente());
		this.comprobanteOV.setDescargaACargoDeCliente(ovRecuperado.getDescargaACargoDeCliente());
		
		if (modoAgenda) {
			this.seleccionoPedido=true;
			recuperarAgendaPedido();
		}
		
		
		//Ejecuta evento para actualizar todas las relaciones
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}
	
	private void cargarDesdeOV(PedidoOV ovRecuperado) throws JakartaException, IllegalAccessException, InvocationTargetException{
		this.vendedorOV = Operaciones.recuperarObjetoDescriptible("vendedor",ovRecuperado.getIdVendedor());
		this.representanteOV = Operaciones.recuperarObjetoDescriptible("representante",ovRecuperado.getIdRepresentante());
		this.lPreciosOV =  Operaciones.recuperarObjetoDescriptible("listaPrecios",ovRecuperado.getIdListaPrecio());
		this.clienteOV =  Operaciones.recuperarObjetoDescriptible("clientes",ovRecuperado.getIdCliente());
		
		DescriptibleOV sucursal = Operaciones.recuperarObjetoDescriptible("clienteSucursal",ovRecuperado.getIdSucursal());
		copyProperties(this.sucursalOV, sucursal);
		
		actualizarCampoSucursal();
		
		this.comprobanteOV.setId(ovRecuperado.getId());
		this.comprobanteOV.setItems(new ArrayList<ItemsOV>());
		
		this.items=new ArrayList<ItemsOV>();
		this.itemsArticulos =new ArrayList<ItemsOV>();
		this.lDeterminacionesElectricas=new ArrayList<ItemsOV>();
		this.lDeterminacionesQuimicas=new ArrayList<ItemsOV>();
		
		this.archivos=ovRecuperado.getArchivos();
		
		actualizarNotas(ovRecuperado);
		crearArbolNotas();
		
		actualizarContactosReferencia();
		this.contactoSeleccionado = completarCombo(this.contactos.getList(), ovRecuperado.getIdContactoReferencia());
		
		
		DescriptibleOV plantilla;//para asignar la descripcion si el detalle es item o material.
		//esta bindeado con la plantilla con lo cual debo asignar datos a la plantilla.
		
		for (ItemsOV itemsOV : ovRecuperado.getItems()) {
			
			itemsOV.setMoneda(completarCombo(this.lMonedas.getList(), itemsOV.getIdMoneda()));
			
			itemsOV.setImporteTotal(itemsOV.getImporte()*itemsOV.getCantidad());
			
			switch (itemsOV.getTipoItem()) {
			case 'I':
				itemsOV.setTipoVenta(completarCombo(this.tiposVenta.getList(), Long.valueOf(itemsOV.getTipo())));

				
				/*
				 * Genero nuevas instancias, ya que se duplicaban textos en cada uno de los items al estar referenciando a la misma plantilla
				 */
				plantilla = new DescriptibleOV();
				
				Random rand = new Random();
			    int randomNum = rand.nextInt((10000 - 1) + 1) + 1;
				
				plantilla.setId(randomNum);
				
				plantilla.setDescripcion(itemsOV.getDescripcion());
				itemsOV.setPlantilla(plantilla);
				
				
				this.items.add(itemsOV);
				break;
			case 'M':
				itemsOV.setProductoOV(Operaciones.recuperarObjetoDescriptible("articulos", itemsOV.getIdProducto()));
				this.itemsArticulos.add(itemsOV);
				break;
			case 'E':
				this.lDeterminacionesElectricas.add(itemsOV);
				break;
			case 'Q':
				this.lDeterminacionesQuimicas.add(itemsOV);
				break;

			default:
				log.warn("El tipo de detalle "+ itemsOV.getId() +" no es correcto.");
				break;
			}
		}
		
		this.comprobanteOV.setFecha(ovRecuperado.getFecha());
		this.comprobanteOV.setNro(ovRecuperado.getNro());

		this.comprobanteOV.setFacturaciones(ovRecuperado.getFacturaciones());
		for (FormaFacturacionOV formaFacturacionOV : this.comprobanteOV.getFacturaciones()) {
			formaFacturacionOV.setCondicionDePago(Operaciones.recuperarObjetoDescriptible("condicionPago", formaFacturacionOV.getIdCondicionDePago()));
		}
	
	}
	
	
	private void actualizarDocs(PedidoOV ovRecuperado) throws IllegalAccessException, InvocationTargetException {

		this.docEntregados = new ArrayList<DescriptibleOV>();
		this.lDocumentacion = new ArrayList<DescriptibleOV>();
		
		List<PedidoDocumentacionOV> docs = ovRecuperado.getDocs();
		for (PedidoDocumentacionOV pedidoDocumentacionOV : docs) {
			DescriptibleOV documento = new DescriptibleOV();
			copyProperties(documento, pedidoDocumentacionOV);
			documento.setId(pedidoDocumentacionOV.getIdDocumento());
			if (pedidoDocumentacionOV.getEntregado()) {
				this.docEntregados.add(documento);
			}
			this.lDocumentacion.add(documento);
		}
	}

	/**
	 * Setea el total de las notas, y las seleccionadas luego.
	 * 
	 */
	private void actualizarNotas(PedidoOV ovRecuperado) {
		
		this.lNotas=ovRecuperado.getNotas();
		this.comprobanteOV.setNotas(new ArrayList<NotaOV>());
		for (NotaOV nota : this.lNotas) {
			if (nota.getActivo()) {
				nota.setChecked(true);
				this.comprobanteOV.getNotas().add(nota);
			}
		}
		
	}

	private void completarOV() {
		comprobanteOV.setIdCliente(clienteOV.getId());
		comprobanteOV.setIdSucursal(sucursalOV.getId());
		comprobanteOV.setIdListaPrecio(lPreciosOV.getId());
		comprobanteOV.setIdVendedor(vendedorOV.getId());
		comprobanteOV.setIdRepresentante(representanteOV.getId());
		comprobanteOV.setIdContactoReferencia(contactoSeleccionado.getId());
		
		comprobanteOV.completarListaDocumentos(lDocumentacion, docEntregados);
		comprobanteOV.setArchivos(this.archivos);
		
		ArrayList<ItemsOV> itemsFinal = new ArrayList<ItemsOV>();
		
		for (ItemsOV itemsOV : items) {
			itemsOV.setIdMoneda(itemsOV.getMoneda().getId());
			itemsOV.setDescripcion(itemsOV.getPlantilla().getDescripcion());
			itemsOV.setTipo(Integer.valueOf(itemsOV.getTipoVenta().getCodigo()));
			itemsOV.setTipoItem(PedidoDet.CHAR_ITEM);
			itemsFinal.add(itemsOV);
		}

		for (ItemsOV itemsOV : itemsArticulos) {
			itemsOV.setIdMoneda(itemsOV.getMoneda().getId());
//			itemsOV.setDescripcion(itemsOV.getPlantilla().getDescripcion());
			itemsOV.setIdProducto(itemsOV.getProductoOV().getId());
//			itemsOV.setTipo(Integer.valueOf(itemsOV.getTipoVenta().getCodigo()));
			itemsOV.setTipoItem(PedidoDet.CHAR_MATERIAL);
			itemsFinal.add(itemsOV);
		}
		
		for (ItemsOV itemsOV : lDeterminacionesQuimicas) {
			itemsOV.setIdMoneda(itemsOV.getMoneda().getId());
			itemsOV.setTipoItem(PedidoDet.CHAR_QUIMICO);
			itemsFinal.add(itemsOV);
		}

		for (ItemsOV itemsOV : lDeterminacionesElectricas) {
			itemsOV.setTipoItem(PedidoDet.CHAR_ELECTRICO);
			itemsOV.setIdMoneda(itemsOV.getMoneda().getId());
			itemsFinal.add(itemsOV);
		}
		
		/*
		 * Junta todos los items
		 */
		comprobanteOV.setItems(itemsFinal);
		
		for (FormaFacturacionOV formaFacturacionOV : comprobanteOV.getFacturaciones()) {
			formaFacturacionOV.setIdCondicionDePago(formaFacturacionOV.getCondicionDePago().getId());
		}
		
	}

	@Init
	public void init(@BindingParam("modoAgenda") String modoAgenda) throws IllegalAccessException, InvocationTargetException{
		
		if (modoAgenda.equals("true")) {
			this.modoAgenda=true;
			this.titulo="Planificación de Pedido";
		}else{
			this.titulo="Ingreso de Pedido";
			this.modoAgenda=false;
		}

		log.info("Iniciando ViewModel de Pedido.");
		
//		FILTROS
		this.setFiltro("filtroComprobanteCliente");
		
		log.info("Recuperando notas...");
		this.lNotas = ((ListNotasOV) Operaciones.ejecutar("TraerNotas", ListNotasOV.class)).getList();
		crearArbolNotas();
		
		log.info("Recuperando documentos...");
		this.lDocumentacion = ((ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV("documentacion"), ListDescriptibleOV.class)).getList();

		log.info("Recuperando monedas...");
		this.lMonedas = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV("moneda"), ListDescriptibleOV.class);
		
		log.info("Inicializando items...");
		this.items=new ArrayList<ItemsOV>();
//		this.items.add(new ItemsOV()); //se agrega un item para no iniciar tocando un boton!

		log.info("Iniciando tipos de venta...");
		this.tiposVenta=(ListDescriptibleOV) Operaciones.ejecutar("TraerTiposDeVenta", ListDescriptibleOV.class);
		
		log.info("Inicializando items para articulos...");
		this.itemsArticulos=new ArrayList<ItemsOV>();
		
		log.info("Inicializando contactos...");
		this.contactos = new ListDescriptibleOV();
		this.contactoSeleccionado=new DescriptibleOV();
		
		this.comprobanteOV=new PedidoOV();
		
		if (this.modoAgenda) {
			this.agenda = new AgendaOV();
			this.estados = (ListDescriptibleOV) Operaciones.ejecutar("TraerEstadosTareas", ListDescriptibleOV.class);
		}
		
	}
	
	@Command
	public void toogleNota(@BindingParam("nota") NotaOV nota){
		if(nota.getChecked()){
			this.comprobanteOV.getNotas().add(nota);
		}else{
			this.comprobanteOV.getNotas().remove(nota);
		}
	}

	
	@GlobalCommand("actualizarOVs")
	@NotifyChange({"titulo","agenda","pedidoDescriptible","arbolNotas","archivos","comprobanteOV","contactoSeleccionado","contactos","clienteOV","sucursalOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas", "items","itemsArticulos","vendedorOV","representanteOV","lDocumentacion"})
	public void actualizar(){}
	
	protected String retrieveMethod() {
		return "actualizarOVs";
	}
	
	public List<DescriptibleOV> getlDocumentacion() {
		return lDocumentacion;
	}

	public void setlDocumentacion(List<DescriptibleOV> lDocumentacion) {
		this.lDocumentacion = lDocumentacion;
	}
	
	@Command
	@NotifyChange("comprobanteOV")
	public void eliminarFacturacion(@BindingParam("elemento") FormaFacturacionOV elemento) {
		this.comprobanteOV.getFacturaciones().remove(elemento);
	}
	
	@Command
	@NotifyChange("agenda")
	public void eliminarTarea(@BindingParam("tarea") TareaAgendaOV tarea){
		this.agenda.getTareasGenerales().remove(tarea);
		List<TreeNode<TareaPrecedenteOV>> children = this.agenda.getArbolPrecedencias().getRoot().getChildren();
		
		TreeNode<TareaPrecedenteOV> nodoRootABorrar = null; //se setea y se borra al final de todo, ya que sino se pierden referencias en las listas...
		
		for (TreeNode<TareaPrecedenteOV> treeNode : children) {
			//Si es el actual lo seteo a nodoRootABorrar, para borrarlo luego y no perder el indice en la colccion q estoy recorriendo.
			if (treeNode.getData().getTarea()==tarea) {
				nodoRootABorrar=treeNode;
			}else{
				//sino tengo q recorrer los hijos de cada uno...
				List<TreeNode<TareaPrecedenteOV>> hijos = treeNode.getChildren();
				for (TreeNode<TareaPrecedenteOV> hijo : hijos) {
					if (hijo.getData().getTarea()==tarea) {
						hijos.remove(hijo);
						break;
					}
				}
				
			}
		}
		
		if (nodoRootABorrar!=null) {
			children.remove(nodoRootABorrar);
		}
	}
	
	
	/**
	 * Agrega una nueva tarea, utilizando el campo de texto para, o bien cagar una tarea, o abrir una ventana con las disponibles.
	 * 
	 */
	@Command
	@NotifyChange("agenda")
	public void agregarTareaGeneral() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException{
		

		this.tareaAgregada=new TareaAgendaOV();
		
		this.tareaAgregada.setEstado((DescriptibleOV) this.estados.getList().get(0));

		if (this.codigoTareaNueva!=null && !this.codigoTareaNueva.isEmpty()) {
			validarCampo("tarea", this.codigoTareaNueva, this.tareaAgregada.getTarea(), "actualizarTareasYArbol");
			return;
		}

		this.setFiltro("filtroCodigo");

		openComplexHelper("tarea", "", this.tareaAgregada.getTarea(), "tratamientoTarea", "Seleccionar tarea", "Tarea", "Descripción", true , "" , "" );
	}
	
	public void actualizarTareasYArbol() throws IllegalAccessException, InvocationTargetException{
		actualizarTareas();
		actualizarArboles();
	}
	
	private void actualizarTareas(){
		this.agenda.getTareasGenerales().add(this.tareaAgregada);
		TareaPrecedenteOV tareaPrecedenteOV = new TareaPrecedenteOV();
		tareaPrecedenteOV.setTarea(this.tareaAgregada);
		this.siguienteRoot=new NodoTareaAgenda(tareaPrecedenteOV, true);
		this.agenda.getArbolPrecedencias().getRoot().add(siguienteRoot);
	}
	
	/**
	 * Dependiente del comportamiento de la tarea, se abre un help para los items, se insertan las determinaciones, o las formas de facturacion...
	 * Cualquiera sea el caso, 1, 2 o N tareas, se llamará a el metodo actualizarArboles siempre...
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws JakartaException 
	 */
	public void tratamientoTarea() throws IllegalAccessException, InvocationTargetException, JakartaException{
		
		//Retorna al filtro de cliente!!
		this.setFiltro("filtroComprobanteCliente");
		
		// Hacer variables de instancias para evitar esta query en cada momento!
		ParametroOV paramTareaTaller = (ParametroOV) Operaciones.ejecutar("TraerParametro", new ContainerOV("tareaTaller"), ParametroOV.class);
		ParametroOV paramTareaLab = (ParametroOV) Operaciones.ejecutar("TraerParametro", new ContainerOV("tareaLab"), ParametroOV.class);
		ParametroOV paramTareaFacturar = (ParametroOV) Operaciones.ejecutar("TraerParametro", new ContainerOV("tareaFacturar"), ParametroOV.class);
		
		ParametroOV sectorTaller = (ParametroOV) Operaciones.ejecutar("TraerParametro", new ContainerOV("sectorTaller"), ParametroOV.class);
		ParametroOV sectorLab = (ParametroOV) Operaciones.ejecutar("TraerParametro", new ContainerOV("sectorLab"), ParametroOV.class);
		
		if(this.tareaAgregada.getTarea().getId()==paramTareaTaller.getValorNumero()){
			
			//Tareas para cuando la tarea es de tipo taller
			if(this.items.isEmpty() && this.itemsArticulos.isEmpty()){
				actualizarTareasYArbol();
			}else{
				//Comportamiento que maneja todos los items en una ventana separada, y al aceptar, agrega todos esos items como tareas.
				Map<String, Object> parametros = new HashMap<String, Object>();
				
				parametros.put("vm", this);
				parametros.put("tarea", this.tareaAgregada.getTarea());
				
				for (ItemsOV itemsOV : this.itemsArticulos) {
					itemsOV.getPlantilla().setDescripcion("Facturar producto : " + itemsOV.getProductoOV().getCodigo() + " " + itemsOV.getProductoOV().getDescripcion() );
				}
				
				for (ItemsOV itemsOV : this.items) {
					itemsOV.getPlantilla().setDescripcion(Jsoup.parse(itemsOV.getPlantilla().getDescripcion()).text());
				}
				
				parametros.put("items", this.items);
				parametros.put("itemsArticulos", this.itemsArticulos);
				
				Window window = (Window) Executions.createComponents("/pantallas/pedido/editorItems.zul", null, parametros);
				window.doModal();
			}
		}else if(this.tareaAgregada.getTarea().getId()==paramTareaLab.getValorNumero()){
			
			//Tareas para cuando la tarea es de tipo laboratorio
			
			DescriptibleOV tarea = this.tareaAgregada.getTarea();
			if(this.lDeterminacionesQuimicas.isEmpty()){
				actualizarTareasYArbol();
			}else{
				for (ItemsOV itemsOV : this.lDeterminacionesQuimicas) {
					this.tareaAgregada=new TareaAgendaOV();
					this.tareaAgregada.setTarea(tarea);
					this.tareaAgregada.setEstado((DescriptibleOV) this.estados.getList().get(0));
					this.tareaAgregada.setDescripcionTarea(this.tareaAgregada.getTarea().getDescripcion());
					this.tareaAgregada.setDescripcionAbreviada(itemsOV.getDescripcionDeterminacion());
					this.tareaAgregada.setSector(Operaciones.recuperarObjetoDescriptible("sector", Long.valueOf(sectorLab.getValorNumero())) );
					actualizarTareasYArbol();
				}
			}
		}else if(this.tareaAgregada.getTarea().getId()==paramTareaFacturar.getValorNumero()){
			
			//Tareas para cuando la tarea es de tipo facturacion
			
			DescriptibleOV tarea = this.tareaAgregada.getTarea();
			List<FormaFacturacionOV> facturaciones = this.comprobanteOV.getFacturaciones();

			if (facturaciones.isEmpty()) {
				actualizarTareasYArbol();
			}else{
				for (FormaFacturacionOV formaFacturacionOV : facturaciones) {
					this.tareaAgregada=new TareaAgendaOV();
					this.tareaAgregada.setTarea(tarea);
					this.tareaAgregada.setEstado((DescriptibleOV) this.estados.getList().get(0));
					this.tareaAgregada.setDescripcionTarea(this.tareaAgregada.getTarea().getDescripcion());
					this.tareaAgregada.setDescripcionAbreviada(formaFacturacionOV.getDescripcion());
					this.tareaAgregada.setSector(Operaciones.recuperarObjetoDescriptible("sector", Long.valueOf(sectorTaller.getValorNumero())) );
					actualizarTareasYArbol();
				}
			}
			
		}else{
			
			this.tareaAgregada.setDescripcionTarea(this.tareaAgregada.getTarea().getDescripcion());
			
			//Tarea estandar
			actualizarTareasYArbol();
		}
	}
	
	/**
	 * Actualiza el arbol de precedencias al agregar o quitar una tarea.
	 */
	public void actualizarArboles() throws IllegalAccessException, InvocationTargetException{
		List<TreeNode<TareaPrecedenteOV>> nodosHijos = this.agenda.getArbolPrecedencias().getRoot().getChildren();
		List<TareaAgendaOV> todasLasTareas = this.agenda.getTareasGenerales();
		
		//Agrega a cada nodo el nuevo elemento
		for (TreeNode<TareaPrecedenteOV> nodoActual : nodosHijos) {
			if (nodoActual!=this.siguienteRoot) { //el nodo recientemente agregado ya pertenece al arbol, x eso este if
				TareaPrecedenteOV nuevoPrecedente=new TareaPrecedenteOV();
				nuevoPrecedente.setTarea(this.tareaAgregada);
				NodoTareaAgenda nuevoNodo=new NodoTareaAgenda(nuevoPrecedente);
				nodoActual.add(nuevoNodo);
			}
		}
		
		//para el nuevo elemento, agregar todos menos a mi mismo.
		for (TareaAgendaOV tareaActual : todasLasTareas) {
			if (tareaActual!=this.tareaAgregada) {
				TareaPrecedenteOV nuevaPrecedencia=new TareaPrecedenteOV();
				nuevaPrecedencia.setTarea(tareaActual);
				this.siguienteRoot.add(new NodoTareaAgenda(nuevaPrecedencia));
			}
		}
	}
	
	
	public void actualizarTareasDesdeHelpExterno(List<ItemsOV> items, DescriptibleOV tarea) throws JakartaException, IllegalAccessException, InvocationTargetException{
		ParametroOV sectorTaller = (ParametroOV) Operaciones.ejecutar("TraerParametro", new ContainerOV("sectorTaller"), ParametroOV.class);

		for (ItemsOV itemsOV : items) {
			this.tareaAgregada=new TareaAgendaOV();
			this.tareaAgregada.setTarea(tarea);
			this.tareaAgregada.setEstado((DescriptibleOV) this.estados.getList().get(0));
			this.tareaAgregada.setDescripcionTarea(itemsOV.getReferencia());
			this.tareaAgregada.setDescripcionAbreviada(itemsOV.getDescripcionAbreviada());
			this.tareaAgregada.setDescripcionCompleta(itemsOV.getPlantilla().getDescripcion());
			this.tareaAgregada.setSector(Operaciones.recuperarObjetoDescriptible("sector", Long.valueOf(sectorTaller.getValorNumero())) );
			actualizarTareasYArbol();
		}
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);

	}

	/**
	 * Valida si no existe dependencias mutuas
	 */
	@Command
	public void verificarPrecenciaMutua(@BindingParam("checkComponent") Checkbox checkComponent ,  @BindingParam("nodo") NodoTareaAgenda nodo){
		if(checkComponent.isChecked()){ //solamente si se presiono el check se verifica la dep. mutua.
			
			List<TreeNode<TareaPrecedenteOV>> hijosLevel0 = this.agenda.getArbolPrecedencias().getRoot().getChildren();
			//busco en las raices al elemento que hizo click en check
			NodoTareaAgenda nodoRaiz = null;
			for (TreeNode<TareaPrecedenteOV> treeNode : hijosLevel0) {
				if(treeNode.getData().getTarea().getRandomNumber()==nodo.getData().getTarea().getRandomNumber()){
					nodoRaiz=(NodoTareaAgenda) treeNode;
					break;
				}
			}
			
			if(nodoRaiz==null){
				Messagebox.show("Existe una inconsistencia con las precedencias al momento de verificar dependencias mutuas.");
				return;
			}
			
			List<TreeNode<TareaPrecedenteOV>> hijosLevel0DeNodoRaiz = nodoRaiz.getChildren();
			for (TreeNode<TareaPrecedenteOV> treeNode : hijosLevel0DeNodoRaiz) {
				if(treeNode.getData().getTarea().getRandomNumber()==nodo.getParent().getData().getTarea().getRandomNumber()){
					if(treeNode.getData().getEsPrecedente()){
						Messagebox.show("Es imposible asignar una dependencia mutua.");
						checkComponent.setChecked(false);
						nodo.getData().setEsPrecedente(false);
						BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
						return;
					}
				}
			}
			
			checkComponent.setChecked(true);
			nodo.getData().setEsPrecedente(true);
			BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);


		}
	} 

}