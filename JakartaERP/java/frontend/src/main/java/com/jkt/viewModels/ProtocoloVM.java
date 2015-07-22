package com.jkt.viewModels;

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
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;
import org.zkoss.zul.Messagebox.ClickEvent;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.laboratorio.dominio.Protocolo;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.ContenedorFiltrosOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.DeterminacionOV;
import com.jkt.ov.FiltroOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListPedidoOV;
import com.jkt.ov.ListProtocoloOV;
import com.jkt.ov.ListValorEsperadoOV;
import com.jkt.ov.ListVariableOV;
import com.jkt.ov.MetodoOV;
import com.jkt.ov.ParametroOV;
import com.jkt.ov.PedidoOV;
import com.jkt.ov.ProtocoloOV;
import com.jkt.ov.SucursalOV;
import com.jkt.ov.UserOV;
import com.jkt.ov.ValorEsperadoOV;
import com.jkt.ov.VariableOV;
import com.jkt.service.ServiceRepository;

@Data
public class ProtocoloVM extends ViewModel implements IBasicOperations {
	
	private ProtocoloOV protocoloOV = new ProtocoloOV();
	private DescriptibleOV clienteOV = new DescriptibleOV();
	private SucursalOV sucursalOV = new SucursalOV();
	private DescriptibleOV equipoOV = new DescriptibleOV();
	private PedidoOV pedidoOV = new PedidoOV();
	private DescriptibleOV diagnosticoOV = new DescriptibleOV();

	//Para manejar diferenciar los laboratorios quimicos y electricos
	private long idLaboratorio;
	private String laboratorioParametroKey;
	private char tipoItem;
	
	@Init(superclass=true)
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV","tipoItem","sucursalOV","diagnosticoOV"})
	public void init(@BindingParam("l") String laboratorio){
		
		if(isCargadoDesdeSession()){return;}

		this.setTitulo("Administración de Protocolos");

		this.protocoloOV = new ProtocoloOV();
		this.clienteOV = new DescriptibleOV();
		this.sucursalOV = new SucursalOV();
		this.equipoOV = new DescriptibleOV();
		this.pedidoOV = new PedidoOV();
		this.diagnosticoOV = new DescriptibleOV();
		
		this.laboratorioParametroKey = laboratorio;
		
		if(laboratorio.equalsIgnoreCase("LaboratorioQuimico")){
			tipoItem='Q';
		} else if(laboratorio.equalsIgnoreCase("LaboratorioElectrico")){
			tipoItem='E';
		}
		
		ParametroOV laboratorioParam = (ParametroOV) Operaciones.ejecutar("TraerParametro", new ContainerOV(laboratorio), ParametroOV.class);
		this.idLaboratorio = Long.valueOf(laboratorioParam.getValorNumero());
		
	}
	
	@Command
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV","sucursalOV","diagnosticoOV"})
	public void guardar() throws JakartaException {
		
		Session sess = Sessions.getCurrent();

		UserOV userOV = (UserOV) sess.getAttribute("userCredential");

		if (this.equipoOV.getId() == 0L) {
			Messagebox.show("Ingrese un equipo.");
			return;
		}
		
		if (this.clienteOV.getId() == 0L) {
			Messagebox.show("Ingrese un cliente.");
			return;
		}
		
		if (this.sucursalOV.getId() == 0L) {
			Messagebox.show("Ingrese sucursal.");
			return;
		}
		
		if (this.diagnosticoOV.getId() == 0L) {
			Messagebox.show("Ingrese diagnostico.");
			return;
		}
		
		if (!this.validarCalculosExpresiones()) {
			return;
		}

		for (DeterminacionOV determinacionOV : this.protocoloOV.getDeterminaciones()) {
			
			determinacionOV.setId(0L);
			MetodoOV metodoOV = determinacionOV.getMetodoUtilizado();
			determinacionOV.setVariables(metodoOV.getVariables());

			determinacionOV.setDescMetodo(metodoOV.getMetodo());

			for (VariableOV variableOV : determinacionOV.getVariables()) {
				variableOV.setId(0L);
			}

		}

		this.protocoloOV.setIdPedido(this.pedidoOV.getId());
		this.protocoloOV.setIdEquipo(this.equipoOV.getId());
		this.protocoloOV.setIdCliente(this.clienteOV.getId());
		this.protocoloOV.setIdSucursal(this.sucursalOV.getId());
		this.protocoloOV.setIdLab(this.idLaboratorio);
		this.protocoloOV.setEstado(Protocolo.Estado.ESTADO_INICIAL.getId());
		this.protocoloOV.setIdUsuarioIngresoResultado(userOV.getId());
		this.protocoloOV.setIdDiagnostico(this.diagnosticoOV.getId());
		
		String msg = "Se generó ";
		if(this.protocoloOV.getId()!=0L){
			msg="Se actualizó ";
		}
		
		ProtocoloOV prot = (ProtocoloOV) Operaciones.ejecutar("GuardarProtocolo", this.protocoloOV, ProtocoloOV.class);
		
        Messagebox.show(msg + "el Protocolo " + prot.getCodigo(), "Protocolo Guardado", Messagebox.OK , Messagebox.QUESTION, new org.zkoss.zk.ui.event.EventListener() {    
			public void onEvent(Event evt) throws InterruptedException, IOException {
		        if (evt.getName().equals("onOK")) {
		        	Executions.sendRedirect(Executions.getCurrent().getDesktop().getFirstPage().getRequestPath());
		        }
		    }
		}
		);
	
	}

