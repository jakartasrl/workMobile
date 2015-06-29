package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.bind.annotation.QueryParam;
import org.zkoss.zk.ui.Executions;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.DeterminacionOV;
import com.jkt.ov.EquipoOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListPedidoOV;
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
	private EquipoOV equipoOV = new EquipoOV();
	private PedidoOV pedidoOV = new PedidoOV();
	
	//Para manejar diferenciar los laboratorios quimicos y electricos
	private long idLaboratorio;
	private String laboratorioParametroKey;
	private char tipoItem;
	
	@Init
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV","tipoItem"})
	public void init(@QueryParam("l") String laboratorio){
		
		this.setTitulo("Protocolo");
		
		this.protocoloOV = new ProtocoloOV();
		this.clienteOV = new DescriptibleOV();
		this.equipoOV = new EquipoOV();
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
	
	@Override
	public void guardar() throws JakartaException {
		
		Operaciones.ejecutar("GuardarProtocolo", this.protocoloOV );
		Executions.sendRedirect("/pantallas/protocolo/index-protocolo.zul?l="+this.laboratorioParametroKey);
		
	}

	@Command
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV"})
	public void nuevo() throws JakartaException {
		this.init(this.laboratorioParametroKey);
	}

	@Override
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
	
	}
	
	@Override
	@GlobalCommand("actualizar")
	@NotifyChange({"protocoloOV","clienteOV","equipoOV","pedidoOV","tipoItem"})
	public void actualizar() {
			
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		this.nuevo();
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
		return det;
	}
	
	@Command
	@NotifyChange({"protocoloOV","pedidoOV"})
	public void agregarInput(@BindingParam("determinacion") DeterminacionOV determinacionOV, @BindingParam("metodo") MetodoOV metodoOV, @BindingParam("variable") VariableOV variableOV){
		
		for (DeterminacionOV det : protocoloOV.getDeterminaciones()) {
			for (MetodoOV met : det.getMetodos()) {
				for (VariableOV var : met.getVariables()) {
					if (var == variableOV){
						var = variableOV;
					}
				}
			}
		}
			
	}

	@Command
	@NotifyChange("protocoloOV")
	public void calcularExpresion(@BindingParam("determinacion") DeterminacionOV determinacionOV, @BindingParam("metodo") MetodoOV metodoOV){
		
		metodoOV.setId(0);
		MetodoOV met = (MetodoOV) Operaciones.ejecutar("calcularExpresiones", metodoOV, MetodoOV.class);
		
		System.out.println(met.getMetodo());
		
	}

}
