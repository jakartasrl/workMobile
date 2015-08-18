package com.jkt.erp.operaciones;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.impuestos.dominio.Impuesto;
import com.jkt.erp.varios.Cliente;
import com.jkt.erp.varios.ClienteClasificador;
import com.jkt.erp.varios.ClienteSucursal;
import com.jkt.erp.varios.ClienteSucursalClasificador;
import com.jkt.erp.varios.DomicilioEntrega;
import com.jkt.erp.varios.InscripcionImpositiva;
import com.jkt.erp.varios.SujetoImpositivo;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.Contacto;
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
	private static final String WRITER_ARCHIVOS = "archivos";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Cliente cliente = (Cliente) obtener(Cliente.class, (String) aParams.get(IDENTIFICADOR));
//		mostrarCliente(cliente);
//		mostrarClasificadores(cliente);
		mostrarInscripciones(cliente);
		mostrarSucursales(cliente);
		
//		notificarObjetos(WRITER_ARCHIVOS, cliente.getArchivos());
		
		//Creado por ER
		notificarObjeto("", cliente);
		
	}
	
	
	/**
	 * <p>Muestra un simple cliente en la salida de la operacion.</p>
	 * <p>Ademas de mostrar datos de clientes, muestra datos del sujeto impositivo</p>
	 */
	private void mostrarCliente(Cliente cliente) {
		notificarObjeto(WRITER_CLIENTE, cliente);
		notificarObjeto(WRITER_SUJ_IMP, cliente.getSujetoImpositivo());
	}

	/**
	 * Muestra las sucursales y sus relaciones en la salida de la operacion.
	 */
	private void mostrarSucursales(Cliente cliente) {
		for (ClienteSucursal clienteSucursal : cliente.getListaSucursales()) {
//			mostrarSucursal(clienteSucursal);
			mostrarDomicilios(clienteSucursal);
			mostrarContactos(clienteSucursal);
//			mostrarClasificadoresSucursal(clienteSucursal);
		}
	}
	
	/**
	 * Muestra una simple sucursal del cliente en la salida de la operacion.
	 */
	private void mostrarSucursal(ClienteSucursal clienteSucursal) {
		notificarObjeto(WRITER_SUCURSALES_CLIENTE, clienteSucursal);
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
			
			notificarObjeto(WRITER_CLASIFICADORES_SUCURSAL, clasificador);
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
				notificarObjeto(WRITER_CLASIFICADORES_SUCURSAL, clienteClasificador);
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
//			notificarObjeto(WRITER_CONTACTOS, contacto);
//			clienteSucursal.getCliente().getContactosTransientes().add(contacto); //Se agregan contactos para mostrar por pantalla
		}
	}

	/**
	 * Muestra los domicilios de la sucursal de un cliente.
	 */
	private void mostrarDomicilios(ClienteSucursal clienteSucursal) {
		List<DomicilioEntrega> domiciliosEntrega=clienteSucursal.getDomiciliosDeEntrega();
		for (DomicilioEntrega domicilioEntrega : domiciliosEntrega) {
//			notificarObjeto(WRITER_DOMICILIOS_ENTREGA, domicilioEntrega);
//			clienteSucursal.getCliente().getDomiciliosDeEntregaTransientes().add(domicilioEntrega); //Se agregan domicilios de entrega para mostrar por pantalla
		}
	}

	/**
	 * Muestra todas las inscripciones de un sujeto impositivo
	 * @throws Exception 
	 */
	private void mostrarInscripciones(Cliente cliente) throws Exception {
		
		/*
		 * Guardo en un mapa todos los elementos.
		 */
		Map<String, Impuesto> impuestos=new HashMap<String, Impuesto>();
		for (PersistentEntity persistentEntity : obtenerTodos(Impuesto.class)) {
			impuestos.put(String.valueOf(((Impuesto)persistentEntity).getId()), ((Impuesto)persistentEntity));
		}
		
		SujetoImpositivo sujetoImpositivo = cliente.getSujetoImpositivo();
		for (InscripcionImpositiva inscripcionImpositiva : sujetoImpositivo.getInscripcionesImpositivas()) {
//			notificarObjeto(WRITER_INSCRIPCIONES, inscripcionImpositiva);
			cliente.getInscripcionesImpositivasTransientes().add(inscripcionImpositiva); //Se agregan inscripciones impositivas para mostrar por pantalla
			impuestos.remove(String.valueOf(inscripcionImpositiva.getImpuesto().getId()));
		}
		
		InscripcionImpositiva nuevaInscripcion;
		for (Impuesto impuesto : impuestos.values()) {
			nuevaInscripcion=new InscripcionImpositiva();
			nuevaInscripcion.setActivo(true);
			nuevaInscripcion.setImpuesto(impuesto);
			nuevaInscripcion.setSujetoImpositivo(cliente.getSujetoImpositivo());
			
//			notificarObjeto(WRITER_INSCRIPCIONES, nuevaInscripcion);
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
			
			notificarObjeto(WRITER_CLASIFICADORES_CLIENTES, clasificador);
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
				notificarObjeto(WRITER_CLASIFICADORES_CLIENTES, clienteClasificador);
				
			}
		}
	}
	
}
