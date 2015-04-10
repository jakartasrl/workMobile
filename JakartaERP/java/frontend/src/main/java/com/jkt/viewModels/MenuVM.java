package com.jkt.viewModels;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;

import com.jkt.ov.MenuOV;

/**
 * Retorna todos los enlaces para generar un menu en la vista
 * 
 * @author ssuarez
 *
 */
@Data
public class MenuVM {

	private List<MenuOV> menues=new ArrayList<MenuOV>();
	
	private List<String> news=new ArrayList<String>();
	private String currentNew;
	private int index = 0;
	
	@Init
	public void init(){
		
		for (int i = 0; i < 14; i++) {
			menues.add(MenuOV.newInstance("Laboratorio", "index-laboratorio.zul", "big"));
			menues.add(MenuOV.newInstance("Pedido", "index-pedido.zul", "big"));
			menues.add(MenuOV.newInstance("Equipo", "index-equipo.zul", "small"));
			menues.add(MenuOV.newInstance("Determinacion", "index-determinacion.zul", "medium"));
			menues.add(MenuOV.newInstance("Laboratorio", "index-laboratorio.zul", "big"));
			menues.add(MenuOV.newInstance("Pedido", "index-pedido.zul", "big"));
			menues.add(MenuOV.newInstance("Equipo", "index-equipo.zul", "medium"));
			menues.add(MenuOV.newInstance("Determinacion", "index-determinacion.zul", "big"));
			menues.add(MenuOV.newInstance("Laboratorio", "index-laboratorio.zul", "big"));
			menues.add(MenuOV.newInstance("Pedido", "index-pedido.zul", "big"));
			menues.add(MenuOV.newInstance("Equipo", "index-equipo.zul", "small"));
			menues.add(MenuOV.newInstance("Determinacion", "index-determinacion.zul", "big"));
			menues.add(MenuOV.newInstance("Laboratorio", "index-laboratorio.zul", "big"));
			menues.add(MenuOV.newInstance("Pedido", "index-pedido.zul", "big"));
			menues.add(MenuOV.newInstance("Equipo", "index-equipo.zul", "small"));
			menues.add(MenuOV.newInstance("Determinacion", "index-determinacion.zul", "big"));
			menues.add(MenuOV.newInstance("Laboratorio", "index-laboratorio.zul", "medium"));
			menues.add(MenuOV.newInstance("Pedido", "index-pedido.zul", "big"));
			menues.add(MenuOV.newInstance("Equipo", "index-equipo.zul", "small"));
			menues.add(MenuOV.newInstance("Determinacion", "index-determinacion.zul", "big"));

		}
		
//		news.add("Miercoles 15 de Abril- River Plata gana 4-0 y logra acceder a octavos.");
//		news.add("Jueves 16 de Abril- Argentina está de fiesta");
//		news.add("Viernes 17 de Abril- Aique");
		news.add("18 de Abril - Daniel Shapochnik");
		news.add("13 de Mayo - Peñalva");
		news.add("17 de Mayo - Eliana");
		news.add("20 de Junio - Leo");
		news.add("30 de Junio - Marcos");
		news.add("30 de Octubre - Ema");
		
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
	
}
