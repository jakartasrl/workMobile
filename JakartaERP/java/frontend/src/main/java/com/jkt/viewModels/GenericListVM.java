package com.jkt.viewModels;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import lombok.Data;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.bind.annotation.QueryParam;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.LaboratorioOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListLaboratorioOV;


/**
 * ViewModel generico para entidades descriptibles.
 * La idea es que con instanciar un zul, enviando la entidad, sea capaz de instanciar vista, operaciones basicas de traer y guardar, y botoneras.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class GenericListVM extends ViewModel implements IBasicOperations{

	private ListDescriptibleOV entidades;
	
	private String clase;
	private String operacion;
	
	@Init
	public void init(@QueryParam("metadata") String metaData) throws JakartaException{

		String[] split = metaData.split("-");
		if (split.length!=2) {
			throw new JakartaException("Faltan parametros para instanciar la administracion de entidades genericas.");
		}
		
		operacion=split[0];
		clase=split[1];
		
		if (operacion==null || operacion.isEmpty()) {
			throw new JakartaException("Es imposible generar la instancia de administracion generico. Falta el parametro 'operacion'");
		}
		if (clase==null || clase.isEmpty()) {
			throw new JakartaException("Es imposible generar la instancia de administracion generico. Falta el parametro 'clase'");
		}
		
		nuevo();
		
		this.setTitulo(formatearTitulo(clase));
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(getClase());
		this.entidades = (com.jkt.ov.ListDescriptibleOV) Operaciones.ejecutar("Traer", containerOV, com.jkt.ov.ListDescriptibleOV.class);
	}

	/**
	 * Codigo extraido desde la nube
	 */
	private String formatearTitulo(String titulo) {
		String mayuscula=titulo.charAt(0)+"";
		mayuscula=mayuscula.toUpperCase();
		titulo=titulo.replaceFirst (titulo.charAt(0)+"", mayuscula);
		return titulo;
	}
	
	@Override
	@NotifyChange({"entidad"})
	@GlobalCommand("updateAll")
	public void actualizar() {}

	@Override
	protected String retrieveMethod() {
		return "updateAll";
	}

	@Override
	@Command
	@NotifyChange("entidad")
	public void guardar() throws JakartaException {
		
		List list = this.entidades.getList();
		for (Object object : list) {
			Operaciones.ejecutar(operacion, object);
		}
		
	}

	@Override
	@Command
	@NotifyChange("entidad")
	public void nuevo() throws JakartaException {
//		this.entidad=new DescriptibleOV();
	}

	@Command
	@NotifyChange("entidades")
	public void agregarElemento(){
		this.entidades.getList().add(new DescriptibleOV());
	}
	
	@Override
	@Command
	@NotifyChange("entidades")
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(getClase());
		this.entidades = (com.jkt.ov.ListDescriptibleOV) Operaciones.ejecutar("Traer", containerOV, com.jkt.ov.ListDescriptibleOV.class);
	}
	
	@Command
	@NotifyChange("entidades")
	public void eliminar(@BindingParam("elemento") DescriptibleOV elemento){
		this.entidades.getList().remove(elemento);
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		this.nuevo();
	}
	
}