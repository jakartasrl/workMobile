package com.jkt.viewModels;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.laboratorio.dominio.Equipo;
import com.jkt.ov.CaracteristicaProductoOV;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.EquipoCaracteristicaOV;
import com.jkt.ov.EquipoOV;
import com.jkt.ov.ListCaracteristicaProductoOV;
import com.jkt.ov.ListMarcaOV;
import com.jkt.ov.ListPropiedadMatricialOV;
import com.jkt.ov.PropiedadMatricialOV;
import com.jkt.ov.TipoProductoOV;
import com.jkt.ov.ValoresTablaOV;

/**
 * ViewModel de la entidad {@link Equipo} que se encarga de procesar las
 * diferentes peticiones.
 * 
 */

@Data
public class EquipoVM extends ViewModel implements IBasicOperations{
	
	private EquipoOV ov = new EquipoOV();
	private DescriptibleOV clienteOV = new DescriptibleOV();
	private TipoProductoOV tipoProductoOV = new TipoProductoOV();
	private List<CaracteristicaProductoOV> caracteristicas = new ArrayList<CaracteristicaProductoOV>();

	private CaracteristicaProductoOV caracteristicaProductoOV = new CaracteristicaProductoOV();
	private List<EquipoCaracteristicaOV> equipoCaracteristicas = new ArrayList<EquipoCaracteristicaOV>();
	
	private List<ValoresTablaOV> marcas = new ArrayList<ValoresTablaOV>();
	private ValoresTablaOV marca= new ValoresTablaOV();
	
	private PropiedadMatricialOV propiedadMatricialOV = new PropiedadMatricialOV();
	private ListPropiedadMatricialOV lsPropiedadMatricialOV = new ListPropiedadMatricialOV();
	
	@SuppressWarnings("unchecked")
	@NotifyChange("caracteristicas")
	public void traerTipoProducto() {

		this.getCaracteristicas().clear();
		
		long idTipoProducto = tipoProductoOV.getId();
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(String.valueOf(idTipoProducto));

		ListCaracteristicaProductoOV determinaciones = (ListCaracteristicaProductoOV) Operaciones.ejecutar("TraerCaracteristicasDeProducto", containerOV, ListCaracteristicaProductoOV.class);
		this.caracteristicas = determinaciones.getList();

	}
	
	@SuppressWarnings("unchecked")
	@NotifyChange({"ov","caracteristicas","marcas","propiedadMatricialOV","lsPropiedadMatricialOV"})
	public void traerEquipo() throws IOException, Exception, JakartaException {
		
		long idEquipo = ov.getId();
		String entidad = "Equipo";
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(String.valueOf(idEquipo));
		containerOV.setString2(entidad);
		
		EquipoOV eq = (EquipoOV) Operaciones.ejecutar("TraerEquipo", containerOV, EquipoOV.class);
	
		this.setCaracteristicas(eq.getCaracteristicas());
		
		//Inicio
		this.lsPropiedadMatricialOV = (ListPropiedadMatricialOV) Operaciones.ejecutar("TraerPropiedades", ListPropiedadMatricialOV.class);
		//Fin
		
		DescriptibleOV clienteOV = new DescriptibleOV();
		clienteOV.setId(eq.getIdCliente());
		clienteOV.setCodigo(eq.getCodCliente());
		clienteOV.setDescripcion(eq.getDescCliente());
		this.setClienteOV(clienteOV);
		
		TipoProductoOV tipoProductoOV = new TipoProductoOV();
		tipoProductoOV.setId(eq.getIdTipoProducto());
		tipoProductoOV.setCodigo(eq.getCodTipoProducto());
		tipoProductoOV.setDescripcion(eq.getDescTipoProducto());
		this.setTipoProductoOV(tipoProductoOV);
		
		ListMarcaOV marcas = (ListMarcaOV) Operaciones.ejecutar("TraerMarca", ListMarcaOV.class);
		eq.setMarcas(marcas.getList());
		

		List<ValoresTablaOV> marcasDisponibles = eq.getMarcas();
		Long idMarca = eq.getIdMarca();
		ValoresTablaOV marcaSeleccionada=null;
		for (ValoresTablaOV valoresTablaOV : marcasDisponibles) {
			if (valoresTablaOV.getId()==idMarca) {
				marcaSeleccionada=valoresTablaOV;
				break;
			}
		}
		
		eq.setMarca(marcaSeleccionada);
		
		List<CaracteristicaProductoOV> listCaracteristicaProductoOV = eq.getCaracteristicas();
		for (CaracteristicaProductoOV caracteristicaProductoOV : listCaracteristicaProductoOV) {	
			if (caracteristicaProductoOV.getIdValorTabla() != null){
				DescriptibleOV valorTabla = new DescriptibleOV();
				valorTabla.setId(Long.parseLong(caracteristicaProductoOV.getIdValorTabla()));
				valorTabla.setCodigo(caracteristicaProductoOV.getCodigoValorTabla());
				valorTabla.setDescripcion(caracteristicaProductoOV.getDescValorTabla());
				
				caracteristicaProductoOV.setValorTabla(valorTabla);
			}
				
		}
			 
		this.setOv(eq);
		
	}

