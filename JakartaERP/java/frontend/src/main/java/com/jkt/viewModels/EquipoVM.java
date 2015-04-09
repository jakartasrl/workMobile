package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
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
import com.jkt.ov.TipoProductoOV;
import com.jkt.ov.ValoresTablaOV;

/**
 * ViewModel de la entidad {@link Equipo} que se encarga de procesar las
 * diferentes peticiones.
 * 
 */

public class EquipoVM extends ViewModel implements IBasicOperations{
	
	private EquipoOV ov = new EquipoOV();
	private DescriptibleOV clienteOV = new DescriptibleOV();
	private TipoProductoOV tipoProductoOV = new TipoProductoOV();
	private List<CaracteristicaProductoOV> caracteristicas = new ArrayList<CaracteristicaProductoOV>();

	private CaracteristicaProductoOV caracteristicaProductoOV = new CaracteristicaProductoOV();
	private List<EquipoCaracteristicaOV> equipoCaracteristicas = new ArrayList<EquipoCaracteristicaOV>();
	
	private List<ValoresTablaOV> marcas = new ArrayList<ValoresTablaOV>();
	private ValoresTablaOV marca= new ValoresTablaOV();
	
	public List<ValoresTablaOV> getMarcas() {
		return marcas;
	}

	public void setMarcas(List<ValoresTablaOV> marcas) {
		this.marcas = marcas;
	}

	public ValoresTablaOV getMarca() {
		return marca;
	}

	public void setMarca(ValoresTablaOV marca) {
		this.marca = marca;
	}

	public List<EquipoCaracteristicaOV> getEquipoCaracteristicas() {
		return equipoCaracteristicas;
	}

	public void setEquipoCaracteristicas(
			List<EquipoCaracteristicaOV> equipoCaracteristicas) {
		this.equipoCaracteristicas = equipoCaracteristicas;
	}

	public CaracteristicaProductoOV getCaracteristicaProductoOV() {
		return caracteristicaProductoOV;
	}

	public void setCaracteristicaProductoOV(
			CaracteristicaProductoOV caracteristicaProductoOV) {
		this.caracteristicaProductoOV = caracteristicaProductoOV;
	}

	public List<CaracteristicaProductoOV> getCaracteristicas() {
		return caracteristicas;
	}

	public void setCaracteristicas(List<CaracteristicaProductoOV> caracteristicas) {
		this.caracteristicas = caracteristicas;
	}

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
	@NotifyChange({"ov","caracteristicas","marcas"})
	public void traerEquipo() {
		
		long idEquipo = ov.getId();
		String entidad = "Equipo";
		
		ContainerOV containerOV = new ContainerOV();
		containerOV.setString1(String.valueOf(idEquipo));
		containerOV.setString2(entidad);
		
		EquipoOV eq = (EquipoOV) Operaciones.ejecutar("TraerEquipo", containerOV, EquipoOV.class);
	
		this.setCaracteristicas(eq.getCaracteristicas());
		
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

	public TipoProductoOV getTipoProductoOV() {
		return tipoProductoOV;
	}

	public void setTipoProductoOV(TipoProductoOV tipoProductoOV) {
		this.tipoProductoOV = tipoProductoOV;
	}

	public EquipoOV getOv() {
		return ov;
	}

	public void setOv(EquipoOV ov) {
		this.ov = ov;
	}

	@Init
	@NotifyChange("ov")
	public void init() {
		this.setTitulo("Administracion de Equipos");
		this.traer();
	}

	@Command("traer")
	@NotifyChange("ov")
	public void traer() {

		ListMarcaOV marcas = (ListMarcaOV) Operaciones.ejecutar("TraerMarca", ListMarcaOV.class);
		this.ov.setMarcas(marcas.getList());
	}

	@Command
	public void cerrarModal(@BindingParam("window") Window win) {
		win.detach();
	}


	@Override
	@GlobalCommand("actualizar")
	@NotifyChange({ "ov","clienteOV", "tipoProductoOV", "caracteristicas","caracteristicaProductoOV","marcas" })
	public void actualizar() {
		log.warn("Actualizando datos...");
	}

	@Override
	protected String retrieveMethod() {
		return "actualizar";
	}
	
	@Command("guardar")
	@NotifyChange("ov")
	public void guardar() throws JakartaException {
		try{
			this.ov.setCodigo(this.ov.getMarca().getCodigo().concat("-").concat(this.ov.getNroSerie()));
		} catch(NullPointerException e){
			throw new JakartaException("Debe ingresar marca y numero de serie.");
		}
		
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
		Messagebox.show("Equipo Guardado correctamente.");
	}

	@Command
	@NotifyChange({ "ov","clienteOV", "tipoProductoOV", "caracteristicas","caracteristicaProductoOV","marcas","marca","equipoCaracteristicas"})
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
	}

	@Override
	@Command
	public void buscar() throws JakartaException {
		try {
			this.openHelper("equipo", "", this.ov, "traerEquipo", "Equipos", "Código", "Descripción de equipos");
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

	public DescriptibleOV getClienteOV() {
		return clienteOV;
	}

	public void setClienteOV(DescriptibleOV clienteOV) {
		this.clienteOV = clienteOV;
	}
	
}
