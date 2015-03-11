package com.jkt.view;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;


public class ContainerOV {
	
	private Map<String, Object> map=new  HashMap<String, Object>();
	
	public <T extends ObjectView> void put(String key,T value){
		map.put(key, value);
	}
	
	public void remove(String key){
		map.remove(key);
	}
	
	public Set<String> keySet(){
		return map.keySet();
	}
	
	@SuppressWarnings("unchecked")
	public <T extends ObjectView> T get(String key){
		return (T) map.get(key);
	}
}
