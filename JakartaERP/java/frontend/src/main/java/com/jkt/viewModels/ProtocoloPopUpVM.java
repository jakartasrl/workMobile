package com.jkt.viewModels;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.laboratorio.dominio.Protocolo;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.DeterminacionOV;
import com.jkt.ov.ListPedidoOV;
import com.jkt.ov.ListProtocoloOV;
import com.jkt.ov.MetodoOV;
import com.jkt.ov.PedidoOV;
import com.jkt.ov.ProtocoloOV;
import com.jkt.ov.UserOV;

@Data
public class ProtocoloPopUpVM {
	
	
	private ProtocoloOV protocoloOV = new ProtocoloOV();
	private DescriptibleOV clienteOV = new DescriptibleOV();
	private DescriptibleOV equipoOV = new DescriptibleOV();
	private PedidoOV pedidoOV = new PedidoOV();
	private Boolean modoAprobacion=true;
	private ProtocoloAprobacionesVM vm;
	
	@Init
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV","tipoItem"})
	public void init(@ExecutionArgParam("pd") DescriptibleOV protocoloDescriptible,@ExecutionArgParam("vm") ProtocoloAprobacionesVM vm) throws JakartaException{
		
		this.vm = vm;
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1("protocolo");
		containerOV.setString2(String.valueOf(protocoloDescriptible.getId()));
		
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
		
	}

	@Command
	public void guardar(@BindingParam("window") Window x) throws JakartaException {
		
		Session sess = Sessions.getCurrent();
		  
		UserOV userOV = (UserOV) sess.getAttribute("userCredential");
		this.protocoloOV.setIdUsuario(userOV.getId());
		
		this.protocoloOV.setComentarioDiagnostico("APROBADO POR "+userOV.getName()+" "+userOV.getLastName());
		this.protocoloOV.setFechaAprobacion(new Date());
		this.protocoloOV.setEstado(Protocolo.Estado.APROBADO.getId());
		Operaciones.ejecutar("AprobarProtocolo", this.protocoloOV );
		
		this.vm.init(this.vm.getLaboratorioParametroKey(), true);
		BindUtils.postGlobalCommand(null, null,this.vm.retrieveMethod(), null);
		
		x.detach();
	}

	@Command
	public void cerrarModal(@BindingParam("window") Window x) {
		x.detach();
	}
	
}
