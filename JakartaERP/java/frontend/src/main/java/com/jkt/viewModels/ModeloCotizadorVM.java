package com.jkt.viewModels;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import lombok.Data;

import org.apache.velocity.runtime.directive.Foreach;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlBasedComponent;
import org.zkoss.zk.ui.event.DropEvent;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;
import org.zkoss.zul.DefaultTreeModel;
import org.zkoss.zul.DefaultTreeNode;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Tree;
import org.zkoss.zul.TreeModel;
import org.zkoss.zul.TreeNode;
import org.zkoss.zul.Treecell;
import org.zkoss.zul.Treechildren;
import org.zkoss.zul.Treeitem;

import com.jkt.arbol.clasificador.ComponenteNodo;
import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ModeloCotizadorOV;
import com.jkt.ov.TituloModeloCotizadorOV;
import com.jkt.ov.tree.AdvancedTreeModel;
import com.jkt.ov.tree.NodoTitulos;

@Data
public class ModeloCotizadorVM extends ViewModel implements IBasicOperations {
		
	private String titulo = "Modelos de Cotizador";
	private ModeloCotizadorOV modeloCotizadorOV = new ModeloCotizadorOV();
	private AdvancedTreeModel arbolTitulos;
	
	//Elementos recuperados del click
	private NodoTitulos nodoActual;
	private TituloModeloCotizadorOV tituloModeloCotizadorOV = new TituloModeloCotizadorOV();

	
	
	/**
	 * Variable para cortar y pegar elementos
	 */
	private List<NodoTitulos> titulosCortados = new ArrayList<NodoTitulos>();
	private String codigosTitulosCortados;
	
	
	/**
	 * Corta todos los elementos hijos marcados con el check.
	 */
	@Command
	@NotifyChange({"arbolTitulos","titulosCortados","codigosTitulosCortados"})
	public void cortar(){
		
		this.titulosCortados = new ArrayList<NodoTitulos>();
		
		List<TreeNode<TituloModeloCotizadorOV>> hijos = this.nodoActual.getChildren();
		for (TreeNode<TituloModeloCotizadorOV> treeNode : hijos) {
			if(treeNode.getData().getForCut()){
				titulosCortados.add((NodoTitulos) treeNode);
			}
		}

		codigosTitulosCortados = "Titulos Cortados : ";
		for (NodoTitulos nodoTitulos : titulosCortados) {
			 this.nodoActual.remove(nodoTitulos);
			 codigosTitulosCortados+=nodoTitulos.getData().getCodigoC()+" | ";
		}
		
	}
	
	/**
	 * Usa la variable {@link #titulosCortados} y {@link #nodoActual} para pegar
	 */
	@Command
	@NotifyChange({"arbolTitulos","titulosCortados"})
	public void pegar(){

		for (NodoTitulos nodoTitulos : titulosCortados) {
			this.nodoActual.add(nodoTitulos);
			nodoTitulos.getData().setForCut(Boolean.FALSE);
		}
		
		this.titulosCortados = new ArrayList<NodoTitulos>();
		
	}
	
	
	
	
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
		
		this.completarCotizacionOV();
		
		Operaciones.ejecutar("GuardarModeloCotizador", this.modeloCotizadorOV );
//		Messagebox.show("Modelo de Cotizador Guardado Correctamente.");
		