	private boolean validarCalculosExpresiones() {
		
		for (DeterminacionOV det : this.protocoloOV.getDeterminaciones()) {
			if(!this.calcularExpresion(det.getMetodoUtilizado())){
				return false;
			}
		}
		return true;
		
	}

	@Command
	public void nuevo() throws JakartaException {
		Executions.sendRedirect(Executions.getCurrent().getDesktop().getFirstPage().getRequestPath());
	}

	
	private DescriptibleOV protocoloDescriptible = new DescriptibleOV();
	
	@Override
	@Command
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {

		ContenedorFiltrosOV c=new ContenedorFiltrosOV();
		c.setClase("protocolo");
		
		List<FiltroOV> filtros=new ArrayList<FiltroOV>();
		
		filtros.add(new FiltroOV("estado", String.valueOf(Protocolo.Estado.ESTADO_INICIAL.getId()), ServiceRepository.CONDICION_IGUAL, ServiceRepository.INTEGER));
		filtros.add(new FiltroOV("laboratorio.id", String.valueOf(this.idLaboratorio), ServiceRepository.CONDICION_IGUAL, ServiceRepository.LONG));
		filtros.add(new FiltroOV("activo", String.valueOf(true), ServiceRepository.CONDICION_IGUAL, ServiceRepository.BOOLEAN));
		
		c.setFiltros(filtros);
		
		ListDescriptibleOV listDescriptible = (ListDescriptibleOV) Operaciones.ejecutar("HelperConFiltro", c, ListDescriptibleOV.class);		
		List resultado = listDescriptible.getList();
		
		Map<String,Object> map=new HashMap<String,Object>();

		map.put("clase","protocolo");
		map.put("coleccion",resultado);
		map.put("conFiltro",false);
		map.put("refresh", retrieveMethod());
		map.put("result", this.protocoloDescriptible);
		map.put("invoke","cargarProtocolo" );
		map.put("vm", this);

		Window window = (Window) Executions.createComponents("/pantallas/pedido/helpGenerico.zul", null, map);
		window.doModal();

	}
	
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV","tipoItem","sucursalOV","diagnosticoOV"})
	public void cargarProtocolo() throws JakartaException {
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1("protocolo");
		containerOV.setString2(String.valueOf(this.protocoloDescriptible.getId()));
		
		ListProtocoloOV p = (ListProtocoloOV) Operaciones.ejecutar("TraerProtocolo", containerOV, ListProtocoloOV.class);
		this.protocoloOV = (ProtocoloOV) p.getList().get(0);
		
		this.equipoOV = Operaciones.recuperarObjetoDescriptible("equipo",this.protocoloOV.getIdEquipo());
		this.diagnosticoOV = Operaciones.recuperarObjetoDescriptible("diagnostico",this.protocoloOV.getIdDiagnostico());

		if (this.protocoloOV.getIdPedido() > 0){
			containerOV.setString1("pedido");
			containerOV.setString2(String.valueOf(this.protocoloOV.getIdPedido()));
		
			PedidoOV pedidoOV = (PedidoOV) ((ListPedidoOV) Operaciones.ejecutar("TraerDeterminacionesDePedido", containerOV, ListPedidoOV.class)).getList().get(0);
			this.pedidoOV = pedidoOV;
		}
			
		this.clienteOV.setId(this.protocoloOV.getIdCliente());
		this.clienteOV.setCodigo(this.protocoloOV.getCodCliente());
			
		this.sucursalOV.setId(this.protocoloOV.getIdSucursal());
		this.sucursalOV.setCodigo(this.protocoloOV.getCodSucursal());
		this.sucursalOV.setDescripcionCompleta(this.protocoloOV.getDescripcionCompleta());
				
		List<DeterminacionOV> listDeterminaciones = new ArrayList<DeterminacionOV>(); 
		for (DeterminacionOV det : this.protocoloOV.getDeterminaciones()){
			MetodoOV met = new MetodoOV();
			met.setId(det.getIdMetodoUtilizado()); //Seteamos el id del metodo utilizado
			met.setVariables(det.getVariables());
			met.setMetodo(det.getDescMetodo());
						
			det.getMetodos().add(met);
			det.setDescMetodo(met.getMetodo());
			listDeterminaciones.add(det);
			
			if(!det.getMetodos().isEmpty()){
				det.setMetodoUtilizado(det.getMetodos().get(0));
			}
			
		}
		
		this.protocoloOV.setDeterminaciones(listDeterminaciones);

		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);

	}
	
	@Override
	@GlobalCommand("actualizar")
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV","tipoItem","sucursalOV","diagnosticoOV"})
	public void actualizar() {
			
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		this.nuevo();
		Executions.sendRedirect(Executions.getCurrent().getDesktop().getFirstPage().getRequestPath());
	}

	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}
	
	@Command("traerDeterminaciones")
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV","tipoItem","sucursalOV","diagnosticoOV"})
	public void traerDeterminaciones(){
				
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1("pedido");
		containerOV.setString2(String.valueOf(this.pedidoOV.getId()));
		
		PedidoOV pedidoOV = (PedidoOV) ((ListPedidoOV) Operaciones.ejecutar("TraerDeterminacionesDePedido", containerOV, ListPedidoOV.class)).getList().get(0);
		
		this.clienteOV.setId(pedidoOV.getIdCliente());
		this.clienteOV.setCodigo(pedidoOV.getCodCliente());
		this.clienteOV.setDescripcion(pedidoOV.getDescCliente());
		
		this.sucursalOV.setId(pedidoOV.getIdSucursal());
		this.sucursalOV.setCodigo(pedidoOV.getCodSucursal());
		this.sucursalOV.setDescripcionCompleta(pedidoOV.getDescripcionCompleta());
		
		this.pedidoOV = pedidoOV; 
		
		List<Long> listaIdsDeterminaciones = new ArrayList<Long>();
		for (ItemsOV itemsOV : this.pedidoOV.getItems()) {
			if(itemsOV.getTipoItem()==this.tipoItem){
				listaIdsDeterminaciones.add(itemsOV.getIdDeterminacion());
			}
		}
		
		this.protocoloOV.setDeterminaciones(new ArrayList<DeterminacionOV>());
		for (Long idDeterminacionActual : listaIdsDeterminaciones) {
			//buscar para cada uno, en la base, la determinacion con todos los datos.
			
			DeterminacionOV det = obtenerDeterminacion(idDeterminacionActual);
			
			this.protocoloOV.getDeterminaciones().add(det);
			
		}
	
	}

	private DeterminacionOV obtenerDeterminacion(Long idDeterminacionActual) {
		ContainerOV containerOVForDeterm = new ContainerOV();
		containerOVForDeterm.setString1(String.valueOf(idDeterminacionActual));
		containerOVForDeterm.setString2("Determinacion");
		
		DeterminacionOV det = (DeterminacionOV) Operaciones.ejecutar("TraerDeterminacion", containerOVForDeterm, DeterminacionOV.class);
		
		det = this.obtenerMetodosParaDeterminacion(det);
		return det;
	}

	private DeterminacionOV obtenerMetodosParaDeterminacion(DeterminacionOV det) {
		
		ContainerOV containerOV = new ContainerOV();
		
		for (MetodoOV metodo : det.getMetodos()) {

			long idMetodo = metodo.getId();
			containerOV.setString1(String.valueOf(idMetodo));

			List<ValorEsperadoOV> valoresEsperados = ((ListValorEsperadoOV) Operaciones.ejecutar("TraerValoresEsperados", containerOV, ListValorEsperadoOV.class)).getList();

			containerOV.setString1(String.valueOf(idMetodo));
			List<VariableOV> variables = ((ListVariableOV) Operaciones.ejecutar("TraerVariables", containerOV, ListVariableOV.class)).getList();

			metodo.setVariables(variables);

			for (VariableOV variableOV : variables) {
				if (variableOV.isResultadoFinal()) {
					metodo.setResultadoFinal(variableOV);
					break;
				}
			}

			metodo.setValoresEsperados(valoresEsperados);
		}

		String idTipoResultado = det.getIdTipoResultado();
		DescriptibleOV tipoResultadoSeleccionado = null;
		for (DescriptibleOV tipoResultado : det.getListTipoResultado()) {
			if (tipoResultado.getCodigo().equals(idTipoResultado)) {
				tipoResultadoSeleccionado = tipoResultado;
				break;
			}
		}

		det.setTipoResultado(tipoResultadoSeleccionado);

		String cadenaFormato = det.getIdFormato();
		DescriptibleOV formatoSeleccionado = null;
		for (DescriptibleOV formato : det.getListFormato()) {
			if (formato.getCodigo().equals(cadenaFormato)) {
				formatoSeleccionado = formato;
				break;
			}
		}

		det.setFormato(formatoSeleccionado);
		
		if(!det.getMetodos().isEmpty()){
			det.setMetodoUtilizado(det.getMetodos().get(0));
		}
		
		return det;
	}
	
	DescriptibleOV determinacionOV= new DescriptibleOV();
	
	@Command
	public synchronized void agregarDeterminacion() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException{
		openComplexHelper("determinacion", String.valueOf(idLaboratorio), determinacionOV, "traerDeterminacion", "Determinaciones", "Código", "Descripción",false, "","");
	}
	
	public void traerDeterminacion(){
		DeterminacionOV det = obtenerDeterminacion(determinacionOV.getId());
		this.protocoloOV.getDeterminaciones().add(0,det);
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}
	
	@Command("calcularExpresion")
	@NotifyChange("protocoloOV")
	public void calcularExpresionDesdeVista(@BindingParam("metodo") MetodoOV metodoOV) {
		this.calcularExpresion(metodoOV);
	}
		
	private boolean calcularExpresion(MetodoOV metodoOV) {
		
		metodoOV.setId(0);
		
		Map<String, VariableOV> idsVar =  new HashMap<String, VariableOV>();
		
		List<VariableOV> variables = metodoOV.getVariables();
		int i=1;
		for (VariableOV variableOV : variables) {
			variableOV.setIdTmp(i);
			idsVar.put(String.valueOf(variableOV.getIdTmp()), variableOV);
			variableOV.setId(0L);
			i+=1;
		}
		
		MetodoOV met = null;
		
		try{
			met = (MetodoOV) Operaciones.ejecutar("calcularExpresiones", metodoOV, MetodoOV.class);

			for (VariableOV variableOV :  met.getVariables()) {
				VariableOV variableEnMapa = idsVar.get(String.valueOf(variableOV.getIdTmp()));
				variableEnMapa.setResultadoExpresion(variableOV.getResultadoExpresion());
			}
			
		} catch(Exception e) {
			Messagebox.show("Verifique la expresión del metodo "+ metodoOV.getMetodo() +" por favor.");
			return false;
		}
		
		return true;
	}

	@Command
	public void abrirNuevo(){
		
		Window window = (Window) Executions.createComponents("/pantallas/protocolo/nuevoEquipo.zul", null, null);
		window.doModal();
	}
	
	public void actualizarCamposDependientesDeCliente() {
		this.sucursalOV = new SucursalOV();
	}
	
	public void actualizarCampoSucursal() {
		String text = this.clienteOV.getDescripcion().concat("/").concat(this.sucursalOV.getDescripcion());
		this.sucursalOV.setDescripcionCompleta(text);
	}
	
}
