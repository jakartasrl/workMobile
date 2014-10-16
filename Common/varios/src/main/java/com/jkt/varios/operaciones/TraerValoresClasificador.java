package com.jkt.varios.operaciones;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityNotFoundException;

import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.Componente;
import com.jkt.varios.dominio.ComponenteValor;

public class TraerValoresClasificador extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		String id=(String) aParams.get("oid".toUpperCase());
		Clasificador clasificador=(Clasificador) obtener(Clasificador.class, id);
		
		if (clasificador==null) {
			throw new EntityNotFoundException("No existe el clasificador solicitado");
		}
		
		//1 notifico el clasificador
		notificarObjeto("clasificador", clasificador);
		
		Componente componente = clasificador.getComponentePadre();
		ComponenteValor componenteValorPadre;
		// ComponenteValor valor;
		int nivel=1;
		int nivelValores=1;
		while(componente!=null){
			
			//2 Notifico el componente
			componente.setCodigoInternoPadre(nivel-1);
			componente.setCodigoInterno(nivel++); //Seteo el valor actual y luego es aumentado.
			
			notificarObjeto("componentes", componente);
			
			//3 notifico el valor del componente
			// valor = componente.getValor();
			int valorInternoPadre;
			List<ComponenteValor> valores = componente.getValores();
			for (ComponenteValor valor : valores) {
				
				//TODO FIXME ver xq llega un valor en null!!
				if (valor==null) {
					continue;
				}
				
				valor.setCodigoInterno(Long.valueOf(valor.getId()).intValue());
				
				componenteValorPadre=valor.getComponenteValorPadre();
				if (componenteValorPadre==null) {
					valorInternoPadre=0;
				}else{
					valorInternoPadre=(int)componenteValorPadre.getId();
				}
				
				valor.setCodigoInternoPadre(valorInternoPadre);
				notificarObjeto("valores", valor);
			}
			
			componente=componente.getComponenteHijo();
		}
	}

}
