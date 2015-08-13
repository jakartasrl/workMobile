package com.jkt.validadores;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.Producto;
import com.jkt.erp.articulos.TipoProducto;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.laboratorio.dominio.Expresion;
import com.jkt.laboratorio.dominio.Metodo;
import com.jkt.laboratorio.dominio.Variable;
import com.jkt.operaciones.ValidacionDeNegocio;
import com.jkt.varios.dominio.UnidadMedida;

public class ValidadorDeterminaciones extends ValidacionDeNegocio{

	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		
		Determinacion deter = (Determinacion) entity;
		if (deter.getMetodos().isEmpty()){
			throw new ValidacionDeNegocioException("La determinación debe tener al menos un metodo");		
		}
		
		for (Metodo metodo : deter.getMetodos()) { //por cada metodo...
			//y para cada variable del metodo...
			
			for (Variable variable : metodo.getVariables()) {
				if (!variable.isInput()) {
					//Se tiene que calcular la expresion...
					Expresion expresion = new Expresion();
					expresion.setExpresion(variable.getExpresion());
					expresion.setVariable(variable);
				}
			}
		}

		try {
			relacionarConProducto(deter);
		} catch (Exception e) {
			throw new ValidacionDeNegocioException("Ocurrió una inconsistencia al recuperar los parametros necesarios para asociar una determinación a un producto.",e);
		}
		
		
	}

	private void relacionarConProducto(Determinacion d) throws Exception {

		Producto articulo = new Producto();
		articulo.setCodigo(d.getCodigo());
		articulo.setDescripcion(d.getDescripcion());
		
		Configuracion configTipoProducto = (Configuracion) serviceRepository.getUniqueByProperty(Configuracion.class, "nombre", "tipoProductoDeterminacion");
		TipoProducto tipo = (TipoProducto) serviceRepository.getByOid(TipoProducto.class, Long.valueOf(configTipoProducto.getValorNumero()));
		articulo.setTipoProducto(tipo);

		Configuracion configUMedida = (Configuracion) serviceRepository.getUniqueByProperty(Configuracion.class, "nombre", "unidadMedidaDeterminacion");
		UnidadMedida UMedida = (UnidadMedida) serviceRepository.getByOid(UnidadMedida.class, Long.valueOf(configUMedida.getValorNumero()));
		articulo.setUniMedPrin(UMedida);
		
		d.setArticuloRelacionado(articulo);
	}

}
