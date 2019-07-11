package com.neusoft.web.impl;

import com.neusoft.services.impl.Ac06ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class AccControllerSupport extends ControllerSupport 
{
	public AccControllerSupport()
	{
		this.setServices(new Ac06ServicesImpl());
	}
}
