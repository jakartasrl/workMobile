/**
 * 
 */
package com.jkt.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * 
 * Anotacion para distinguir a las operaciones.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@Component
@Lazy(value=true)
@Scope("prototype")//Ojo con esto, xq por mas que sea prototype, necesito una nueva instancia! No queda otra, hay que recuperarlo con el contexto.
public @interface OperacionBean {
}
