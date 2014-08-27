package com.jkt.varios.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.PersistentEntity;
import com.jkt.operaciones.Operation;
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
		
		List<PersistentEntity> all = this.serviceRepository.getAll(Clasificador.class);
	
		Clasificador c;
		for (PersistentEntity persistentEntity : all) {
			c=(Clasificador) persistentEntity;
			Componente componentePadre = c.getComponentePadre();
			Componente componenteHijo = componentePadre.getComponenteHijo();
			long id = componenteHijo.getId();
		}
		
		
		Componente componenteHijo=new Componente();
		componenteHijo.setCodigo("rrr");
		Componente componenteHijo2=new Componente();
		componenteHijo2.setCodigo("zzz");
		
		Componente componentePadre=new Componente();
		componentePadre.setCodigo("aaa");
		
		Clasificador clasificador = new Clasificador();
		clasificador.setCodigo("asd");
		
		componentePadre.setClasificador(clasificador);
		
		componentePadre.setComponenteHijo(componenteHijo);
		componenteHijo.setComponentePadre(componentePadre);
		
		componenteHijo.setComponenteHijo(componenteHijo2);
		componenteHijo2.setComponentePadre(componenteHijo);
		
		clasificador.setComponentePadre(componentePadre);
		
		

		this.serviceRepository.save(clasificador);
		
		
		
	}

}
