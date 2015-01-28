package com.jkt.laboratorio.operaciones;

public abstract class FabricaReportes {

	public static CrearReporte getReporte(String criteria) {
		if (criteria.equals("pdf"))
			return new TipoPdf();
		else if (criteria.equals("doc"))
			return new CrearDoc();
		else if (criteria.equals("html"))
			return new TipoHtml();

		return null;
	}
}
