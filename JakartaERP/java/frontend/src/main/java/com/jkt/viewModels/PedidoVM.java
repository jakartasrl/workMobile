package com.jkt.viewModels;

import java.util.HashMap;
import java.util.Map;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Window;

import com.jkt.common.Closure;
import com.jkt.common.Operaciones;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.PedidoOV;
import com.jkt.pedido.dominio.Pedido;

/**
 * ViewModel de la entidad {@link Pedido} que se encarga de procesar las diferentes peticiones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class PedidoVM implements IBasicOperations{
	
	private String descripcionCliente;
	
	public String getDescripcionCliente() {
		return descripcionCliente;
	}

	public void setDescripcionCliente(String descripcionCliente) {
		this.descripcionCliente = descripcionCliente;
	}

	@Override
	public void guardar() {
		
	}

	@Override
	public void nuevo() {
		
	}

	@Override
	public void cerrar() {
		
	}

	@Override
	public void cancelar() {
		
	}

	@Override
	@Command
	public void buscar() {
		
		PedidoOV pedidoOV = new PedidoOV();
		pedidoOV.setNro("PEDIDO-55-45");
		pedidoOV.setLetra("A");
		
		Operaciones.ejecutar("GuardarPedido",pedidoOV);
	}

	@Override
	public void buscarEliminados() {
		
	}

	@Override
	public void imprimir() {
		
	}
	
	@Command
	public void openHelper(@BindingParam("clase") String clase) {
		ListDescriptibleOV listDescriptible = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV(clase), ListDescriptibleOV.class);

		Map map=new HashMap();
		map.put("coleccion",listDescriptible.getList());
		map.put("argCodigo", "Codigo");
		map.put("argDescripcion", "Descripción");
		map.put("argId", "Id");

		final PedidoVM pvm=this;
		
		Closure c = new Closure() {

			PedidoVM pedido=pvm;
			HelperVM helper;

			public PedidoVM getPedido() {
				return pedido;
			}

			public void setPedido(PedidoVM pedido) {
				this.pedido = pedido;
			}

			public HelperVM getHelper() {
				return helper;
			}

			public void setHelper(HelperVM helper) {
				this.helper = helper;
			}

			@Override
			public void ejecutarAcciones() {
				this.pedido.setDescripcionCliente(helper.getDescripcion());
			}

			@Override
			public HelperVM getHelpVM() {
				return this.helper;
			}

			@Override
			public void setVM(HelperVM helper) {
				this.helper=helper;
			}
		};
		
		
		map.put("closure", c);
		
		Window window = (Window) Executions.createComponents("/pantallas/pedido/helpGenerico.zul", null, map);
		window.doModal();
	}

}
