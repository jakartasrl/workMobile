package com.jkt.laboratorio.operaciones;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.dynamicreports.examples.Templates;
import net.sf.dynamicreports.jasper.builder.JasperReportBuilder;
import net.sf.dynamicreports.report.builder.DynamicReports;
import net.sf.dynamicreports.report.builder.column.Columns;
import net.sf.dynamicreports.report.builder.component.Components;
import net.sf.dynamicreports.report.builder.crosstab.CrosstabBuilder;
import net.sf.dynamicreports.report.builder.datatype.DataTypes;
import net.sf.dynamicreports.report.constant.HorizontalAlignment;
import net.sf.dynamicreports.report.datasource.DRDataSource;
import net.sf.dynamicreports.report.exception.DRException;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;

import com.jkt.dominio.Comprobante;
import com.jkt.dominio.ComprobanteCliente;
import com.jkt.dominio.PersistentEntity;
import com.jkt.operaciones.Operation;

public class CrearDoc extends Operation implements CrearReporte {

	public void crear() throws FileNotFoundException, IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		
		
	}
	
	
	
	
	
	/*
	
	ComprobanteCliente c = new ComprobanteCliente();

	List<PersistentEntity> comprobantes = new ArrayList<PersistentEntity>();

	public void crearDesdeTemplate() throws IOException {
//		InputStream is = new FileInputStream("C:\\decode2\\empty.jrxml");
		InputStream is = CrearDoc.class.getResourceAsStream("presupuesto1.jrxml");
		
		try {
			
			JasperReportBuilder report = DynamicReports.report();
			report.setTemplateDesign(is);
//			report.setTemplate(Templates.reportTemplate);
			

			
			//			report.columns(
//						Columns.column("Item", "uno", DataTypes.stringType()),
//						Columns.column("Item2", "dos", DataTypes.stringType()),
//						Columns.column("Item66", "tres", DataTypes.stringType())
//					);
//			
//			report.setDataSource(createDataSource());
			report.setDataSource(new JREmptyDataSource(10));
			
			String nombreArchivo = generarNombreDeArchivo();

			OutputStream outputStream = new FileOutputStream("c:/decode2/" + nombreArchivo + ".pdf");

			report.toPdf(outputStream);
			outputStream.close();
//
		} catch (DRException e) {
			e.printStackTrace();
		}

	}

	public void crear() {

		JasperReportBuilder report = DynamicReports.report();

		report.columns(
				Columns.column("Numero de Comprobante", "nro",
						DataTypes.stringType()))
				.title(Components.text("Reporte Comprobantes")
						.setHorizontalAlignment(HorizontalAlignment.CENTER))
				.pageFooter(Components.pageXofY()).setDataSource(comprobantes); // Datasource
		try {

			String nombreArchivo = generarNombreDeArchivo();
			OutputStream outputStream = new FileOutputStream("c:/decode2/"
					+ nombreArchivo + ".pdf");
			report.toPdf(outputStream);
			outputStream.close();

		} catch (DRException e) {
			e.printStackTrace();
		}

		catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private String generarNombreDeArchivo() {
		Date date = new Date();
		String nombreArchivo = "comprobante".concat("_").concat(date.toString());
		nombreArchivo = nombreArchivo.replace(" ", "_").replace(":", "_");
		return nombreArchivo;
	}

	@Override
	public void execute(Map<String, Object> arg0) throws Exception {
		comprobantes = obtenerTodos(Comprobante.class);
		this.crearDesdeTemplate();
	}
	
	private JRDataSource createDataSource() {
		DRDataSource dataSource = new DRDataSource("uno", "dos", "tres");
		dataSource.add("Notebook", "1", "new BigDecimal(500)");
		dataSource.add("DVD", "5", "new BigDecimal(30)");
		return dataSource;
	}

*/
}
