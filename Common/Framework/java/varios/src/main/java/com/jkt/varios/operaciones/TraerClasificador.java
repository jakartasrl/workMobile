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
 * Esta operacion recupera el clasificador con todos sus componentes, y ademas cada componente con sus hijos.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@OperacionBean
public class TraerClasificador extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		String id=(String) aParams.get("oid".toUpperCase());
		Clasificador clasificador=(Clasificador) this.serviceRepository.getByOid(Clasificador.class, Long.valueOf(id).longValue());
		
		if (clasificador==null) {
			throw new EntityNotFoundException("No existe el clasificador solicitado");
		}
		
		notificarObjecto(Notificacion.getNew("clasificador", clasificador));
		
		Componente componente = clasificador.getComponentePadre();
		int nivel=0;
		while(componente!=null){

//			if (nivel>0) {
//				componente.setNivelSuperior(nivel-1);
//			}
//			
			componente.setNivelSuperior(nivel-1);
			
			
			componente.setNivel(nivel++); //Seteo el valor actual y luego es aumentado.
			
			notificarObjecto(Notificacion.getNew("componentes", componente));
			componente=componente.getComponenteHijo();
		}
		
	}

}
