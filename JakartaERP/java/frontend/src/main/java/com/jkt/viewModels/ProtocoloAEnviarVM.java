package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
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
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.laboratorio.dominio.Protocolo;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.ContenedorFiltrosOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.DeterminacionOV;
import com.jkt.ov.FiltroOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListPedidoOV;
import com.jkt.ov.ListProtocoloOV;
import com.jkt.ov.MetodoOV;
import com.jkt.ov.ParametroOV;
import com.jkt.ov.PedidoOV;
import com.jkt.ov.ProtocoloOV;
import com.jkt.ov.UserOV;
import com.jkt.service.ServiceRepository;

@Data
public class ProtocoloAEnviarVM extends ViewModel implements IBasicOperations {
	
	private ProtocoloOV protocoloOV = new ProtocoloOV();
	private DescriptibleOV clienteOV = new DescriptibleOV();
	private DescriptibleOV equipoOV = new DescriptibleOV();
	private PedidoOV pedidoOV = new PedidoOV();
	
	private List<DescriptibleOV> listProtocoloDescriptible = new ArrayList<DescriptibleOV>();
	private List<ProtocoloOV> listProtocolo = new ArrayList<ProtocoloOV>();
	private UserOV userOV = new UserOV();
	
	private Boolean modoAprobacion = true; // solo para que aparezcan todos los campos como readonly en el zul
	
	//Para manejar diferenciar los laboratorios quimicos y electricos
	private long idLaboratorio;
	private String laboratorioParametroKey;
	private char tipoItem;
	
	@Init(superclass=true)
	@NotifyChange({"listProtocolo","listProtocoloDescriptible"})
	public void init(@BindingParam("l") String laboratorio){
		
		this.setTitulo("Protocolos Pendientes de envio");
		this.listProtocolo = new ArrayList<ProtocoloOV>();
		
		this.laboratorioParametroKey = laboratorio;
		
		if(laboratorio.equalsIgnoreCase("LaboratorioQuimico")){
			tipoItem='Q';
		} else if(laboratorio.equalsIgnoreCase("LaboratorioElectrico")){
			tipoItem='E';
		}
		
		ParametroOV laboratorioParam = (ParametroOV) Operaciones.ejecutar("TraerParametro", new ContainerOV(laboratorio), ParametroOV.class);
		this.idLaboratorio = Long.valueOf(laboratorioParam.getValorNumero());
		
		//Traemos la lista de protocolos
		ContenedorFiltrosOV c=new ContenedorFiltrosOV();
		c.setClase("protocolo");
		
		List<FiltroOV> filtros=new ArrayList<FiltroOV>();
		
		filtros.add(new FiltroOV("estado", String.valueOf(Protocolo.Estado.TERMINADO.getId()), ServiceRepository.CONDICION_IGUAL, ServiceRepository.INTEGER));
		filtros.add(new FiltroOV("laboratorio.id", String.valueOf(this.idLaboratorio), ServiceRepository.CONDICION_IGUAL, ServiceRepository.LONG));
		filtros.add(new FiltroOV("activo", String.valueOf(true), ServiceRepository.CONDICION_IGUAL, ServiceRepository.BOOLEAN));
		
		c.setFiltros(filtros);
		
		ListDescriptibleOV listDescriptible = (ListDescriptibleOV) Operaciones.ejecutar("HelperConFiltro", c, ListDescriptibleOV.class);		
		this.listProtocoloDescriptible = listDescriptible.getList();
		
		ContainerOV containerOV = new ContainerOV();
		for(DescriptibleOV protocoloDescriptible : this.listProtocoloDescriptible){
			containerOV.setString1("protocolo");
			containerOV.setString2(String.valueOf(protocoloDescriptible.getId()));
		
			ListProtocoloOV p = (ListProtocoloOV) Operaciones.ejecutar("TraerProtocolo", containerOV, ListProtocoloOV.class);
			ProtocoloOV protocoloOV = (ProtocoloOV) p.getList().get(0);
			
			if (protocoloOV.getIdPedido() > 0){
				containerOV.setString1(String.valueOf(protocoloOV.getIdPedido()));
			
				PedidoOV pedidoOV = (PedidoOV) Operaciones.ejecutar("TraerPedido", containerOV, PedidoOV.class);
				protocoloOV.setNroPedido(pedidoOV.getNro());
			}
		
			this.listProtocolo.add(protocoloOV);
		}
		
	}

