package com.jkt.ov.grid;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.zkoss.zul.Column;
import org.zkoss.zul.Columns;
import org.zkoss.zul.Grid;
import org.zkoss.zul.Hlayout;
import org.zkoss.zul.Label;
import org.zkoss.zul.Row;
import org.zkoss.zul.Rows;
import com.jkt.laboratorio.dominio.ProtocoloEstadistica;

public class GeneradorGrilla {
	
	Hlayout  panel = new Hlayout ();
	Grid grid = new Grid();
	Columns columns = new Columns();
	Rows rows = new Rows();

	List<ProtocoloEstadistica> lsProtocoloEstadistica = new ArrayList<ProtocoloEstadistica>();
	
	List<String> filas = new ArrayList<String>();
	List<String> columnas = new ArrayList<String>();
	
	String[][] mat;
	
	public GeneradorGrilla(Hlayout panel, List<ProtocoloEstadistica> lsProtocoloEstadistica){
		this.panel = panel;		
		this.lsProtocoloEstadistica = lsProtocoloEstadistica;
	}
		
	public void generar() {
		this.generarColumnas();
		this.generarFilas();
		this.generarMatriz();
		this.grabarDatos();
	}

	private void grabarDatos() {
		
		for(int i = 0; i < mat.length; i++){
			
			Row row = new Row();
		
			for(int j = 0; j < mat[i].length; j++){
				
				if (i == 0){
					Column column = new Column();
					column.setLabel(mat[i][j]==null?"":mat[i][j]);
					columns.appendChild(column);
				}
				
				if (i > 0){
					Label label = new Label();
					label.setValue(mat[i][j]);
					label.setWidth("100%");
					row.appendChild(label);
		
				}
				
			}
			
			rows.appendChild(row);
			
		}
		
		grid.appendChild(columns);
		grid.appendChild(rows);
		this.panel.appendChild(this.grid);
		
	}

	private void generarMatriz() {
				
		mat = new String[this.filas.size()+1][this.columnas.size()+1];
		
		//Generamos el encabezado y columna de determinaciones
		for(int i = 0; i < mat.length; i++){
			for(int j = 0; j < mat[i].length; j++){
				if (j == 0 && i > 0){ //Ingresamos la columna de las determinaciones 
					mat[i][j] = this.filas.get(i-1);
				}
				if (i == 0 && j > 0){ //Ingresamos las fila de las fechas 
					mat[i][j] = this.columnas.get(j-1);
				}
				
			}
			
		}
		
		//Insertamos los valores
		for(int i = 0; i < mat.length; i++){
			for(int j = 0; j < mat[i].length; j++){
				if (i > 0 && j > 0){
					mat[i][j] = insertarValor(i,j);
				}
			}
			
		}

	}

	private String insertarValor(int i, int j) {
		String valor = null;
		for(ProtocoloEstadistica protEst : this.lsProtocoloEstadistica){
			DateFormat df =  DateFormat.getDateInstance();
			String fechaFormateada =  df.format(protEst.getFechaCreacion());
			if (this.mat[i][0].equals(protEst.getDescDeterminacion()) && this.mat[0][j].equals(fechaFormateada)){
				valor = String.valueOf(protEst.getResultadoExpresion());
			}
		}
		
		return valor;
		
	}

	private void generarFilas() {
		
		Set<String> setFilas = new HashSet<String>();
		
		for(ProtocoloEstadistica protEst : this.lsProtocoloEstadistica){
			setFilas.add(protEst.getDescDeterminacion());
		}
		
		this.filas.addAll(setFilas);
		
		Collections.sort(this.filas, new Comparator() {

			@Override
			public int compare(Object arg0, Object arg1) {
				String det1, det2;
				det1 = (String) arg0;
				det2 = (String) arg1;
				return det1.compareTo(det2);

			}
		});
		
	}

	private void generarColumnas() {
		
		Set<String> setColumnas = new HashSet<String>();
		
		for(ProtocoloEstadistica protEst : this.lsProtocoloEstadistica){
			DateFormat df =  DateFormat.getDateInstance();
			String fechaFormateada =  df.format(protEst.getFechaCreacion());
			setColumnas.add(fechaFormateada);
		}
		
		this.columnas.addAll(setColumnas);
		
		Collections.sort(this.columnas, new Comparator() {

			@Override
			public int compare(Object arg0, Object arg1) {
				String det1, det2;
				det1 = (String) arg0;
				det2 = (String) arg1;
				return det1.compareTo(det2);

			}
		});
		
	}
	
}
