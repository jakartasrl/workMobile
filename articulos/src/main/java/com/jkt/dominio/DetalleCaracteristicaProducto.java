package com.jkt.dominio;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.iterators.ArrayListIterator;

import lombok.Data;

/**
 * Utilidad 1 . Esta entidad es la encargada de recibir los datos detalle de cada tipo de producto.
 * En su interior a su vez contiene subdetalles
 * 
 * 
 * Utilidad 2 . Sirve para comunicar front y backend. Desde la webapp mobile se envia un request que matchea contra esta entidad, la cual se usa
 * para formatear el request enviado hacia el ERP de jakarta
 * @author ssuarez
 *
 */
@Data
public class DetalleCaracteristicaProducto extends PersistentEntity {

	//Para recibir dato desde el ERP
	private String oid; //Se usa como id para no ir a buscar la entidad a la base de datos.
	private String codigo, descripcion, tipo, longitud;
	private List detalles=new ArrayList();
	private List detallesFinal=new ArrayList();
	
	//Para enviar valores al ERP
	private String valorString;
	private int valorEntero;
//	private String valorOid; 
//	private DetalleCaracteristicaProducto valorSeleccionado;
	
	private String idValorCombo,codigoCombo;
	
}
