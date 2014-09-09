package com.jkt.varios.operaciones;

import java.util.Map;

import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.Componente;
import com.jkt.varios.dominio.ComponenteValor;

public class GuardarValoresClasificador extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		Clasificador clasificador = new Clasificador();
		clasificador.setCodigo("AAC");
		clasificador.setDescripcion("descripcion");

		Componente componente = new Componente();
		componente.setCodigo("ka1");
		componente.setDescripcion("componente1");
		
		Componente componente2 = new Componente();
		componente2.setCodigo("ka");
		componente2.setDescripcion("componente2");

		clasificador.setComponentePadre(componente);
		
		componente.setComponenteHijo(componente2);
		componente2.setComponentePadre(componente);

		ComponenteValor componenteValor = new ComponenteValor();
		componenteValor.setCodigo("compval");
		componenteValor.setDescripcion("componentevalor 1");

		ComponenteValor componenteValor2 = new ComponenteValor();
		componenteValor2.setCodigo("comp2val");
		componenteValor2.setDescripcion("componente valor 2");

		ComponenteValor componenteValor3 = new ComponenteValor();
		componenteValor3.setCodigo("comp3val");
		componenteValor3.setDescripcion("caomponente valor 3");
		
		ComponenteValor componenteValor4 = new ComponenteValor();
		componenteValor4.setCodigo("comp4val");
		componenteValor4.setDescripcion("componente valor 4");
		
		componente2.agregarValor(componenteValor2);
		componente2.agregarValor(componenteValor);
		
		componenteValor2.agregarValor(componenteValor4);
		componenteValor2.agregarValor(componenteValor3);

		serviceRepository.save(clasificador);
		
		
//		componente2.agregarValor(componenteValor2);
//		serviceRepository.save(clasificador);
		
		
	}

}
