package com.neusoft.web.impl;

import com.neusoft.services.impl.Ad03ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class GetAccControllerSupport extends ControllerSupport
{
	public GetAccControllerSupport() 
	{
		this.setServices(new Ad03ServicesImpl());
	}
}
