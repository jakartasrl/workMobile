package com.jkt.erp.varios;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.validation.constraints.NotNull;
import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;
import com.jkt.dominio.IDescriptible;
import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.CondPago;
import com.jkt.varios.dominio.Especificacion;
import com.jkt.varios.dominio.Idioma;

/**
 * <p>Representa los Clientes de la empresa</p>
 * <p>Se utilizar� en el ingreso  pedidos, cotizaciones, facturas, etc</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class Cliente extends PersistentEntity implements IDescriptible{

	public Cliente() {
		this.setCreationDate(new Date());
	}
	
	private List<Especificacion> archivos=new ArrayList<Especificacion>();	

	public void agregarEspecificacion(Especificacion e){
		if (!archivos.contains(e)) {
			archivos.add(e);
		}
	}
	
	private String codigo;

	@NotNull(message="El Sujeto impositivo no debe estar vacio.")
	private SujetoImpositivo sujetoImpositivo;
	
	private String telefono;
	
	private String fax, mail;
	private String nroProveedor;
	
	private Representante representante;
	private Vendedor vendedor;
	
	private Idioma idioma;
	
	private List<EsquemaPreciosCliente> listaEsquemaPrecios=new ArrayList<EsquemaPreciosCliente>();
	
	@NotEmpty(message="Es necesario que el cliente tenga como minimo una sucursal.")
	private List<ClienteSucursal> listaSucursales=new ArrayList<ClienteSucursal>();
	
	private List<ClienteClasificador> listaClasificadores=new ArrayList<ClienteClasificador>();
	
	@NotNull(message="El cliente debe tener una condicion de pago.")
	private CondPago condPago;
	
	/*
	 * Variables de instancia
	 * ***********************************************************************************************
	 */

	/*
	 * Metodo getDescripcion para mostrarlo en la lista generica de ayuda.
	 */
	public String getDescripcion(){
//		String valorCuit=(" (").concat(sujetoImpositivo.getCuit()==null?"-":sujetoImpositivo.getCuit()).concat(")");
		return sujetoImpositivo.getRazonSocial();
	}
	

	public void setSujetoImpositivo(SujetoImpositivo sujetoImpositivo) {
		if (sujetoImpositivo!=null) {
			this.sujetoImpositivo = sujetoImpositivo;
			this.sujetoImpositivo.setCliente(this);
		}
	}


	/*
	 * helper methods
	 */
	public void addClienteSucursal(ClienteSucursal clienteSucursal){
		if(!listaSucursales.contains(clienteSucursal)){
			listaSucursales.add(clienteSucursal);
			clienteSucursal.setCliente(this);
		}
	}
	
	public void addEsquemaPrecios(EsquemaPreciosCliente precioCliente){
		agregarObjectoAColeccion(listaEsquemaPrecios, precioCliente);
	}
	
	public void addValorClasificador(ClienteClasificador clienteClasificador){
		if (clienteClasificador!=null && clienteClasificador.getComponenteValor()!=null) {
			if(!listaClasificadores.contains(clienteClasificador)){
				listaClasificadores.add(clienteClasificador);
				clienteClasificador.setCliente(this);
			}
		}
	}

	public String getAdicional1() {
		return this.getTelefono();
	}

	public String getAdicional2() {
		return this.getFax();
	}
	
	//Se crea solo para mostrar en pantalla
	private List<InscripcionImpositiva> inscripcionesImpositivasTransientes = new ArrayList<InscripcionImpositiva>();
			
}
