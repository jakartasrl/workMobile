package com.jkt.viewModels;

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
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.DeterminacionOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListPedidoOV;
import com.jkt.ov.ListProtocoloOV;
import com.jkt.ov.ListValorEsperadoOV;
import com.jkt.ov.ListVariableOV;
import com.jkt.ov.MetodoOV;
import com.jkt.ov.ParametroOV;
import com.jkt.ov.PedidoOV;
import com.jkt.ov.ProtocoloOV;
import com.jkt.ov.ValorEsperadoOV;
import com.jkt.ov.VariableOV;

@Data
public class ProtocoloVM extends ViewModel implements IBasicOperations {
	
	private ProtocoloOV protocoloOV = new ProtocoloOV();
	private DescriptibleOV clienteOV = new DescriptibleOV();
	private DescriptibleOV equipoOV = new DescriptibleOV();
	private PedidoOV pedidoOV = new PedidoOV();
	
	//Para manejar diferenciar los laboratorios quimicos y electricos
	private long idLaboratorio;
	private String laboratorioParametroKey;
	private char tipoItem;
	
	@Init(superclass=true)
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV","tipoItem"})
	public void init(@BindingParam("l") String laboratorio){
		
		if(isCargadoDesdeSession()){return;}
		
		this.setTitulo("Protocolo");
		
		this.protocoloOV = new ProtocoloOV();
		this.clienteOV = new DescriptibleOV();
		this.equipoOV = new DescriptibleOV();
		this.pedidoOV = new PedidoOV();
		
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
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV"})
	public void guardar() throws JakartaException {

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
		this.protocoloOV.setIdLab(this.idLaboratorio);
		
		Operaciones.ejecutar("GuardarProtocolo", this.protocoloOV );
		
		Executions.sendRedirect(Executions.getCurrent().getDesktop().getFirstPage().getRequestPath());
		
	}

	@Command
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV"})
	public void nuevo() throws JakartaException {
		this.init(this.laboratorioParametroKey);
	}

	
	private DescriptibleOV protocoloDescriptible = new DescriptibleOV();
	
	@Override
	@Command
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		openHelper("protocolo", "", this.protocoloDescriptible, "cargarProtocolo", "Protocolos", "Codigo", "Descripcion", false);
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
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV","tipoItem"})
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
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV","tipoItem"})
	public void traerDeterminaciones(){
				
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1("pedido");
		containerOV.setString2(String.valueOf(this.pedidoOV.getId()));
		
		PedidoOV pedidoOV = (PedidoOV) ((ListPedidoOV) Operaciones.ejecutar("TraerDeterminacionesDePedido", containerOV, ListPedidoOV.class)).getList().get(0);
		
		this.clienteOV.setId(pedidoOV.getIdCliente());
		this.clienteOV.setCodigo(pedidoOV.getCodCliente());
		this.clienteOV.setDescripcion(pedidoOV.getDescCliente());
		
		this.pedidoOV = pedidoOV; 
		
		List<Long> listaIdsDeterminaciones = new ArrayList<Long>();
		for (ItemsOV itemsOV : this.pedidoOV.getItems()) {
			if(itemsOV.getTipoItem()==this.tipoItem){
				listaIdsDeterminaciones.add(itemsOV.getIdDeterminacion());
			}
		}
		
		for (Long idDeterminacionActual : listaIdsDeterminaciones) {
			//buscar para cada uno, en la base, la determinacion con todos los datos.
			
			ContainerOV containerOVForDeterm = new ContainerOV();
			containerOVForDeterm.setString1(String.valueOf(idDeterminacionActual));
			containerOVForDeterm.setString2("Determinacion");
			
			DeterminacionOV det = (DeterminacionOV) Operaciones.ejecutar("TraerDeterminacion", containerOVForDeterm, DeterminacionOV.class);
			
			det = this.obtenerMetodosParaDeterminacion(det);
			
			this.protocoloOV.getDeterminaciones().add(det);
			
		}
		
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
	
	@Command
	@NotifyChange("protocoloOV")
	public void calcularExpresion(@BindingParam("determinacion") DeterminacionOV determinacionOV, @BindingParam("metodo") MetodoOV metodoOV){
		
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
			Messagebox.show("Verifique la expresión por favor.");
		}
		
	}
	
}
