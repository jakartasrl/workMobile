package com.jkt.dominio.menu;

/**
 * Un script, a diferencia de un {@link Programa} puede ejecutarse fuera del
 * contexto de la aplicación, es decir, puede ser un script sql, una llamada al
 * sistema del sistema operativo, una aplicacion en formato exe, etc.
 * 
 * @see Programa
 * @author Leonel Suarez - Jakarta SRL
 */
public class Script extends ElementoMenu {

	@Override
	public String getTipoMenu() {
		return "SCRIPT";
	}

}
