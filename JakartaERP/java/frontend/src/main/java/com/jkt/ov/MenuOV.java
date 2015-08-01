package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class MenuOV extends ObjectView {

	private String name;
	private String img;
	private String size;
	private String theme;
	private String link;
	private String type;
	private String url=StringUtils.EMPTY;
	
	private String orden;
	private String vm;
	
	
	
}
