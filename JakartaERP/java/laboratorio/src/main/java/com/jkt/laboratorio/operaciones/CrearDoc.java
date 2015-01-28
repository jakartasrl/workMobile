package com.jkt.laboratorio.operaciones;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.dynamicreports.jasper.builder.JasperReportBuilder;
import net.sf.dynamicreports.report.builder.DynamicReports;
import net.sf.dynamicreports.report.builder.column.Columns;
import net.sf.dynamicreports.report.builder.component.Components;
import net.sf.dynamicreports.report.builder.datatype.DataTypes;
import net.sf.dynamicreports.report.constant.HorizontalAlignment;
import net.sf.dynamicreports.report.exception.DRException;

import com.jkt.dominio.Comprobante;
import com.jkt.dominio.ComprobanteCliente;
import com.jkt.dominio.PersistentEntity;
import com.jkt.operaciones.Operation;

public class CrearDoc extends Operation implements CrearReporte {
	ComprobanteCliente c = new ComprobanteCliente();
	// String path = "c:\\";

	List<PersistentEntity> comprobantes = new ArrayList<PersistentEntity>();

	public void crear() {

		JasperReportBuilder report = DynamicReports.report();

		report.columns(
				Columns.column("Numero de Comprobante", "nro", DataTypes.stringType()))
				.title(Components.text("Reporte Comprobantes")
				.setHorizontalAlignment(HorizontalAlignment.CENTER))
				.pageFooter(Components.pageXofY())
				.setDataSource(comprobantes); //Datasource
		try {

			String nombreArchivo = generarNombreDeArchivo();

			OutputStream outputStream = new FileOutputStream("c:/decode2/" + nombreArchivo + ".pdf");
			
			report.toPdf(outputStream);
			outputStream.close();

		} catch (DRException e) {
			e.printStackTrace();
		}

		//
		// report = DynamicReports.report();
		// List<PersistentEntity> items=new ArrayList<PersistentEntity>();
		// // try {
		// items = obtenerTodos(ComprobanteVentaDet.class);
		//
		// } catch (Exception e1) {
		// e1.printStackTrace();
		// }
		catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// // report.columns(
		// //// Columns.column("ID","id",DataTypes.stringType()),
		// //
		// Columns.column("Descripcion","descripcion",DataTypes.stringType()),
		// // Columns.column("Cantidad","cantidad",DataTypes.integerType())
		// // )
		// // .title(Components.text("Reporte Items")
		// // .setHorizontalAlignment(HorizontalAlignment.CENTER))
		// // .pageFooter(Components.pageXofY())
		// //
		// // .setDataSource(items);
		//
		// // try {
		// //// report.show();
		// // } catch (DRException e) {
		// // e.printStackTrace();
		// // }

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
		this.crear();
	}

}
