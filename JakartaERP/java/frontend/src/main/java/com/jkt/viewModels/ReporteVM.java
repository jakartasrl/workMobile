package com.jkt.viewModels;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import lombok.Data;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ContextParam;
import org.zkoss.bind.annotation.ContextType;
import org.zkoss.bind.annotation.Init;
import org.zkoss.io.Files;
import org.zkoss.util.media.Media;
import org.zkoss.zk.ui.Component;
import org.zkoss.zul.Column;
import org.zkoss.zul.Columns;
import org.zkoss.zul.Grid;
import org.zkoss.zul.Label;
import org.zkoss.zul.Row;
import org.zkoss.zul.Rows;

@Data
public class ReporteVM {

	private Object target;
	private String codigo;

	@Command
	public void dale() {
		System.out.println();
	}

	@Init
	public void init(@ContextParam(ContextType.COMPONENT) Component component,
			@ContextParam(ContextType.VIEW) Component view) {
		view.getId();

		Component grid = new Grid();

		Component columna = new Column();
		columna.setAttribute("value", "Dale Leo");
		columna.setAttribute("label", "Dale Leo");

		Columns columns = new Columns();
		columns.appendChild(columna);

		Label label = new Label();
		label.setAttribute("value", "dale");
		label.setValue("deasdasd");
		label.setWidth("150px");
		label.setHeight("250px;");
		label.setAttribute("onClick", "@command('dale')");

		Component rows = new Rows();

		Component row = new Row();
		row.setAttribute("value", "codigo");
		row.setAttribute("label", "codigo");
		row.appendChild(label);

		Component row2 = new Row();
		row.setAttribute("value", "codigo3");
		row.setAttribute("label", "codigo3");
		row2.appendChild(label);

		Component row3 = new Row();
		row.setAttribute("value", "codigo2");
		row.setAttribute("label", "codigo2");
		row3.appendChild(label);

		rows.appendChild(row);
		rows.appendChild(row3);
		rows.appendChild(row2);

		grid.appendChild(columns);
		grid.appendChild(rows);
		view.appendChild(grid);

	}

	@Command
	public void comando() {
		System.out.println();
	}

	@Command
	public void subir(@BindingParam("evento") Media media) throws IOException {
		@SuppressWarnings("unused")
		String format = media.getFormat();

		if (media.isBinary()) {
			Files.copy(new File("c:\\tmp\\tmp." + media.getFormat()),
					media.getStreamData());
		} else {
			BufferedWriter writer = new BufferedWriter(new FileWriter(
					"c:\\tmp\\tmp." + media.getFormat()));
			Files.copy(writer, media.getReaderData());
		}

	}
}
