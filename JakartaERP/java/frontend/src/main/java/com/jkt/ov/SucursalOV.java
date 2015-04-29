package com.jkt.ov;

import lombok.Data;

import com.jkt.erp.varios.ClienteSucursal;

/**
 * ObjectView que representa a la entidad {@link ClienteSucursal}
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class SucursalOV extends DescriptibleOV {

	private String descripcionCompleta;
	
	@Override
	public String getCampoClave() {
		return "numero";
	}
	
}
