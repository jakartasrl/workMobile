package com.jkt.viewModels;

import java.util.HashMap;

import lombok.Data;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.Init;
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
	
	private String usuario="";
	private String password="";
	
	private boolean showError=false;
	private String error="";
	
	@Command
	@NotifyChange({"error","showError"})
	public void acceder(){
	
		ContainerOV objetoOV = new ContainerOV();
		
		objetoOV.setString1(usuario.toLowerCase());
		objetoOV.setString2(password);
		
		UserOV result= new UserOV();

		try{
//			result = (UserOV) Operaciones.ejecutar("Login", objetoOV, UserOV.class);
			
			if("1".equals(objetoOV.getString1()) && "1".equals(objetoOV.getString2())){
				Session sess = Sessions.getCurrent();
				result.setName(usuario);
				sess.setAttribute("userCredential",result);
				Executions.sendRedirect("index.zul");
			}else{
				this.showError=true;
				this.error= "Verifique usuario y clave.";
			}
			
			

		}catch(Exception e){
			this.showError=true;
			this.error= e.getMessage();
		}
	}
	
	
//	@Init
	public void logOut(){
		Session sess = Sessions.getCurrent();
        sess.removeAttribute("userCredential");
        sess.removeAttribute("ventanas");
	}
	
}
