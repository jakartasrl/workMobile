package com.jkt.common;

import com.jkt.viewModels.HelperVM;

public interface Closure {

	HelperVM getHelpVM();
	void ejecutarAcciones();
	void setVM(HelperVM helper);

}
