package com.jkt.persistencia;

import com.jkt.dominio.PersistentEntity;

/**
 * Intenta ejecutar transaccionalmente instrucciones.
 * Esta clase es de utilidad para el manejo de lazy collections 
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public interface WrapperTransactional {

	void ejecutar(PersistentEntity ...entities);
	
}
