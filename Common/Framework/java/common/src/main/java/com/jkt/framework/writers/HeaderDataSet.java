package com.jkt.framework.writers;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class HeaderDataSet implements IHeaderDataSet  {
	
	private String nombreTable;
	private StringBuffer titCampos = new StringBuffer();

	
	public void setNombreTabla(String aNombreTable) {
		this.nombreTable = aNombreTable;
	}
	
	private class Campo {
		public String nombre;
		public String tipo;
		public int longitud;
		
		public Campo(String aNombre,String aTipo,int aLongitud) {
			nombre = aNombre;
			tipo = aTipo;
			longitud = aLongitud;
		}
	}
	
	private List listaCampos = new ArrayList();
	
	public void addCampo(String nombre,String tipo,int longitud) {
		listaCampos.add(new Campo(nombre,tipo,longitud));
	}
	
	private String getDefCampo(Campo campo) {
		
		int longitud = 0;
		int longInterna = 0;
		if (campo.tipo.equals(IHeaderDataSet.STRING)) {
			longitud = campo.longitud;
			longInterna = campo.longitud;
		} else
			if ((campo.tipo.equals(IHeaderDataSet.STRING)) ||
					(campo.tipo.equals(IHeaderDataSet.DATE)) ||
					(campo.tipo.equals(IHeaderDataSet.CURRENCY)))
			{
				longitud = 0;
				longInterna = 10;
			} else
				if (campo.tipo.equals(IHeaderDataSet.BYTES)) {
					longitud = 20;
					longInterna = 10;
				} else
					if (campo.tipo.equals(IHeaderDataSet.BOOLEAN)) {
						longitud = 0;
						longInterna = 5;
					}
		
		
		return "\""+campo.nombre+"="+campo.tipo+","+longitud+",\"\""+campo.nombre+"\"\","+"\"\"\"\""+","+longInterna+",Data,"+"\"\"\"\"\n";
	}
	
	public String toString() {
		StringBuffer cabecera = new StringBuffer("\"@@FILE VERSION@@\",\"251\""+nombreTable+",\n\"@@TABLEDEF START@@\"\n");
		
		Iterator iterCampos = listaCampos.iterator();
		while (iterCampos.hasNext()) {
			Campo campo = (Campo)iterCampos.next();
			cabecera.append(getDefCampo(campo));
			titCampos.append("\""+campo.nombre+"\""+",");
		}
		
		cabecera.append("\"@@TABLEDEF END@@\"\n");
//		cabecera.append(titCampos);
		
		return cabecera.toString();
	}
	
	public String getTipoCampo(String aCampo){
		String res = "";
		Iterator iterCampos = listaCampos.iterator();
		while (iterCampos.hasNext()) {
			Campo campo = (Campo)iterCampos.next();
			if (campo.nombre.equalsIgnoreCase(aCampo)){
				res = campo.tipo;
			}
		}
		return res;
	}
	
	public String getTituloCampos(){
		return titCampos.toString();
	}
}