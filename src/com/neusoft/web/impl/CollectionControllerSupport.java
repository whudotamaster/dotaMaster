package com.neusoft.web.impl;

import com.neusoft.services.impl.Ab07ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class CollectionControllerSupport extends ControllerSupport
{
	public CollectionControllerSupport() 
	{
		this.setServices(new Ab07ServicesImpl());
	}

}
