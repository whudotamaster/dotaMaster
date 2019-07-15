package com.neusoft.web.impl;

import com.neusoft.services.impl.Ad01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class BetControllerSupport extends ControllerSupport
{
	public BetControllerSupport() 
	{
		this.setServices(new Ad01ServicesImpl());
	}
}
