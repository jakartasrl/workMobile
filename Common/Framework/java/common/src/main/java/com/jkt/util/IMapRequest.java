package com.jkt.util;

import java.io.Serializable;


/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2003
 * Company:
 * @author
 * @version 1.0
 */

public interface IMapRequest extends Serializable {
	public Object put(Object aKey, Object aValue);
	
}