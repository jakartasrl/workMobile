package com.jkt.viewModels;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.Data;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zul.DefaultTreeModel;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.TreeNode;
import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ModeloCotizadorOV;
import com.jkt.ov.TituloModeloCotizadorOV;
import com.jkt.ov.tree.NodoTitulos;

@Data
public class ModeloCotizadorVM extends ViewModel implements IBasicOperations {
		
	private String titulo = "Modelos de Cotizador";
	private ModeloCotizadorOV modeloCotizadorOV = new ModeloCotizadorOV();
	private DefaultTreeModel<TituloModeloCotizadorOV> arbolTitulos;
	
	//Elementos recuperados del click
	private NodoTitulos nodoActual;
	private TituloModeloCotizadorOV tituloModeloCotizadorOV = new TituloModeloCotizadorOV();

	@GlobalCommand("actualizar")
	@NotifyChange({"modeloCotizadorOV","arbolTitulos","tituloModeloCotizadorOV","conceptoPresupuestoOV"})
	public void actualizar() {
		log.warn("Actualizando Modelos de Cotizador...");
	}

	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}
	
	@Command("guardar")
	@NotifyChange({"modeloCotizadorOV"})
	public void guardar() throws JakartaException {
		
		Operaciones.ejecutar("GuardarModeloCotizador", this.modeloCotizadorOV );
		Messagebox.show("Modelo de Cotizador Guardado Correctamente.");
		
	}

	@Override
	@Command
	@NotifyChange({"modeloCotizadorOV","tituloModeloCotizadorOV","arbolTitulos"})
	public void nuevo() throws JakartaException {	
		this.modeloCotizadorOV = new ModeloCotizadorOV();
		this.tituloModeloCotizadorOV = new TituloModeloCotizadorOV();
		
		NodoTitulos root = new NodoTitulos(new TituloModeloCotizadorOV(),true);
		this.arbolTitulos=new DefaultTreeModel<TituloModeloCotizadorOV>(root);
	}
	
	@Command
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		openHelper("modeloCotizador", "", this.modeloCotizadorOV, "traerModeloCotizador", "Modelos de Cotizador", "Codigo", "Descripcion", false);
	}
	
	public void traerModeloCotizador() throws IllegalAccessException, InvocationTargetException, JakartaException {
		
		ContainerOV objetoOV = new ContainerOV();
		objetoOV.setString1(String.valueOf(this.modeloCotizadorOV.getId()));
		ModeloCotizadorOV modeloCotizadorOV = (ModeloCotizadorOV) Operaciones.ejecutar("TraerModeloCotizador", objetoOV, ModeloCotizadorOV.class);
		
		cargarDesdeOV(modeloCotizadorOV);
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
		
	}
	
	private void cargarDesdeOV(ModeloCotizadorOV modeloCotizadorOV) throws JakartaException, IllegalAccessException, InvocationTargetException {
		
		crearArbolModeloCotizador(modeloCotizadorOV);
		this.setModeloCotizadorOV(modeloCotizadorOV);
		
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
		
	}
	
	@Command
	@NotifyChange({"arbolTitulos","tituloModeloCotizadorOV","modeloCotizadorOV"})
	public synchronized void recuperarConcepto(@BindingParam("titulo") NodoTitulos nodo){
		this.nodoActual=nodo;
		this.tituloModeloCotizadorOV=nodo.getData();
	}
	
	@Command
	@NotifyChange({"arbolTitulos","modeloCotizadorOV"})
	public void modificarConcepto() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		openHelper("conceptoPresupuesto", "", this.tituloModeloCotizadorOV.getConcepto(), "traerConceptoPresupuesto", "Conceptos", "Codigo", "Descripcion", false);
		
	}
				
	@Command
	@NotifyChange("arbolTitulos")
	public void eliminarConcepto() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		this.nodoActual.getParent().remove(this.nodoActual);
	}

	@Command
	@NotifyChange({"arbolTitulos","tituloModeloCotizadorOV","modeloCotizadorOV"})
	public void eliminarTitulo() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		
		final TreeNode<TituloModeloCotizadorOV> parent = nodoActual.getParent();
		final NodoTitulos nodoActual = this.nodoActual;
		
		int childCount = nodoActual.getChildCount();
		if (childCount>0) {
			
			Messagebox.show("¿El titulo contiene hijos, desea eliminar el titulo y todos sus hijos?", "Advertencia", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION, new org.zkoss.zk.ui.event.EventListener() {    
				public void onEvent(Event evt) throws InterruptedException, IOException {
					if (evt.getName().equals("onOK")) {
						parent.remove(nodoActual);
					}
				}
			});
		}else{
			parent.remove(nodoActual);
		}
		
	}
	
	@Command
	@NotifyChange({"arbolTitulos","tituloModeloCotizadorOV","modeloCotizadorOV"})
	public void agregarConcepto() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException{
		
		/*
		 * Se agregan los nuevos elementos, y al padre le agrego el creado recientemente
		 */
		TituloModeloCotizadorOV data=TituloModeloCotizadorOV.newConcepto();
		NodoTitulos nodoTitulos = new NodoTitulos(data);
		
		this.nodoActual.add(nodoTitulos);
		
		/*
		 * Actualizar las referencias del item seleccionado, ya que pasa a ser el recien agregado.
		 */
		this.nodoActual=nodoTitulos;
		this.tituloModeloCotizadorOV=this.nodoActual.getData();
		
		/*
		 * Abrir el help para seleccionar el nuevo concepto
		 */
		openHelper("conceptoPresupuesto", "", this.tituloModeloCotizadorOV.getConcepto(), "traerConceptoPresupuesto", "Conceptos", "Codigo", "Descripcion", false);
		
	}
	
	@Command
	@NotifyChange({"arbolTitulos","tituloModeloCotizadorOV","modeloCotizadorOV"})
	public void agregarTitulo() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException{
		
		TituloModeloCotizadorOV data=new TituloModeloCotizadorOV();
		NodoTitulos nodoTitulos = new NodoTitulos(data,true);
		this.nodoActual.add(nodoTitulos);	
		
	}
	
}
