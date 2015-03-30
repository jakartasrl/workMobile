package com.jkt.ov;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.pedido.dominio.Pedido;
import com.jkt.view.ObjectView;

/**
 * <p>ObjectView correspondiente a la entidad {@link Pedido}</p>
 * <p>Mapea los atributos que se envian y generar�n o actualizar�n un {@link Pedido}</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class PedidoOV extends ObjectView {
	
	private String letra="l";
	private String lugarEmision="l";
	private String nro="10";
	private boolean anulado = false;

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
	
}