	@Command
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV"})
	public void guardar() throws JakartaException {
		
		Session sess = Sessions.getCurrent();

		UserOV userOV = (UserOV) sess.getAttribute("userCredential");
		this.protocoloOV.setIdUsuario(userOV.getId());

		this.protocoloOV.setComentarioDiagnostico("TERMINADO POR "+ userOV.getName() + " " + userOV.getLastName());
		this.protocoloOV.setFechaFinalizacion(new Date());
		this.protocoloOV.setEstado(Protocolo.Estado.TERMINADO.getId());
		Operaciones.ejecutar("TerminarProtocolo", this.protocoloOV);
		Executions.sendRedirect(Executions.getCurrent().getDesktop().getFirstPage().getRequestPath());

	}

	@Override
	public void nuevo() throws JakartaException {
		
	}

	private DescriptibleOV protocoloDescriptible = new DescriptibleOV();
	
	@Override
	@Command
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {

		ContenedorFiltrosOV c=new ContenedorFiltrosOV();
		c.setClase("protocolo");
		
		List<FiltroOV> filtros=new ArrayList<FiltroOV>();
		
		filtros.add(new FiltroOV("estado", String.valueOf(Protocolo.Estado.APROBADO.getId()), ServiceRepository.CONDICION_IGUAL, ServiceRepository.INTEGER));
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
	
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV","tipoItem"})
	public void cargarProtocolo() throws JakartaException {
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1("protocolo");
		containerOV.setString2(String.valueOf(this.protocoloDescriptible.getId()));
		
		ListProtocoloOV p = (ListProtocoloOV) Operaciones.ejecutar("TraerProtocolo", containerOV, ListProtocoloOV.class);
		this.protocoloOV = (ProtocoloOV) p.getList().get(0);
		
		this.equipoOV = Operaciones.recuperarObjetoDescriptible("equipo",this.protocoloOV.getIdEquipo());

		containerOV.setString1("pedido");
		containerOV.setString2(String.valueOf(this.protocoloOV.getIdPedido()));
		
		PedidoOV pedidoOV = (PedidoOV) ((ListPedidoOV) Operaciones.ejecutar("TraerDeterminacionesDePedido", containerOV, ListPedidoOV.class)).getList().get(0);
		
		this.clienteOV.setId(pedidoOV.getIdCliente());
		this.clienteOV.setCodigo(pedidoOV.getCodCliente());
		this.clienteOV.setDescripcion(pedidoOV.getDescCliente());
		
		this.pedidoOV = pedidoOV;
				
		List<DeterminacionOV> listDeterminaciones = new ArrayList<DeterminacionOV>(); 
		for (DeterminacionOV det : this.protocoloOV.getDeterminaciones()){
			MetodoOV met = new MetodoOV();
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
	@NotifyChange({"listProtocolo","listProtocoloDescriptible"})
	public void actualizar() {
			
	}
	
	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		Executions.sendRedirect(Executions.getCurrent().getDesktop().getFirstPage().getRequestPath());
	}

	@Command
	public void facturar(){
		
		boolean seFacturo=false;
		
		for (ProtocoloOV protocoloOV : listProtocolo) {
			if(protocoloOV.isSeleccionado()){
				//enviar la operacion con el id de protocolo y generar la facturacion..
				ContainerOV containerOV = new ContainerOV();
				containerOV.setString1(String.valueOf(protocoloOV.getId()));
				Operaciones.ejecutar("facturar", containerOV);
				seFacturo=true;
			}
		}
		
		if(seFacturo){
			
		}
		
	}
	
}
