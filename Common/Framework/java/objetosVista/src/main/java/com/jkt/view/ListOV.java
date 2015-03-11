package com.jkt.view;

import java.util.List;

@SuppressWarnings("unchecked")
public abstract class ListOV {
	
	@SuppressWarnings("rawtypes")
	public abstract List getList();
	
	
	public void add(Object object){
		getList().add(object);
	}
	
	public void remove(Object object){
		getList().remove(object);
	}

	public int size(){
		return getList().size();
	}

	public void clear(){
		getList().clear();
	}
	public Boolean isEmpty(){
		return getList()==null ? false : getList().isEmpty();
	}
}