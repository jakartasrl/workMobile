package com.jkt.viewModels;

import lombok.Data;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.Init;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;

import com.jkt.common.Operaciones;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.MenuOV;

/**
 * Retorna todos los enlaces para generar un menu en la vista
 * 
 * @author ssuarez
 *
 */
@Data
public class MenuVM {
	
    @Command
	public void logOut(){
		Session sess = Sessions.getCurrent();
        sess.removeAttribute("userCredential");
        sess.removeAttribute("ventanas");
        Executions.sendRedirect("/index.zul");
	}
	
	@Init
	public void init(){
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1("menu");
		containerOV.setString2("1");

		MenuOV menu = (MenuOV) Operaciones.ejecutar("RecuperarMenu", containerOV, MenuOV.class);
		menu.getNombre();
	}
	
/*
	
	private List<MenuOV> menues=new ArrayList<MenuOV>();
	
	private List<String> news=new ArrayList<String>();
	private String currentNew;
	private int index = 0;
	
	@Init
	public void init(){
		
		menues.add(MenuOV.newInstance("Laboratorio", "index/index-laboratorio.zul", "small"));
		menues.add(MenuOV.newInstance("Equipo", "index/index-equipo.zul", "small"));
		menues.add(MenuOV.newInstance("Determinacion Electrica", "index/index-determinacion.zul?l=LaboratorioElectrico", "small"));
		menues.add(MenuOV.newInstance("Determinacion Quimica", "index/index-determinacion.zul?l=LaboratorioQuimico", "small"));
		menues.add(MenuOV.newInstance("Sector", "generic/genericList.zul", "small","guardarSector", "sector"));
		menues.add(MenuOV.newInstance("Plantilla", "index/plantilla.zul", "small"));
		menues.add(MenuOV.newInstance("Tarea", "generic/genericList.zul", "small","guardarTareaSimple", "tarea"));
		menues.add(MenuOV.newInstance("Unidad Medida", "generic/genericList.zul", "small","guardarUnidadMedida", "unidadMedida"));
//		menues.add(MenuOV.newInstance("Idioma", "generic/genericList.zul", "small","guardarIdioma", "idioma"));
		menues.add(MenuOV.newInstance("Moneda", "generic/genericList.zul", "small","guardarMoneda", "moneda"));
		menues.add(MenuOV.newInstance("Pais", "generic/genericList.zul", "small","guardarPais", "pais"));
		menues.add(MenuOV.newInstance("Documentación", "generic/genericList.zul", "small","guardarDocumentacion", "documentacion"));
		menues.add(MenuOV.newInstance("Cotizacion", "index/index-cotizacion.zul", "small"));
		menues.add(MenuOV.newInstance("Modelo Cotizador", "index/index-modeloCotizador.zul", "small"));
		menues.add(MenuOV.newInstance("Cotizador", "index/index-Cotizador.zul", "small"));
		menues.add(MenuOV.newInstance("Presupuesto", "index/index-presupuesto.zul", "small"));
		menues.add(MenuOV.newInstance("Pedido", "index/index-pedido.zul", "small"));
		menues.add(MenuOV.newInstance("Planificación de Pedido", "index/index-agenda.zul", "small"));
		menues.add(MenuOV.newInstance("Visor de Tareas por Sector", "index/index-vista-agenda-sector.zul", "small"));
		menues.add(MenuOV.newInstance("Visor de Tareas por Pedido", "index/index-vista-agenda-pedido.zul", "small"));
		menues.add(MenuOV.newInstance("Conceptos Presupuestarios", "index/index-conceptos.zul", "small"));
//		menues.add(MenuOV.newInstance("Visor de Planificación", "index/visor-agenda.zul", "small"));

		
//		news.add("Miercoles 15 de Abril- River Plata gana 4-0 y logra acceder a octavos.");
//		news.add("Jueves 16 de Abril- Argentina está de fiesta");
//		news.add("Viernes 17 de Abril- Aique");
			
		news.add("Reactores - Serie o limitadores de corriente de cortocircuido. Paralelo, derivación o Shunt.");
		news.add("Transformadores - Potencia - Distribución - Especiales ");
		news.add("El Mural mas grande del mundo.");
		news.add("Los Conce. Tel.:(+54 11)46932220");
		
//		news.add("Miercoles 6 de Mayo, o Jueves 7 - River Plate gana 3-0.");
//		news.add("Miercoles 13 de Mayo, o Jueves 14 - River Plate gana 1-0. Logra pasar a Cuartos de final de la copa B. Libertadores.");
//		news.add("Jueves 14, o Viernes 15 de Mayo- Argentina está de fiesta.");
//		news.add("Sabado siguiente - Vamos Millonario!!.");

//		news.add("18 de Abril - Daniel Shapochnik");
//		news.add("13 de Mayo - Peñalva");
//		news.add("17 de Mayo - Eliana");
//		news.add("20 de Junio - Leo");
//		news.add("30 de Junio - Marcos");
//		news.add("30 de Octubre - Ema");
		
		currentNew=news.get(index);
	}
	
	@Command
	@NotifyChange("currentNew")
	public void next(){
		index++;
		if (index==news.size()) {
			index=0;
		}
		currentNew=news.get(index);
	}
	
	
	*/
}
