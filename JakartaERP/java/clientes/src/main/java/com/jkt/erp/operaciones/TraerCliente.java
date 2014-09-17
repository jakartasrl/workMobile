package com.jkt.erp.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.erp.impuestos.dominio.InscripcionImpositiva;
import com.jkt.erp.impuestos.dominio.SujetoImpositivo;
import com.jkt.erp.varios.Cliente;
import com.jkt.erp.varios.ClienteClasificador;
import com.jkt.erp.varios.ClienteSucursal;
import com.jkt.erp.varios.ClienteSucursalClasificador;
import com.jkt.erp.varios.Contacto;
import com.jkt.erp.varios.DomicilioEntrega;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;
import com.jkt.varios.dominio.Direccion;

/**
 * <p>Operación que recupera un cliente, y todo su contexto de datos, es decir, se recupera un cliente con
 * el {@link SujetoImpositivo}, {@link InscripcionImpositiva}, {@link Direccion}, {@link ClienteSucursal}, 
 * {@link DomicilioEntrega}, etc...</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerCliente extends Operation {

	private static final String IDENTIFICADOR = "oid".toUpperCase();

	private static final String WRITER_CLIENTE = "cliente";
	private static final String WRITER_SUJ_IMP = "sujetoImpositivo";
	private static final String WRITER_INSCRIPCIONES = "inscripciones";
	private static final String WRITER_CLASIFICADORES_CLIENTES = "clasificadoresCliente";
	private static final String WRITER_SUCURSALES_CLIENTE = "sucursalesCliente";
	private static final String WRITER_DOMICILIOS_ENTREGA = "domiciliosEntrega";
	private static final String WRITER_CONTACTOS = "contactos";
	private static final String WRITER_CLASIFICADORES_SUCURSAL = "clasificadoresSucursales";



	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Cliente cliente = (Cliente) obtener(Cliente.class, (String) aParams.get(IDENTIFICADOR));
		mostrarCliente(cliente);
		mostrarClasificadores(cliente);
		mostrarInscripciones(cliente);
		mostrarSucursales(cliente);
		
	}
	
	
	/**
	 * <p>Muestra un simple cliente en la salida de la operacion.</p>
	 * <p>Ademas de mostrar datos de clientes, muestra datos del sujeto impositivo</p>
	 */
	private void mostrarCliente(Cliente cliente) {
		notificarObjecto(Notificacion.getNew(WRITER_CLIENTE, cliente));
		notificarObjecto(Notificacion.getNew(WRITER_SUJ_IMP, cliente.getSujetoImpositivo()));
	}

	/**
	 * Muestra las sucursales y sus relaciones en la salida de la operacion.
	 */
	private void mostrarSucursales(Cliente cliente) {
		List<ClienteSucursal> sucursales = cliente.getListaSucursales();
		
		for (ClienteSucursal clienteSucursal : sucursales) {

			mostrarSucursal(clienteSucursal);
			mostrarDomicilios(clienteSucursal);
			mostrarContactos(clienteSucursal);
			mostrarClasificadoresSucursal(clienteSucursal);
			
		}
	}
	
	/**
	 * Muestra una simple sucursal del cliente en la salida de la operacion.
	 */
	private void mostrarSucursal(ClienteSucursal clienteSucursal) {
		notificarObjecto(Notificacion.getNew(WRITER_SUCURSALES_CLIENTE, clienteSucursal));
	}

	/**
	 * Muestra los clasificadores que tiene un {@link ClienteSucursal} en la salida de la operacion.
	 */
	private void mostrarClasificadoresSucursal(ClienteSucursal clienteSucursal) {
		List<ClienteSucursalClasificador> clasificadoresSucursal=clienteSucursal.getClasificadores();
		for (ClienteSucursalClasificador clasificador : clasificadoresSucursal) {
			notificarObjecto(Notificacion.getNew(WRITER_CLASIFICADORES_SUCURSAL, clasificador));
		}
	}

	/**
	 * Muestra los contactos de una sucursal de cliente en la salida de la operacion.
	 */
	private void mostrarContactos(ClienteSucursal clienteSucursal) {
		List<Contacto> contactos=clienteSucursal.getContactos();
		for (Contacto contacto : contactos) {
			notificarObjecto(Notificacion.getNew(WRITER_CONTACTOS, contacto));
		}
	}

	/**
	 * Muestra los domicilios de la sucursal de un cliente.
	 */
	private void mostrarDomicilios(ClienteSucursal clienteSucursal) {
		List<DomicilioEntrega> domiciliosEntrega=clienteSucursal.getDomiciliosDeEntrega();
		for (DomicilioEntrega domicilioEntrega : domiciliosEntrega) {
			notificarObjecto(Notificacion.getNew(WRITER_DOMICILIOS_ENTREGA, domicilioEntrega));
		}
	}

	/**
	 * Muestra todas las inscripciones de un sujeto impositivo
	 */
	private void mostrarInscripciones(Cliente cliente) {
		SujetoImpositivo sujetoImpositivo = cliente.getSujetoImpositivo();
		List<InscripcionImpositiva> inscripcionesImpositivas = sujetoImpositivo.getInscripcionesImpositivas();
		for (InscripcionImpositiva inscripcionImpositiva : inscripcionesImpositivas) {
			notificarObjecto(Notificacion.getNew(WRITER_INSCRIPCIONES, inscripcionImpositiva));
		}
	}

	/**
	 * Muestra los clasificadores que posee un cliente.
	 */
	private void mostrarClasificadores(Cliente cliente) {
		List<ClienteClasificador> listaClasificadores = cliente.getListaClasificadores();
		for (ClienteClasificador clienteClasificador : listaClasificadores) {
			notificarObjecto(Notificacion.getNew(WRITER_CLASIFICADORES_CLIENTES, clienteClasificador));
		}
	}

}
