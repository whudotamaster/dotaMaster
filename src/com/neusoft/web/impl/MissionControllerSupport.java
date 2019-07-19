package com.neusoft.web.impl;

import com.neusoft.services.impl.Ab10ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class MissionControllerSupport extends ControllerSupport 
{
	public MissionControllerSupport()
	{
		this.setServices(new Ab10ServicesImpl());
	}
}