	@Init(superclass=true)
	@NotifyChange("ov")
	public void init() {
		this.setTitulo("Administracion de Equipos");
		this.traer();
	}

	@Command("traer")
	@NotifyChange("ov")
	public void traer() {

		try{
			ListMarcaOV marcas = (ListMarcaOV) Operaciones.ejecutar("TraerMarca", ListMarcaOV.class);
			this.ov.setMarcas(marcas.getList());
		}catch(Exception e){
			Messagebox.show("Compruebe la parametrización del sistema, correspondiente con las marcas.", "Mensaje de error", Messagebox.OK , Messagebox.EXCLAMATION, new org.zkoss.zk.ui.event.EventListener() {    
				public void onEvent(Event evt) throws InterruptedException, IOException {
					Executions.sendRedirect("../menu.zul");
			    }
			}
			);
		
		}
		
	}

	@Command
	public void cerrarModal(@BindingParam("window") Window win) {
		win.detach();
	}


	@Override
	@GlobalCommand("actualizar")
	@NotifyChange({ "ov","clienteOV", "tipoProductoOV", "caracteristicas","caracteristicaProductoOV","marcas","propiedadMatricialOV","lsPropiedadMatricialOV"})
	public void actualizar() {
		log.warn("Actualizando datos...");
	}

	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}
	
	@Command("guardar")
	@NotifyChange({ "ov","clienteOV", "tipoProductoOV", "caracteristicas","caracteristicaProductoOV","marcas","marca","equipoCaracteristicas","propiedadMatricialOV","lsPropiedadMatricialOV"})
	public void guardar() throws JakartaException {
		
		if (!this.validar()){
			return;
		}

		this.ov.setCodigo(this.ov.getMarca().getCodigo().concat("-").concat(this.ov.getNroSerie()));
		
		this.ov.setIdMarca(this.ov.getMarca().getId());
		
		this.ov.setMarcas(this.ov.getMarcas());
		
		this.ov.setIdCliente(clienteOV.getId());
		this.ov.setIdTipoProducto(this.tipoProductoOV.getId());

		this.ov.setCaracteristicas(this.caracteristicas);
		
		List<CaracteristicaProductoOV> c2 = this.ov.getCaracteristicas();
		for (CaracteristicaProductoOV caracteristicaProductoOV : c2) {
			EquipoCaracteristicaOV equipoCaracteristicaOV = new EquipoCaracteristicaOV();
			
			equipoCaracteristicaOV.setId(caracteristicaProductoOV.getIdEquipoCaracteristica());
			
			equipoCaracteristicaOV.setIdValor(caracteristicaProductoOV.getValorTabla().getId()==0L?null:caracteristicaProductoOV.getValorTabla().getId());
			equipoCaracteristicaOV.setIdCaracteristica(caracteristicaProductoOV.getId());
			
			equipoCaracteristicaOV.setValorEntero(caracteristicaProductoOV.getValorEntero());
			equipoCaracteristicaOV.setValorBoolean(caracteristicaProductoOV.getValorBoolean());
			equipoCaracteristicaOV.setValorString(caracteristicaProductoOV.getValorString());
			equipoCaracteristicaOV.setValorDouble(caracteristicaProductoOV.getValorDouble());
			equipoCaracteristicaOV.setIdValorTabla(caracteristicaProductoOV.getIdValorTabla());
			equipoCaracteristicaOV.setCodigoValorTabla(caracteristicaProductoOV.getCodigoValorTabla());
			equipoCaracteristicaOV.setDescValorTabla(caracteristicaProductoOV.getDescValorTabla());
			
			this.equipoCaracteristicas.add(equipoCaracteristicaOV);
			
		}
		
		this.ov.setCaracteristicasEquipo(this.equipoCaracteristicas);

		Operaciones.ejecutar("saveEquipo", this.ov);
		Executions.sendRedirect("/pantallas/index/index-equipo.zul");
	}

	private boolean validar() {
		
		if (this.ov.getMarca().getCodigo() == null || this.ov.getMarca().getCodigo().equals("")) {
			Messagebox.show("Debe seleccionar una marca.");
			return false;
		}
		
		if (this.ov.getNroSerie() == null || this.ov.getNroSerie().equals("")) {
			Messagebox.show("Debe ingresar un numero de serie.");
			return false;
		}
		
		if (this.ov.getDescripcion() == null || this.ov.getDescripcion().equals("")) {
			Messagebox.show("Debe ingresar una descripcion del Equipo.");
			return false;
		}
		
		if (this.clienteOV.getCodigo() == null || this.clienteOV.getCodigo().equals("")) {
			Messagebox.show("Debe ingresar un Cliente.");
			return false;
		}
		
		if (this.tipoProductoOV.getCodigo() == null || this.tipoProductoOV.getCodigo().equals("")) {
			Messagebox.show("Debe ingresar un Tipo de Producto.");
			return false;
		}
		
		return true;
		
	}

	@Command
	@NotifyChange({ "ov","clienteOV", "tipoProductoOV", "caracteristicas","caracteristicaProductoOV","marcas","marca","equipoCaracteristicas","propiedadMatricialOV","lsPropiedadMatricialOV"})
	public void nuevo() {
		//borrar topdos los ovs, asignando una nueva isntancia... ov= new ovm
		this.ov = new EquipoOV();
		this.clienteOV = new DescriptibleOV();
		this.tipoProductoOV = new TipoProductoOV();
		this.caracteristicas = new ArrayList<CaracteristicaProductoOV>();
		this.caracteristicaProductoOV = new CaracteristicaProductoOV();
		this.equipoCaracteristicas = new ArrayList<EquipoCaracteristicaOV>();
		this.marcas = new ArrayList<ValoresTablaOV>();;
		this.marca= new ValoresTablaOV();
		this.init();
		Executions.sendRedirect("/pantallas/index/index-equipo.zul");
	}

	@Override
	@Command
	public void buscar() throws JakartaException {
		try {
			this.openHelper("equipo", "", this.ov, "traerEquipo", "Equipos", "Código", "Descripción de equipos",false);
		} catch (IllegalAccessException e) {
			levantarExcepcion(e); 
		} catch (IllegalArgumentException e) {
			levantarExcepcion(e);
		} catch (InvocationTargetException e) {
			levantarExcepcion(e);
		}
		
	}

	private void levantarExcepcion(Exception e) throws JakartaException{
		throw new JakartaException("Ocurrio un error al llamar al helper generico");
	}

	@Override
	@NotifyChange({"ov","clienteOV", "tipoProductoOV", "caracteristicas","caracteristicaProductoOV","marcas","marca","equipoCaracteristicas","lsPropiedadMatricialOV"})
	public void cancelarCustomizado() throws JakartaException {
		this.nuevo();
		Executions.sendRedirect("/pantallas/index/index-equipo.zul");
	}
	
}
