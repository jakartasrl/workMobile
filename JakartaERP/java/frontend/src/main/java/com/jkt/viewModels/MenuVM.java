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
		
//		for (int i = 0; i < 14; i++) {
			
			menues.add(MenuOV.newInstance("Laboratorio", "index-laboratorio.zul", "small"));
			menues.add(MenuOV.newInstance("Equipo", "index-equipo.zul", "small"));
			menues.add(MenuOV.newInstance("Determinacion", "index-determinacion.zul", "small"));

			menues.add(MenuOV.newInstance("Pedido", "index-pedido.zul", "small"));
			menues.add(MenuOV.newInstance("Presupuesto", "index-presupuesto.zul", "small"));

//		}
		
//		news.add("Miercoles 15 de Abril- River Plata gana 4-0 y logra acceder a octavos.");
//		news.add("Jueves 16 de Abril- Argentina está de fiesta");
//		news.add("Viernes 17 de Abril- Aique");
			
		news.add("Reactores - Serie o limitadores de corriente de cortocircuido. Paralelo, derivación o Shunt.");
		news.add("Transformadores - Potencia - Distribución - Especiales ");
		news.add("El Mural mas grande del mundo.");
		news.add("Los Conce. Tel.:(+54 11)46932220");
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
	
}
