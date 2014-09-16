package com.jkt.varios.operaciones;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityNotFoundException;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.PersistentEntity;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.Componente;

/**
 * <p>Esta operacion recupera el clasificador con todos sus componentes, y ademas cada componente con sus hijos.
 * </p>
 * @author Leonel Suarez - Jakarta SRL
 */
@OperacionBean
public class TraerClasificador extends Operation {

	private static final String OID_FIELD = "oid".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		String id=(String) aParams.get(OID_FIELD);
		Clasificador clasificador=(Clasificador) obtener(Clasificador.class, id);
		
		if (clasificador==null) {
			throw new EntityNotFoundException("No existe el clasificador solicitado");
		}
		
		notificarObjecto(Notificacion.getNew("clasificador", clasificador));
		
		Componente componente = clasificador.getComponentePadre();
		int nivel=1;
		while(componente!=null){
			componente.setCodigoInternoPadre(nivel-1);
			componente.setCodigoInterno(nivel++); //Seteo el valor actual y luego es aumentado.
			
			notificarObjecto(Notificacion.getNew("componentes", componente));
			componente=componente.getComponenteHijo();
		}
		
	}

}
