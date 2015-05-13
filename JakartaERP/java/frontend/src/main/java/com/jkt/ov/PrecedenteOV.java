package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class PrecedenteOV extends DescriptibleOV {

	private List<DescriptibleOV> precedentes = new ArrayList<DescriptibleOV>();
	
}
