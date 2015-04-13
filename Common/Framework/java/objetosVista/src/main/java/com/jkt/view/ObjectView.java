package com.jkt.view;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of={"id"})
public abstract class ObjectView implements Serializable {
	private long id;
	private String nameOV;// Key para cando tenga mas de 2 input/envie 2 OV para una misma operacion
	private Boolean activo;

}
