package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.util.Clients;

import com.jkt.excepcion.JakartaException;
import com.jkt.ov.DescriptibleOV;

@Data
public class ConsultaStockVM extends ViewModel {

	private String filtroCodigo;
	private String filtroDescripcion;
	
	private List<DescriptibleOV> productos = new ArrayList<DescriptibleOV>();
	private List<DescriptibleOV> tiposDeProducto = new ArrayList<DescriptibleOV>();
	
	private void mostrarMensajeInfo(String msg){
		mostrarMensaje(msg,"info");
	}
	
	private void mostrarMensajeError(String msg){
		mostrarMensaje(msg,"error");
	}
	
	private void mostrarMensaje(String msg, String tipo){
		Clients.showNotification(msg, tipo, null, "center", 1000);
	}
	
	@Init
	public void init(){
//		mostrarMensajeInfo("Bienvenido a Spirax Sarco");
		
		DescriptibleOV tipo1 = new DescriptibleOV();
		tipo1.setCodigo("T1");
		tipo1.setDescripcion("Transformador");

		DescriptibleOV tipo2 = new DescriptibleOV();
		tipo2.setCodigo("T2");
		tipo2.setDescripcion("Bobina");
		
		DescriptibleOV tipo3 = new DescriptibleOV();
		tipo3.setCodigo("T3");
		tipo3.setDescripcion("Vidrio");
		
		tiposDeProducto.add(tipo1);
		tiposDeProducto.add(tipo2);
		tiposDeProducto.add(tipo3);
	}
	
	@Override
	@GlobalCommand("actualizacionGrilla")
	@NotifyChange("productos")
	public void actualizar() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException {}

	@Override
	public void cancelarCustomizado() throws JakartaException {

	}

	@Override
	protected String retrieveMethod() {
		return "actualizacionGrilla";
	}
	
	@Command
	@NotifyChange("productos")
	public void filtrar(){
		
		this.productos=new ArrayList<DescriptibleOV>();
		
		DescriptibleOV d1=new DescriptibleOV();
		d1.setCodigo("POT");
		d1.setDescripcion("Articulo Pot xrejq1");
		d1.setCampoAdicional1("470");
		d1.setCampoAdicional2("No Disponible");
		
		DescriptibleOV d2=new DescriptibleOV();
		d2.setCodigo("TRANF");
		d2.setDescripcion("Transformador de potencia xxro33");
		d2.setCampoAdicional1("41");
		d2.setCampoAdicional2("Disponible");
		
		DescriptibleOV d3=new DescriptibleOV();
		d3.setCodigo("Bob");
		d3.setDescripcion("Bobina");
		d3.setCampoAdicional1("567");
		d3.setCampoAdicional2("Disponible a partir de 4/6/2016");
		
		DescriptibleOV d4=new DescriptibleOV();
		d4.setCodigo("TRRT");
		d4.setDescripcion("Super transformador");
		d4.setCampoAdicional1("1");
		d4.setCampoAdicional2("Disponible");
		
		productos.add(d2);
		productos.add(d3);
		productos.add(d4);
		productos.add(d1);
		
	}

	@Command
	public void limpiar(){
		redirectToMyself();
	}
	
}
