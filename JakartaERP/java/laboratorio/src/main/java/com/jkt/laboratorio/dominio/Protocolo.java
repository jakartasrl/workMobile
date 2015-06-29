package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.ComprobanteCliente;
import com.jkt.dominio.Usuario;
import com.jkt.excepcion.JakartaException;

/**
 * <p>Representa los trabajos que se deben hacer o hicieron en un laboratorio.</p>
 * <p>Se utilizara para la gestion del laboratorio. Indica que se debe hacer y los resultados de losensayos realizados.</p>
 * 
 */
public class Protocolo extends ComprobanteCliente {

	
	@NotNull(message="Un protocolo debe tener asignado un laboratorio.")
	private Laboratorio laboratorio;
	
//	private Pedido pedido;
	
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
	private String comentarioDiagnostico;
	private boolean impreso;
	private boolean enviado;
	private List<ProtocoloDetalle> detalles=new ArrayList<ProtocoloDetalle>();
	
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
		this.estado=Estado.PENDIENTE_DE_RESULTADOS.getId();
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
	
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public Laboratorio getLaboratorio() {
		return laboratorio;
	}
	public void setLaboratorio(Laboratorio laboratorio) {
		this.laboratorio = laboratorio;
	}
	public Equipo getEquipo() {
		return equipo;
	}
	public void setEquipo(Equipo equipo) {
		this.equipo = equipo;
	}
	public Date getFechaHoraMuestra() {
		return fechaHoraMuestra;
	}
	public void setFechaHoraMuestra(Date fechaHoraMuestra) {
		this.fechaHoraMuestra = fechaHoraMuestra;
	}
	public Date getFechaHoraResultado() {
		return fechaHoraResultado;
	}
	public void setFechaHoraResultado(Date fechaHoraResultado) {
		this.fechaHoraResultado = fechaHoraResultado;
	}
	public Usuario getUsuarioIngresoResultado() {
		return usuarioIngresoResultado;
	}
	public void setUsuarioIngresoResultado(Usuario usuarioIngresoResultado) {
		this.usuarioIngresoResultado = usuarioIngresoResultado;
	}
	public Usuario getUsuarioIngresoAprobacion() {
		return usuarioIngresoAprobacion;
	}
	public void setUsuarioIngresoAprobacion(Usuario usuarioIngresoAprobacion) {
		this.usuarioIngresoAprobacion = usuarioIngresoAprobacion;
	}
	public Date getFechaHoraAprobacion() {
		return fechaHoraAprobacion;
	}
	public void setFechaHoraAprobacion(Date fechaHoraAprobacion) {
		this.fechaHoraAprobacion = fechaHoraAprobacion;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	public Diagnostico getDiagnostico() {
		return diagnostico;
	}
	public void setDiagnostico(Diagnostico diagnostico) {
		this.diagnostico = diagnostico;
	}
	public String getComentarioDiagnostico() {
		return comentarioDiagnostico;
	}
	public void setComentarioDiagnostico(String comentarioDiagnostico) {
		this.comentarioDiagnostico = comentarioDiagnostico;
	}

	public boolean isImpreso() {
		return impreso;
	}
	public void setImpreso(boolean impreso) {
		this.impreso = impreso;
	}
	public boolean isEnviado() {
		return enviado;
	}
	public void setEnviado(boolean enviado) {
		this.enviado = enviado;
	}
	
	
	/*
	 * 
	 * Declaracion de los estados en enum.
	 * 
	 */
	public enum Estado{

		PENDIENTE_DE_RESULTADOS(1) {
			@Override
			public String getDescripcion() {
				return "Pendiente de resultados";
			}
		},
		PENDIENTE_DE_APROBACION(2) {
			@Override
			public String getDescripcion() {
				return "Pendiente de aprobaci�n";
			}
		},
		TERMINADO(3) {
			@Override
			public String getDescripcion() {
				return "Termiando";
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
	
}
