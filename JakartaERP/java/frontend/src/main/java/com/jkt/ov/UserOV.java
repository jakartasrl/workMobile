package com.jkt.ov;

import groovy.transform.EqualsAndHashCode;
import lombok.Data;

import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode(callSuper=true)
public class UserOV extends ObjectView {

	private String name;
	private String lastName;
	
}
