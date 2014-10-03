package com.jkt.erp.operaciones;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.varios.Cliente;
import com.jkt.erp.varios.ClienteClasificador;
import com.jkt.erp.varios.ClienteSucursal;
import com.jkt.erp.varios.ClienteSucursalClasificador;
import com.jkt.erp.varios.Contacto;
import com.jkt.erp.varios.DomicilioEntrega;
import com.jkt.erp.varios.InscripcionImpositiva;
import com.jkt.erp.varios.SujetoImpositivo;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.Direccion;

/**
 * <p>Operaci�n que recupera un cliente, y todo su contexto de datos, es decir, se recupera un cliente con
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
//		List<ClienteSucursal> sucursales = ;
		
		for (ClienteSucursal clienteSucursal : cliente.getListaSucursales()) {

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

		Map<String, Clasificador> clasificadoresSeteados=new HashMap<String, Clasificador>();
		
		List<ClienteSucursalClasificador> clasificadoresCliente=clienteSucursal.getClasificadores();
		
		String identificador;
		Clasificador clasificadorDelComponente;
		
		for (ClienteSucursalClasificador clasificador : clasificadoresCliente) {

			identificador=String.valueOf(clasificador.getClasificador().getId());
			clasificadorDelComponente=clasificador.getClasificador();
			//Guardo en un mapa al clasificador que ya ha sido seleccionado
			if (!clasificadoresSeteados.containsKey(identificador)) {
				clasificadoresSeteados.put(identificador,clasificadorDelComponente);
			}
			
			notificarObjecto(Notificacion.getNew(WRITER_CLASIFICADORES_SUCURSAL, clasificador));
		}
		
		List<PersistentEntity> clasificadores = serviceRepository.getByProperty(Clasificador.class, "entidad", "4");
		Clasificador c;
		ClienteSucursalClasificador clienteClasificador;
		for (PersistentEntity persistentEntity : clasificadores) {
			c=(Clasificador) persistentEntity;
			if (!clasificadoresSeteados.containsKey(String.valueOf(c.getId()))) {
				clienteClasificador = new ClienteSucursalClasificador();
				clienteClasificador.setId(0L);
				clienteClasificador.setClasificador(c);
				clienteClasificador.setClienteSucursal(clienteSucursal);
				notificarObjecto(Notificacion.getNew(WRITER_CLASIFICADORES_SUCURSAL, clienteClasificador));
			}
		}
		
		
	}
	
	private String obtenerIdDelClasificador(ClienteClasificador clasificador){
		return String.valueOf(clasificador.getClasificador().getId());
	}

	private Clasificador obtenerClasificador(ClienteClasificador clasificador){
		return clasificador.getClasificador();
	}

	/**
	 * Muestra los contactos de una sucursal de cliente en la salida de la operacion.
	 */
	private void mostrarContactos(ClienteSucursal clienteSucursal) {
		List<Contacto> contactos=clienteSucursal.getContactos();
		long id = clienteSucursal.getId();
		for (Contacto contacto : contactos) {
			contacto.setClienteSucursal(id);
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
		
		Map<String, Clasificador> clasificadoresSeteados=new HashMap<String, Clasificador>();
		
		List<ClienteClasificador> clasificadoresCliente=cliente.getListaClasificadores();
		
		String identificador;
		Clasificador clasificadorDelComponente;
		
		for (ClienteClasificador clasificador : clasificadoresCliente) {

			identificador=obtenerIdDelClasificador(clasificador);
			clasificadorDelComponente=obtenerClasificador(clasificador);
			//Guardo en un mapa al clasificador que ya ha sido seleccionado
			if (!clasificadoresSeteados.containsKey(identificador)) {
				clasificadoresSeteados.put(identificador,clasificadorDelComponente);
			}
			
			notificarObjecto(Notificacion.getNew(WRITER_CLASIFICADORES_CLIENTES, clasificador));
		}
		
		List<PersistentEntity> clasificadores = serviceRepository.getByProperty(Clasificador.class, "entidad", "3");
		Clasificador c;
		ClienteClasificador clienteClasificador;
		for (PersistentEntity persistentEntity : clasificadores) {
			c=(Clasificador) persistentEntity;
			if (!clasificadoresSeteados.containsKey(String.valueOf(c.getId()))) {
				clienteClasificador = new ClienteClasificador();
				clienteClasificador.setId(0L);
				clienteClasificador.setClasificador(c);
				clienteClasificador.setCliente(cliente);
				notificarObjecto(Notificacion.getNew(WRITER_CLASIFICADORES_CLIENTES, clienteClasificador));
				
			}
		}
	}

}
