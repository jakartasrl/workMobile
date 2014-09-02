package com.jkt.erp.impuestos.operaciones;

import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.erp.impuestos.dominio.CategoriaIIBB;
import com.jkt.erp.impuestos.dominio.CategoriaIva;
import com.jkt.erp.impuestos.dominio.IngresosBrutos;
import com.jkt.erp.impuestos.dominio.Iva;
import com.jkt.operaciones.Operation;

@OperacionBean
public class GuardarImpuesto extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		//iva
		Iva iva = new Iva();
		iva.setCodigo("Impuesto");
		iva.setDescripcion("Daleeee");

		CategoriaIva categoriaIva = new CategoriaIva();
		categoriaIva.setCodigo("codiva");
		categoriaIva.setDescripcion("desc iva");
		iva.agregarCategoria(categoriaIva);
		serviceRepository.save(iva);
		
		
		IngresosBrutos IIBB=new IngresosBrutos();
		IIBB.setCodigo("CODIGO");
		IIBB.setDescripcion("DESCRIPCION");

		CategoriaIIBB catIIBB = new CategoriaIIBB();
		catIIBB.setCodigo("codiva");
		catIIBB.setDescripcion("desc iva");
		IIBB.agregarCategoria(catIIBB);
		
		serviceRepository.save(IIBB);
	}

}
