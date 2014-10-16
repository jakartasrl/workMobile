package com.jkt.operaciones;

import java.util.Iterator;
import java.util.Map;

import com.jkt.dominio.Container;

/**
 * <code>Comentario agregado por Leo.</code>
 * <p>Esta clase sirve para ejecutar en modo de test a las operaciones.</p>
 * 
 * 
 * @author Daniel Jakarta SRL
 */
public class OperacionTest extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Iterator<String> it = aParams.keySet().iterator();
		while (it.hasNext()){
			String key = (String) it.next();
			Container obj = (Container) aParams.get(key);
			notificarObjeto(key, obj);
		}

	}

}
