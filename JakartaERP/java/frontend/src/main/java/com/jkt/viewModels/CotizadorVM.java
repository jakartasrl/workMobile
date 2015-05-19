package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;

import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.DefaultTreeModel;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.CotizadorOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ModeloCotizadorOV;
import com.jkt.ov.TituloModeloCotizadorOV;
import com.jkt.ov.tree.NodoTitulos;

@Data
public class CotizadorVM extends ViewModel implements IBasicOperations {
	
	private String titulo = "Cotizador";
	private CotizadorOV cotizadorOV = new CotizadorOV();
	private DescriptibleOV clienteOV = new DescriptibleOV();
	private DescriptibleOV vendedorOV = new DescriptibleOV();
	private ModeloCotizadorOV modeloCotizadorOV = new ModeloCotizadorOV();
	private ListDescriptibleOV monedas = new ListDescriptibleOV();

	private ItemsOV itemSelected = new ItemsOV();
	
	private DefaultTreeModel<TituloModeloCotizadorOV> arbolTitulos;
	
	public void guardar() throws JakartaException {
		
	}
	
	@Command
	public void buscar() throws JakartaException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		
		openComplexHelper("itemCotizacion", "", this.itemSelected, "cargarItemACotizar", "Items de Presupuesto", "Nro ítem", "Descripción del ítem",false, "","");

	}
	
	@SuppressWarnings("unchecked")
	@NotifyChange({"cotizadorOV","itemSelected"})
	public void cargarItemACotizar(){
		
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.itemSelected.getId()));
		ItemsOV itemsOV = (ItemsOV) Operaciones.ejecutar("TraerItem", objetoOV, ItemsOV.class);
		
		objetoOV.setString1(String.valueOf(this.itemSelected.getIdCotizador()));
//		CotizacionOV cotizacion = (CotizacionOV) Operaciones.ejecutar("TraerCotizacionDelItem", objetoOV, ItemsOV.class);
	
		this.setItemSelected(itemsOV);
			
	}
	
	@GlobalCommand("actualizar")
	@NotifyChange({"cotizadorOV","itemSelected","arbolTitulos","modeloCotizadorOV"})
	public void actualizar() {
		log.warn("Actualizando datos...");
	}

	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}
	
	
	@Command
	@NotifyChange({"modeloCotizadorOV","tituloModeloCotizadorOV","arbolTitulos"})
	public void nuevo(){
		NodoTitulos root = new NodoTitulos(new TituloModeloCotizadorOV(),true);
		NodoTitulos nodo1 =  new NodoTitulos(new TituloModeloCotizadorOV(),true);
		NodoTitulos nodo2 =  new NodoTitulos(new TituloModeloCotizadorOV(),true);
		nodo1.getData().setCodigo("AAA");
		nodo1.getData().setDescripcion("BBB");
		nodo2.getData().setCodigo("CCC");
		nodo2.getData().setDescripcion("DDD");
		root.add(nodo1);
		root.add(nodo2);
		this.arbolTitulos=new DefaultTreeModel<TituloModeloCotizadorOV>(root);
	}
	
	@Init
	public void init(){

	}

	@Command
	@NotifyChange({"cotizadorOV","modeloCotizadorOV"})
	public void traerModeloCotizador() throws IllegalAccessException, InvocationTargetException, JakartaException {
		
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.modeloCotizadorOV.getId()));
		ModeloCotizadorOV modeloCotizadorOV = (ModeloCotizadorOV) Operaciones.ejecutar("TraerModeloParaCotizar", objetoOV, ModeloCotizadorOV.class);

		crearArbolModeloCotizador(modeloCotizadorOV);
		this.setModeloCotizadorOV(modeloCotizadorOV);
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
		
	}

	private void crearArbolModeloCotizador(ModeloCotizadorOV modeloCotizadorOV2) {
		
		NodoTitulos root = new NodoTitulos(new TituloModeloCotizadorOV(),true);

		List<TituloModeloCotizadorOV> todosLosTitulos = modeloCotizadorOV2.getTitulos();
		Map<String,NodoTitulos> relaciones=new HashMap<String, NodoTitulos>();
		for (TituloModeloCotizadorOV tituloModeloCotizadorOV : todosLosTitulos) {
			NodoTitulos nodoActual;
			if (tituloModeloCotizadorOV.getTipo().equals("C")) {
				
				DescriptibleOV concepto=new DescriptibleOV();
				concepto.setId(tituloModeloCotizadorOV.getIdC());
				concepto.setCodigo(tituloModeloCotizadorOV.getCodigoC());
				concepto.setDescripcion(tituloModeloCotizadorOV.getDescripcionC());
				
				tituloModeloCotizadorOV.setConcepto(concepto);
				nodoActual=new NodoTitulos(tituloModeloCotizadorOV);
			}else{
				nodoActual=new NodoTitulos(tituloModeloCotizadorOV,true);
			}
			relaciones.put(String.valueOf(tituloModeloCotizadorOV.getCodigoInterno()), nodoActual);
		}
		
		Collection<NodoTitulos> values = relaciones.values();
		for (NodoTitulos nodoTitulos : values) {
			int codigoInternoPadre = nodoTitulos.getData().getCodigoInternoPadre();
			if (codigoInternoPadre==0) {//no tiene padre, entonces es root
				root.add(nodoTitulos);
			}else{//si tiene padre, asigno la referencia usando el mapa.
				NodoTitulos padre = relaciones.get(String.valueOf(codigoInternoPadre));
				padre.add(nodoTitulos);
			}
		}
		
		this.arbolTitulos=new DefaultTreeModel<TituloModeloCotizadorOV>(root);
		System.out.println();
	}
	
}
