package com.jkt.erp.operaciones;

import java.util.Map;

import com.jkt.erp.impuestos.dominio.SujetoImpositivo;
import com.jkt.erp.varios.Cliente;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Direccion;
import com.jkt.varios.dominio.Idioma;
import com.jkt.varios.dominio.Pais;
import com.jkt.varios.dominio.Provincia;

public class EjemploParaGuardarCliente extends Operation{

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Idioma idioma = new Idioma();
		idioma.setDescripcion("Descripcion Idioma");
		idioma.setCodigo("Cod Idioma");
		
		//guardo idioma
		guardar(idioma);
		
		Pais pais=new Pais();
		pais.setCodigo("cod");
		pais.setDescripcion("desc");
		guardar(pais);
		//guardo pais
		
		
		Provincia provincia = new Provincia();
		provincia.setCodigo("cod");
		provincia.setDescripcion("desc");
		guardar(provincia);
		//guardo provincia
		
		Direccion direccion = new Direccion();
		direccion.setNombre("a");
		direccion.setDireccion("asd");
		direccion.setCodigoPostal("18898");
		direccion.setLocalidad("asd");
		direccion.setPais(pais);
		direccion.setProvincia(provincia);
		guardar(direccion);
		//guardo direccion
		
		SujetoImpositivo sujetoImpositivo = new SujetoImpositivo();
		sujetoImpositivo.setDireccionLegal(direccion);
		sujetoImpositivo.setRazonSocial("razon social");
		guardar(sujetoImpositivo);
		//guardo sujeto impositivo
		
		Cliente leonelCliente = new Cliente();
		leonelCliente.setCodigo("cod");
		leonelCliente.setDescripcion("descripcion");
		leonelCliente.setIdioma(idioma);		
		leonelCliente.setSujetoImpositivo(sujetoImpositivo);
		guardar(leonelCliente);
		//guardo cliente
		
	}

}
