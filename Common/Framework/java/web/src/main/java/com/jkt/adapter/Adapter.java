package com.jkt.adapter;

import java.util.Set;

import javax.validation.ConstraintViolation;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionException;
import com.jkt.persistencia.ISessionProvider;
import com.jkt.request.EventBusiness;
import com.jkt.service.SessionProvider;

@Component
public abstract class Adapter<T,T2> implements  AdapterInterface<T,T2> {
	protected ISessionProvider sessionProvider;
	protected Session session;
	
	/*
	 * FIN de definición de las estrategias.
	 * 
	 */
	public T adaptRequest(T2 input, EventBusiness operation) throws Exception,EntityNotFoundException {
		session = sessionProvider.getSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
		}catch(org.hibernate.TransactionException e){
			throw new JakartaException("Espere unos segundos mientras finaliza una operacion pendiente...Intente nuevamente en breves segundos...");
		}	
		try{
			T map = adaptRequestHook(input, operation);
			tx.commit();
			return map;
		}catch(JakartaException e){
			tx.rollback();
			sessionProvider.destroySession();
			throw e;
		}catch(javax.validation.ConstraintViolationException e){
				Set<ConstraintViolation<?>> constraintViolations = e.getConstraintViolations();
				constraintViolations.size();
				StringBuffer buffer=new StringBuffer();
				String message = null;
				
				for (ConstraintViolation<?> constraintViolation : constraintViolations) {
					buffer.append(constraintViolation.getMessage());
					break;
				}
				
				tx.rollback();
				sessionProvider.destroySession();
				
				throw new ValidacionException(buffer.toString());
		}catch(Exception e){
			tx.rollback();
			sessionProvider.destroySession();
			
			if (e.getCause()!=null) {
				throw new JakartaException(e.getCause().getMessage());
			}else{
				throw e;
			}
		}
		
//		finally{
//				if (tx.isActive()) {
//					tx.commit();
//				}
//				sessionProvider.destroySession();
//		}
	}

	protected abstract T adaptRequestHook(T2 input, EventBusiness operation) throws Exception,EntityNotFoundException;
	
	@Autowired
	public void setSession(SessionProvider sessionProvider) {
		this.sessionProvider=sessionProvider;
	}
	
	/**
	 * @param clazz
	 * @param oid
	 * @return
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws Exception
	 */
	public PersistentEntity recuperarObjecto(Class<?> clazz, long oid) throws EntityNotFoundException,InstantiationException, IllegalAccessException{
		Object newInstance;
		if (oid<1) {//Si el id buscado es 0 o negativo, se retorna una nueva instancia
			newInstance	= clazz.newInstance();
		}else{
			newInstance=session.get(clazz, oid);
			if (newInstance==null) {
				throw new EntityNotFoundException(String.format("No existe la entidad de tipo %s con oid %s.", clazz.getSimpleName(), String.valueOf(oid)));
			}
		}
		return (PersistentEntity) newInstance;
	}
	
	public Session getSession(){
		return sessionProvider.getSession();
	}
}
