package com.jkt.ov;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hsqldb.lib.ArrayListIdentity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.pedido.dominio.Pedido;
import com.jkt.view.ObjectView;

/**
 * <p>ObjectView correspondiente a la entidad {@link Pedido}</p>
 * <p>Mapea los atributos que se envian y generarán o actualizarán un {@link Pedido}</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
@EqualsAndHashCode(callSuper=true,of={"nro"})
public class PedidoOV extends ObjectView {

	private String nroPresupuesto;
	private String letra;
	private String lugarEmision;
	private String nro;
	private boolean anulado = false;
	private Date fecha;

	private Long idCliente;
	private Long idSucursal;
	private Long idListaPrecio;
	private String referencia;
	private Boolean cargaACargoDeCliente=Boolean.FALSE;
	private Boolean transporteACargoDeCliente=Boolean.FALSE;
	private Boolean descargaACargoDeCliente=Boolean.FALSE;
	private Long idVendedor;
	private Long idRepresentante;
	private Long idContactoReferencia;
	private List<NotaOV> notas=new ArrayList<NotaOV>();	
	private List<PedidoDocumentacionOV> docs=new ArrayList<PedidoDocumentacionOV>();

	private List<ItemsOV> items=new ArrayList<ItemsOV>();
	private List<FormaFacturacionOV> facturaciones=new ArrayList<FormaFacturacionOV>();
	
	/**
	 * A partir de la lista de todos los documentos y de los documentos seleccionados, forma una lista en la que se diferencian solamente por el campo activo.
	 * ACTIVO es el campo que dice si fue entregado o no. Esto solo para no generar una nueva clase hija de ListOV.
	 * 
	 */
	public void completarListaDocumentos(List<DescriptibleOV> todosLosDocumentos, List<DescriptibleOV> docEntregados) {
		ArrayList<PedidoDocumentacionOV> finalList = new ArrayList<PedidoDocumentacionOV>();
		for (DescriptibleOV descriptibleOV : todosLosDocumentos) {
			PedidoDocumentacionOV ov = new PedidoDocumentacionOV();
			
			if (docEntregados.contains(descriptibleOV)) {
				ov.setEntregado(Boolean.TRUE);
			}else{
				ov.setEntregado(Boolean.FALSE);
			}
			
			ov.setIdDocumento(descriptibleOV.getId());
			finalList.add(ov);
		}
		
		this.docs=finalList;
	}	
	
	
}
