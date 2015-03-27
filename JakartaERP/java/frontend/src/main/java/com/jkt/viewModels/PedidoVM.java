package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ClienteOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListDeterminacionOV;
import com.jkt.ov.ListNotasOV;
import com.jkt.ov.ListaPrecioOV;
import com.jkt.ov.PedidoOV;
import com.jkt.pedido.dominio.Pedido;
//import com.jkt.view.ContainerOV;
import com.jkt.view.ObjectView;

/**
 * ViewModel de la entidad {@link Pedido} que se encarga de procesar las diferentes peticiones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class PedidoVM extends ViewModel {
	
	private ClienteOV clienteOV=new ClienteOV();
	private ListaPrecioOV lPreciosOV=new ListaPrecioOV();
	private ListDeterminacionOV lDeterminacionesQuimicas=new ListDeterminacionOV();
	private ListDeterminacionOV lDeterminacionesElectricas=new ListDeterminacionOV();
	private ListNotasOV lNotas=new ListNotasOV();
	private ListDescriptibleOV lDocumentacion=new ListDescriptibleOV();
	
	public ListDescriptibleOV getlDocumentacion() {
		return lDocumentacion;
	}

	public void setlDocumentacion(ListDescriptibleOV lDocumentacion) {
		this.lDocumentacion = lDocumentacion;
	}

	public ListNotasOV getlNotas() {
		return lNotas;
	}

	public void setlNotas(ListNotasOV lNotas) {
		this.lNotas = lNotas;
	}

	public ListDeterminacionOV getlDeterminacionesQuimicas() {
		return lDeterminacionesQuimicas;
	}

	public void setlDeterminacionesQuimicas(ListDeterminacionOV lDeterminacionesQuimicas) {
		this.lDeterminacionesQuimicas = lDeterminacionesQuimicas;
	}

	public ListDeterminacionOV getlDeterminacionesElectricas() {
		return lDeterminacionesElectricas;
	}

	public void setlDeterminacionesElectricas(ListDeterminacionOV lDeterminacionesElectricas) {
		this.lDeterminacionesElectricas = lDeterminacionesElectricas;
	}

	public ListaPrecioOV getlPreciosOV() {
		return lPreciosOV;
	}

	public void setlPreciosOV(ListaPrecioOV lPreciosOV) {
		this.lPreciosOV = lPreciosOV;
	}

	public ClienteOV getClienteOV() {
		return clienteOV;
	}

	public void setClienteOV(ClienteOV clienteOV) {
		this.clienteOV = clienteOV;
	}

	private String descripcionCliente;
	
	public String getDescripcionCliente() {
		return descripcionCliente;
	}

	public void setDescripcionCliente(String descripcionCliente) {
		this.descripcionCliente = descripcionCliente;
	}

	
	@Command
	public void buscar() {
		
		PedidoOV pedidoOV = new PedidoOV();
		pedidoOV.setNro("PEDIDO-55-45");
		pedidoOV.setLetra("A");
		
		Operaciones.ejecutar("GuardarPedido",pedidoOV);
		
	}

	@Init
	public void init(){
		log.info("Iniciando ViewModel de Pedido.");
		
		log.info("Recuperando notas...");
		this.lNotas = (ListNotasOV) Operaciones.ejecutar("TraerNotas", ListNotasOV.class);
		
		log.info("Recuperando documentos...");
		this.lDocumentacion = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV("documentacion"), ListDescriptibleOV.class);
		
	}
	
	@Command
	public void openHelper(@BindingParam("clase") String clase, @BindingParam("oidEntidadMaestra") String oidEntidadMaestra ,@BindingParam("ov") ObjectView ov,@BindingParam("post") String metodo) throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {

		if (ov==null) {
			log.warn("No se ha indicado un objeto vista de destino. Por favor indique uno, de modo contrario, solamente la ventana es de una simple consulta de ayuda.");
		}
		
		ListDescriptibleOV listDescriptible;
		if (oidEntidadMaestra==null || oidEntidadMaestra.isEmpty()) {
			listDescriptible = (ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV(clase), ListDescriptibleOV.class);
		}else{
			HelperOV helperOV = new HelperOV();
			helperOV.setClase(clase);
			helperOV.setOidEntidadMaestra(oidEntidadMaestra);
			listDescriptible = (ListDescriptibleOV) Operaciones.ejecutar("HelperCompuesto",helperOV , ListDescriptibleOV.class);
		}

		Map map=new HashMap();
		
		map.put("coleccion",listDescriptible.getList());
		map.put("refresh", retrieveMethod());
		map.put("result", ov);
		map.put("invoke", metodo);
		map.put("vm", this);

		Window window = (Window) Executions.createComponents("/pantallas/pedido/helpGenerico.zul", null, map);
		window.doModal();
		
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
	private ListDeterminacionOV actualizarDeterminaciones(String parametroLaboratorio) {
		Long idListaPrecio = this.getlPreciosOV().getId();
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(parametroLaboratorio);
		containerOV.setString2(String.valueOf(idListaPrecio));
		
		return (ListDeterminacionOV) Operaciones.ejecutar("TraerDeterminacionConPrecio",containerOV,ListDeterminacionOV.class);
	}
	
	@GlobalCommand("actualizarOVs")
	@NotifyChange({"clienteOV","lPreciosOV","lDeterminacionesQuimicas","lDeterminacionesElectricas"})
	public void actualizar(){}
	
	protected String retrieveMethod() {
		return "actualizarOVs";
	}

}
