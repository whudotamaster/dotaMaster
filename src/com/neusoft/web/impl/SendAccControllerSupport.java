package com.neusoft.web.impl;

import com.neusoft.services.impl.Ad04ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class SendAccControllerSupport extends ControllerSupport
{
	public SendAccControllerSupport() 
	{
		this.setServices(new Ad04ServicesImpl());
	}
}
