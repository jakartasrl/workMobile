package com.jkt.erp.impuestos.dominio;

import java.util.Arrays;
import java.util.List;

public class SUSS extends Impuesto {

	@Override
	public List getCategorias() {
		return Arrays.asList(new Object[]{"a","b"});
	}

}
