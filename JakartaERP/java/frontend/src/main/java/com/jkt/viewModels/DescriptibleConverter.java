package com.jkt.viewModels;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.zkoss.bind.BindContext;
import org.zkoss.bind.Converter;
import org.zkoss.zk.ui.Component;
import org.zkoss.zul.Combobox;

import com.jkt.ov.DescriptibleOV;

@SuppressWarnings({"rawtypes"})
public class DescriptibleConverter implements Converter {
	
	private Map<Long,String> map = new HashMap<Long,String>();
	
	public DescriptibleConverter(List<DescriptibleOV> listDescriptible) {
		for (DescriptibleOV descOV : listDescriptible) {
			map.put(descOV.getId(), descOV.getDescripcion());
		}
	}

	@Override
	public Object coerceToUi(Object val, Component comp, BindContext ctx) {
		Combobox box = (Combobox) comp;
		if (box.getSelectedItem() == null) {
			if (val != null && map.get(val)!=null) {
				return map.get(val);
			}
			return null;
		} else {
			return box.getSelectedItem().getLabel();
		}
	}

	@Override
	public Object coerceToBean(Object val, Component comp, BindContext ctx) {

		Combobox box = (Combobox) comp;

		if (box.getSelectedItem() == null)
			return val;
		else
			return box.getSelectedItem().getValue();
	}

}
