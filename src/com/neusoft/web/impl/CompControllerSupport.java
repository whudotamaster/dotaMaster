package com.neusoft.web.impl;

import com.neusoft.services.impl.Ac11ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class CompControllerSupport extends ControllerSupport
{
	public CompControllerSupport() 
	{
		this.setServices(new Ac11ServicesImpl());
	}
}
