package com.jkt.varios.operaciones;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityNotFoundException;

import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.Componente;
import com.jkt.varios.dominio.ComponenteValor;

public class TraerValoresClasificador extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		String id=(String) aParams.get("oid");
		Clasificador clasificador=(Clasificador) this.serviceRepository.getByOid(Clasificador.class, Long.valueOf(id).longValue());
		
		if (clasificador==null) {
			throw new EntityNotFoundException("No existe el clasificador solicitado");
		}
		
		//1 notifico el clasificador
		notificarObjecto(Notificacion.getNew("clasificador", clasificador));
		
		Componente componente = clasificador.getComponentePadre();
		// ComponenteValor valor;
		int nivel=0;
		while(componente!=null){
			
			//2 Notifico el componente
			componente.setNivelSuperior(nivel-1);
			componente.setNivel(nivel++);
			notificarObjecto(Notificacion.getNew("componentes", componente));
			
			//3 notifico el valor del componente
			// valor = componente.getValor();
			List<ComponenteValor> valores = componente.getValores();
			for (ComponenteValor valor : valores) {
				notificarObjecto(Notificacion.getNew("valores", valor));
			}
			
			componente=componente.getComponenteHijo();
		}
	}

}
