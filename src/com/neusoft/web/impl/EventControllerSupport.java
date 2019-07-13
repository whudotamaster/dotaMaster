package com.neusoft.web.impl;

import com.neusoft.services.impl.Ac07ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EventControllerSupport extends ControllerSupport 
{
	public EventControllerSupport()
	{
		this.setServices(new Ac07ServicesImpl());
	}
}
