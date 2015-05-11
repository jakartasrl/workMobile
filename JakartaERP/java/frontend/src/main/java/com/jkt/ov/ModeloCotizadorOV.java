package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=true)
public class ModeloCotizadorOV extends DescriptibleOV{
	
	private List<TituloModeloCotizadorOV> titulos=new ArrayList<TituloModeloCotizadorOV>();
	
}
