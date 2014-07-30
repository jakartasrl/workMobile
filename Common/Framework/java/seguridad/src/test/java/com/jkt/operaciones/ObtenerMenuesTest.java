package com.jkt.operaciones;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

public class ObtenerMenuesTest {

	private CrearMenues op=new CrearMenues();
	
	@Test
	public void execute() throws Exception{
		Map<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("codigoMenu", new String("001"));
			hashMap.put("fileName", new String("menu1.xml"));
		op.execute(hashMap);
	}
	
}
