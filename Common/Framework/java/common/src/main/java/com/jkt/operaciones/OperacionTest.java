package com.jkt.operaciones;

import java.util.Iterator;
import java.util.Map;

import com.jkt.dominio.Container;
import com.jkt.transformers.Notificacion;

public class OperacionTest extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Iterator<String> it = aParams.keySet().iterator();
		while (it.hasNext()){
			String key = (String) it.next();
			Container obj = (Container) aParams.get(key);
			notificarObjecto(Notificacion.getNew(key, obj));
		}

	}

}
