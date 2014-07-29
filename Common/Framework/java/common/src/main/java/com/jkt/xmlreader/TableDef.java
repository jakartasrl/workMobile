package com.jkt.xmlreader;

import java.util.Collection;

public class TableDef extends XMLEntity {
	
	public Collection getCampos(){
		return this.getHijos();
	}

}
