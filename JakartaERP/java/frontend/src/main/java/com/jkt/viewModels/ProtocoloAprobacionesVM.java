package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;

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
import com.jkt.ov.EquipoOV;
import com.jkt.ov.FiltroOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListProtocoloOV;
import com.jkt.ov.ParametroOV;
import com.jkt.ov.PedidoOV;
import com.jkt.ov.ProtocoloOV;
import com.jkt.ov.UserOV;
import com.jkt.service.ServiceRepository;

@Data
public class ProtocoloAprobacionesVM extends ViewModel implements IBasicOperations {
		
	private List<DescriptibleOV> listProtocoloDescriptible = new ArrayList<DescriptibleOV>();
	private List<ProtocoloOV> listProtocolo = new ArrayList<ProtocoloOV>();
	private UserOV userOV = new UserOV();

	//Para manejar diferenciar los laboratorios quimicos y electricos
	private long idLaboratorio;
	private String laboratorioParametroKey;
	private char tipoItem;
	
	private Boolean modoAprobacion;
	
	@Init(superclass=true)
	@NotifyChange({"listProtocolo","listProtocoloDescriptible"})
	public void init(@BindingParam("l") String laboratorio, @BindingParam("modoAprobacion") Boolean modoAprobacion){
		
		listProtocolo = new ArrayList<ProtocoloOV>();
		this.modoAprobacion=modoAprobacion;
		
		if(this.modoAprobacion){
			this.setTitulo("Aprobación de Protocolos");
		}else{
			this.setTitulo("Administración de Protocolos");
		}
				
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
		
		filtros.add(new FiltroOV("estado", String.valueOf(Protocolo.Estado.ESTADO_INICIAL.getId()), ServiceRepository.CONDICION_IGUAL, ServiceRepository.INTEGER));
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
	
	@Override
	public void guardar() throws JakartaException {

	}

	@Override
	public void nuevo() throws JakartaException {
		
	}

	@Override
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		
	}

	@Override
	@GlobalCommand("actualizar")
	@NotifyChange({"listProtocolo","listProtocoloDescriptible"})
	public void actualizar() {
			
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		
	}

	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}
	
	private DescriptibleOV protocoloDescriptible = new DescriptibleOV();
	
	@Command("aprobarProtocolo")
	public void aprobarProtocolo(@BindingParam("protocolo") DescriptibleOV protocolo) throws JakartaException {
			
		this.protocoloDescriptible = protocolo;

		Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("vm", this);
		parametros.put("pd", protocoloDescriptible);
		
		Window window = (Window) Executions.createComponents("/pantallas/protocolo/protocolo-popup-aprobacion.zul", null, parametros);
		window.doModal();
		
	}
	
}
