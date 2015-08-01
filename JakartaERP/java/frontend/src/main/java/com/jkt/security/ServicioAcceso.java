package com.jkt.security;

import java.util.Map;

import org.jfree.util.Log;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Page;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zk.ui.util.Initiator;

import com.jkt.ov.UserOV;

public class ServicioAcceso implements Initiator {

	@Override
	public synchronized void doInit(Page page, Map<String, Object> args) throws Exception {
		Session sess = Sessions.getCurrent();
		UserOV cre = (UserOV) sess.getAttribute("userCredential");
		if (cre == null) {
			Log.warn("El usuario no tiene las credencials correctas.");
	        Executions.sendRedirect("/index.zul");
		}
	}

}
