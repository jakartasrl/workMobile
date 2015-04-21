package com.jkt.viewModels;

import lombok.Data;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;

import com.jkt.common.Operaciones;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.UserOV;

@Data
public class LoginVM {
	
	private String usuario;
	private String password;
	
	private boolean showError=false;
	private String error="";
	
	@Command
	@NotifyChange({"error","showError"})
	public void acceder(){
	
		ContainerOV objetoOV = new ContainerOV();
		
		objetoOV.setString1(usuario);
		objetoOV.setString2(password);
		
		DescriptibleOV result= new DescriptibleOV();

		try{
			result = (DescriptibleOV) Operaciones.ejecutar("Login", objetoOV, DescriptibleOV.class);
			
			Session sess = Sessions.getCurrent();
			  
			UserOV userOV = new UserOV();
			userOV.setId(result.getId());
			userOV.setName(result.getCodigo());
			userOV.setLastName(result.getDescripcion());
			sess.setAttribute("userCredential",userOV);
			     
			Executions.sendRedirect("/index.zul");

		}catch(Exception e){
			this.showError=true;
			this.error= e.getMessage();
		}

	}
	
}
