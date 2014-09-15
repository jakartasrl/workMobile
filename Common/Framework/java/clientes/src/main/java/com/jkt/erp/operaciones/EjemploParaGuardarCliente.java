package com.jkt.erp.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.erp.impuestos.dominio.SujetoImpositivo;
import com.jkt.erp.varios.Cliente;
import com.jkt.erp.varios.ClienteSucursal;
import com.jkt.erp.varios.DomicilioEntrega;
import com.jkt.erp.varios.Vendedor;
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
		
		Vendedor vendedor = new Vendedor();
		vendedor.setApellido("apellido");
		vendedor.setNombres("nombres");
		vendedor.setCodigo("codigo");
		vendedor.setMail("mail@gmail.com");
		guardar(vendedor);
		
		Direccion direccion = new Direccion();
		direccion.setNombre("a");
		direccion.setDireccion("asd");
		direccion.setCodigoPostal("18898");
		direccion.setLocalidad("asd");
		direccion.setPais(pais);
		direccion.setProvincia(provincia);
//		guardar(direccion);
		//guardo direccion NO HACE FALTA GUARDAR ESTA DIRECCION, SE GUARDA CON LA CASCADA
		
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
		
		leonelCliente.addClienteSucursal(crearSucursal(leonelCliente));
		
		guardar(leonelCliente);
		//guardo cliente
		
	}
	
	private DomicilioEntrega crearDomicilio(ClienteSucursal cliente) throws Exception{
		
		DomicilioEntrega d1 = new DomicilioEntrega();
		d1.setClienteSucursal(cliente);
		d1.setNumero(1);
		d1.setDiasEntrega("lav");
		d1.setDescripcion("Descripcion del domicilio de entrega");
		
			Direccion dire1 = new Direccion();
			dire1.setNombre("dire1");
			dire1.setDireccion("direcccion1");
			dire1.setPais((Pais) obtener(Pais.class, 1L));
			dire1.setProvincia((Provincia) obtener(Provincia.class, 1L));
			dire1.setLocalidad("localidad");
			dire1.setCodigoPostal("1888");
		
		d1.setDireccion(dire1);
		
		return d1;
		
	}
	
	private ClienteSucursal crearSucursal(Cliente c) throws Exception{
		ClienteSucursal cs = new ClienteSucursal();
		
		cs.setCliente(c);
		c.addClienteSucursal(cs);
		
		cs.setNumero(1);
		cs.setDescripcion("Desc cliente surcursal");

		cs.addDomicilioEntrega(crearDomicilio(cs));
		
		Direccion dire1 = new Direccion();
		dire1.setNombre("dire1");
		dire1.setDireccion("direcccion1");
		dire1.setPais((Pais) obtener(Pais.class, 1L));
		dire1.setProvincia((Provincia) obtener(Provincia.class, 1L));
		dire1.setLocalidad("localidad");
		dire1.setCodigoPostal("1888");
		
		cs.setDireccion(dire1);
		
		cs.setVendedorComercial((Vendedor) obtener(Vendedor.class, 1L));
		
		return cs;
	}

}
