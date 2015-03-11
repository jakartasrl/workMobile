package com.jkt.common;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.NotifyChange;

public class ErrorVM {

	public Boolean showDetails=Boolean.FALSE;

	public Boolean getShowDetails() {
		return showDetails;
	}

	public void setShowDetails(Boolean showDetails) {
		this.showDetails = showDetails;
	}

	@NotifyChange("showDetails")
	@Command
	public void changeDetails(){
		showDetails=!showDetails;
	}
}
