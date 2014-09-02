package com.jkt.erp.impuestos.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.impuestos.dominio.CategoriaIIBB;
import com.jkt.erp.impuestos.dominio.CategoriaImpuesto;
import com.jkt.erp.impuestos.dominio.CategoriaIva;
import com.jkt.erp.impuestos.dominio.FactoryImpuestos;
import com.jkt.erp.impuestos.dominio.Impuesto;
import com.jkt.erp.impuestos.dominio.ImpuestoDTO;
import com.jkt.erp.impuestos.dominio.IngresosBrutos;
import com.jkt.erp.impuestos.dominio.Iva;
import com.jkt.operaciones.Operation;

/**
 * Guarda un impuesto, que tendra un comportamiento y una lista de categorias, donde cada elemento de esta lista es unico para el impuesto.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@OperacionBean
public class GuardarImpuesto extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		Impuesto imp = (Impuesto) aParams.get("objeto");
		Impuesto byOid = null;
		if ("IVA".equals(imp.getComportamiento())) {
			if (imp.getId()>0) {
				byOid = (Iva) serviceRepository.getByOid(Iva.class, imp.getId());
			}else{
				byOid  = new Iva();
				byOid .setActivo(imp.isActivo());
				byOid .setDescripcion(imp.getDescripcion());
//				byOid .setCategorias(imp.getCategorias());
				byOid .setCodigo(imp.getCodigo());
				
				List<CategoriaImpuesto> categorias = imp.getCategorias();	
				CategoriaIva catIva;
				for (CategoriaImpuesto categoriaImpuesto : categorias) {
//					catIva=(CategoriaIva) categoriaImpuesto;
					byOid.agregarCategoria(categoriaImpuesto);
				}
			}
				
		}
		
		
//		Impuesto resolverImpuesto = FactoryImpuestos.resolverImpuesto(imp);
//		resolverImpuesto.getCategorias();
		serviceRepository.save(byOid);

		
		
		List<PersistentEntity> allIIBB = serviceRepository.getAll(IngresosBrutos.class);
		List<PersistentEntity> allIva = serviceRepository.getAll(Iva.class);
		
		System.out.println();
		
	}

}
