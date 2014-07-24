package com.jkt.dominio.menu;

import org.junit.Test;

public class GenerationMenuTest {

	@Test
	public void creacionDelMenu() {
		
		Menu menu = new Menu();
		
		Programa programa = new Programa();
		Programa programa2 = new Programa();
		
		Script script = new Script();
		Script script2 = new Script();
		
		Menu menu2 = new Menu();
		menu2.addElemento(programa2);
		menu2.addElemento(script);
		menu2.addElemento(script2);
		
		menu.addElemento(programa);
		menu.addElemento(menu2);

		menu.getElementos();
		
	}

}
