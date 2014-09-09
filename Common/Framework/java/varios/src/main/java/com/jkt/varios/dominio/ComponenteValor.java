package com.jkt.varios.dominio;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.Descriptible;

/**
 * <p>Representa a un valor de un componente.</p>
 * <p>Cada componente puede tener una lista de hijos valores.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ComponenteValor extends Descriptible {

	private static final long serialVersionUID = 7388198401142500855L;

//	@NotNull
	private Componente componente;
	private ComponenteValor componenteValorPadre;
	private List<ComponenteValor> valores = new ArrayList<ComponenteValor>();

	public ComponenteValor getComponenteValorPadre() {
		return componenteValorPadre;
	}

	public void setComponenteValorPadre(ComponenteValor componenteValorPadre) {
		this.componenteValorPadre = componenteValorPadre;
	}

	public List<ComponenteValor> getValores() {
		return valores;
	}

	public void setValores(List<ComponenteValor> valores) {
		this.valores = valores;
	}

	public Componente getComponente() {
		return componente;
	}

	public void setComponente(Componente componente) {
		this.componente = componente;
	}

	/**
	 * Agrega un componente valor a la lista de valores.
	 * FIXME Ser cuidadoso con la entidad del objeto recuperado desde la base de datos. (eq hashcode)
	 * 
	 * @param componenteValor
	 */
	public void agregarValor(ComponenteValor componenteValor) {
		if (!valores.contains(componenteValor)) {
			valores.add(componenteValor);
		}
	}

}
