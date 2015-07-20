package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.Data;

import com.jkt.dominio.ComprobanteCliente;
import com.jkt.dominio.IDetalle;
import com.jkt.dominio.Usuario;
import com.jkt.excepcion.JakartaException;

/**
 * <p>Representa los trabajos que se deben hacer o hicieron en un laboratorio.</p>
 * <p>Se utilizara para la gestion del laboratorio. Indica que se debe hacer y los resultados de losensayos realizados.</p>
 * 
 */
@Data
public class Protocolo extends ComprobanteCliente implements IDetalle{

	
	@NotNull(message="Un protocolo debe tener asignado un laboratorio.")
	private Laboratorio laboratorio;
	
//	private Pedido pedido;
	private long idPedido;
	
	@NotNull(message="Un protocolo debe tener asignado un equipo.")
	private Equipo equipo;
	
	private int estado;
	private Date fechaHoraMuestra;
	private Date fechaHoraResultado;
	private Usuario usuarioIngresoResultado;
	private Usuario usuarioIngresoAprobacion;
	private Date fechaHoraAprobacion;
	private String comentario;
	private Diagnostico diagnostico;

	private String codigoDiagnostico;
	private String comentarioDiagnostico;
	
	private String ordenTrabajo;
	
	private boolean impreso;
	private boolean enviado;
	private List<ProtocoloDetalle> detalles=new ArrayList<ProtocoloDetalle>();
	
	private Usuario usuarioFinalizado;
	private Date fechaHoraFinalizacion;
	
//	private String comentarioDiagnostico;
	
	public void agregarDetalle(ProtocoloDetalle p){
		if (!this.detalles.contains(p)) {
			this.detalles.add(p);
			p.setProtocolo(this);
		}
	}
	
	public List<ProtocoloDetalle> getDetalles() {
		return detalles;
	}


	public void setDetalles(List<ProtocoloDetalle> detalles) {
		this.detalles = detalles;
	}


	/**
	 * En la creacion del protocolo se definen datos por defecto.
	 */
	public Protocolo() {
		this.estado=Estado.ESTADO_INICIAL.getId();
		this.impreso=false;
		this.enviado=false;
		this.fechaHoraMuestra=new Date();
	}
	
	
	/**
	 * Recupera la descripcion del estado actual.
	 * 
	 * @return String estado en formato de cadena
	 * @throws JakartaException Cuando el estado numerico asignado no es coherente.
	 */
	public String obtenerEstado() throws JakartaException{
		return Protocolo.Estado.getEstado(this.getEstado()).getDescripcion();
	}
	
	/*
	 * 
	 * Declaracion de los estados en enum.
	 * 
	 */
	public enum Estado{

		ESTADO_INICIAL(1) {
			@Override
			public String getDescripcion() {
				return "Estado Inicial";
			}
		},
		APROBADO(2) {
			@Override
			public String getDescripcion() {
				return "Aprobado";
			}
		},
		TERMINADO(3) {
			@Override
			public String getDescripcion() {
				return "Terminado";
			}
		};
		
		
		private int id;
		public abstract String getDescripcion();
	
		private Estado(int id) {
			this.id=id;
		}
		
		public int getId(){
			return this.id;
		}
		
		public static Estado getEstado(int value) throws JakartaException{
			Estado[] values = values();
			Estado e = null;
			for (Estado estado : values) {
				if(estado.getId()==value){
					e=estado;
					break; 
				}
			}
			if (e==null) {
				throw new JakartaException("No existe un Estado para la solicitud recibida.");
			}
			return e;
		}
	
	}
	
	public String getCodigo(){
		return this.getNro();
	}
	
	public String getDescripcion(){
		return this.getClienteSucursal().getCliente().getDescripcion();
	}
	
	public boolean isProtocolo(){
		return true;
	}

	public String getNombreDeMaestro() {
		return "laboratorio";
	}
	
}