		Executions.sendRedirect("/pantallas/index/index-modeloCotizador.zul");		
	}

	/*
	 * Esta lista es una lista transiente que contiene toda la informacion de la jerarquia usando codigoInterno y codigoPadre.
	 * Posteriormente una operacion recupera la lista y arma el arbol como corresponde.
	 */
	private List<TituloModeloCotizadorOV> todosLosElementos= new ArrayList<TituloModeloCotizadorOV>();
	Random rand = new Random();
	
	private void completarCotizacionOV() {
		DefaultTreeModel<TituloModeloCotizadorOV> arbol = this.arbolTitulos;
		this.todosLosElementos = new ArrayList<TituloModeloCotizadorOV>();
		
		//del arbol completo se genera una lista.
		List<TreeNode<TituloModeloCotizadorOV>> rootElements = arbol.getRoot().getChildren();
		for (TreeNode<TituloModeloCotizadorOV> treeNode : rootElements) {
			establecerCodigos(treeNode, 0);
		}

		//y se asigna al modelo cotizador q se va a guardar
		this.modeloCotizadorOV.setTitulos(this.todosLosElementos);
		
	}

	private void establecerCodigos(TreeNode<TituloModeloCotizadorOV> treeNode, int codigoPadre){
		int randomNum = rand.nextInt((999999 - 1) + 1) + 1;
		treeNode.getData().setCodigoInterno(randomNum);
		treeNode.getData().setCodigoInternoPadre(codigoPadre);
		
		
		if(treeNode.getData().getTipo().equals("C")){
			treeNode.getData().setIdC(treeNode.getData().getConcepto().getId());
			treeNode.getData().setConcepto(null);//para q el fwk no vaya a buscarlo a la base y le asigne null...
			//recordar, si elp valor es cero, se crea uno nuevo, si es >0 se busca en la base, si es null, se retorna null.
		}else{
			treeNode.getData().setIdC(null);
		}
				
		if (!treeNode.isLeaf()) {
			List<TreeNode<TituloModeloCotizadorOV>> children = treeNode.getChildren();
			for (TreeNode<TituloModeloCotizadorOV> nodoHijo : children) {
				establecerCodigos(nodoHijo, randomNum);
			}
		}
		todosLosElementos.add(treeNode.getData());
		
	}
	

	@Override
	@Command
	@NotifyChange({"modeloCotizadorOV","tituloModeloCotizadorOV","arbolTitulos"})
	public void nuevo() throws JakartaException {	
		
		nodoActual = null;
		tituloModeloCotizadorOV = new TituloModeloCotizadorOV();
		this.modeloCotizadorOV = new ModeloCotizadorOV();
		this.tituloModeloCotizadorOV = new TituloModeloCotizadorOV();
		todosLosElementos= new ArrayList<TituloModeloCotizadorOV>();

		NodoTitulos root = new NodoTitulos(new TituloModeloCotizadorOV(),true);
		this.arbolTitulos=new AdvancedTreeModel(root);// DefaultTreeModel<TituloModeloCotizadorOV>(root);
		
		TituloModeloCotizadorOV data = new TituloModeloCotizadorOV();
		data.setTipo("T");
		data.setCodigo("----");
		data.setDescripcion("----");

		nodoActual = new NodoTitulos(data,true);
		root.add(nodoActual);
		
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
		this.modeloCotizadorOV=modeloCotizadorOV;
		
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
		
		this.arbolTitulos=new AdvancedTreeModel(root);//<TituloModeloCotizadorOV>(root);

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
	@NotifyChange({"arbolTitulos","todosLosElementos","modeloCotizadorOV"})
	public void eliminarConcepto() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		this.nodoActual.getParent().remove(this.nodoActual);	
	}

	@Command
	@NotifyChange({"arbolTitulos","tituloModeloCotizadorOV","modeloCotizadorOV"})
	public void eliminarTitulo() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		
		if (nodoActual.getParent().getChildren().size()==1) {
			TreeNode<TituloModeloCotizadorOV> root = this.arbolTitulos.getRoot();
			TreeNode<TituloModeloCotizadorOV> primerHijo = root.getChildAt(0);
			if (primerHijo==nodoActual) {
				Messagebox.show("No se puede eliminar el titulo ya que debe si o si contener al menos uno.");
				return;
			}
		}
		
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
		
		this.setArbolTitulos(arbolTitulos);
		
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
		TituloModeloCotizadorOV data=TituloModeloCotizadorOV.newTitulo();
		NodoTitulos nodoTitulos = new NodoTitulos(data,true);
		this.nodoActual.add(nodoTitulos);	
		
	}
	@Command
	@NotifyChange({"arbolTitulos","tituloModeloCotizadorOV","modeloCotizadorOV"})
	public void agregarTituloAlMismoNivel() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException{
		TituloModeloCotizadorOV data=TituloModeloCotizadorOV.newTitulo();
		NodoTitulos nodoTitulos = new NodoTitulos(data,true);
		this.nodoActual.getParent().add(nodoTitulos);	
		
	}

	
	@Command
	public void setear(@BindingParam("componente") final Component componente, @BindingParam("nodo") NodoTitulos nodo){
		nodo.setComponenteAsociado(componente);
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		this.nuevo();
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}
	
}
