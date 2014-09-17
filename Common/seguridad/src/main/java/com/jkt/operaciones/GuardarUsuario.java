package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.Empresa;
import com.jkt.dominio.EmpresaHabilitada;
import com.jkt.dominio.HistorialPassword;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.Usuario;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionException;

/**
 * Operacion customizada ya que el manejo de empresas habilitadas escapa a la traza por defecto.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@OperacionBean
public class GuardarUsuario extends Operation{

	@Override
	@SuppressWarnings("unchecked")
	public void execute(Map<String, Object> aParams) throws Exception {
		List<PersistentEntity> objetos = recuperarObjeto(aParams);
		Usuario usuario;
		for (PersistentEntity u : objetos) {
			usuario=(Usuario) u;
			
			if (usuario.getPassword()==null || usuario.getPassword().isEmpty()) {
				throw new ValidacionException("Hay un error con un usuario registrado. Por favor ingrese la password de cada uno de ellos.");
			}
			
			usuario.getEmpresasHabilitadas().clear();	//FIXME Cuando tengan el filtro, lo que vamos a hacer es usar el OID,
														//y no se generarán nuevas instancias, sino que siempre será actualizacion.

			List<EmpresaHabilitada> empresasHabilitadasPlanas = usuario.getEmpresasHabilitadasPlanas();//Uso los campos planchados para recuperar desde la base
			for (EmpresaHabilitada empresaHabilitada : empresasHabilitadasPlanas) {
				Empresa empresa = (Empresa)obtener(Empresa.class, empresaHabilitada.getOidEmpresa() );
				
				if (empresa==null) {
					throw new JakartaException("Existe una inconsistencia en los datos. La empresa ingresada no existe.");
				}
				
				EmpresaHabilitada empresaAGuardarEnUsuario = new EmpresaHabilitada();
				empresaAGuardarEnUsuario.setUsuario(usuario);
				empresaAGuardarEnUsuario.setEmpresa(empresa);
				empresaAGuardarEnUsuario.setHabilitada(empresaHabilitada.isHabilitada());
				empresaAGuardarEnUsuario.setPorDefecto(empresaHabilitada.isPorDefecto());
				
				usuario.agregarEmpresaHabilitada(empresaAGuardarEnUsuario);
			}
			
			/*
			 * Manejo de la password del usuario.
			 */
			HistorialPassword historialPassword = new HistorialPassword();
			historialPassword.setPassword(DigestUtils.md5(usuario.getPassword().getBytes()));
			
			usuario.addPassword(historialPassword);
			
			serviceRepository.save(usuario);
		}
	}
	
}
