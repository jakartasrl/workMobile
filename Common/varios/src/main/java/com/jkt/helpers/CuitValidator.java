package com.jkt.helpers;

import com.jkt.excepcion.JakartaException;

public class CuitValidator {
	
	public static void validarCuit(String aCuit) throws JakartaException{
		if(aCuit == null || aCuit.trim().length() < 13)
			throw new JakartaException("El cuit debe tener por lo menos 13 caracteres");
		
		if(aCuit.charAt(2) != '-' && aCuit.charAt(11) != '-')
			throw new JakartaException("El cuit debe ser de la forma XX-XXXXXXXX-X");
		
		int nroVerificador = getNroEntero(aCuit, 12);
		
		int valor = 0;
		valor += (getNroEntero(aCuit, 0) * 5);
		valor += (getNroEntero(aCuit, 1) * 4);
		
		valor += (getNroEntero(aCuit, 3)  * 3);
		valor += (getNroEntero(aCuit, 4)  * 2);
		valor += (getNroEntero(aCuit, 5)  * 7);
		valor += (getNroEntero(aCuit, 6)  * 6);
		valor += (getNroEntero(aCuit, 7)  * 5);
		valor += (getNroEntero(aCuit, 8)  * 4);
		valor += (getNroEntero(aCuit, 9)  * 3);
		valor += (getNroEntero(aCuit, 10)* 2);
		
		int resto  = valor % 11;
		int digito = 0;
		
		switch (resto) {
		case 0:
			digito = 0;
			break;
		case 1:
			digito = 1;
			break;
		default:
			digito = 11 - resto;
		break;
		}
		
		if(digito != nroVerificador)
			throw new JakartaException("Cuit invalido: " + aCuit + ". Digito verificador propuesto: " + digito);
	}
	
	private static int getNroEntero(String aCuit, int aPos) throws JakartaException{
		Integer nro = null;
		try{
			nro = new Integer("" + aCuit.charAt(aPos));
		}
		catch(Exception e){
			throw new JakartaException("El numero '" + aCuit.charAt(aPos) + "' no es un numero valido.");
		}
		
		return nro.intValue();
	}
}