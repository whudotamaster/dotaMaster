package com.neusoft.web.impl;

import com.neusoft.services.impl.Ab11ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class LikeControllerSupport extends ControllerSupport 
{
	public LikeControllerSupport()
	{
		this.setServices(new Ab11ServicesImpl());
	}
}
