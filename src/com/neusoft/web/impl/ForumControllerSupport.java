package com.neusoft.web.impl;

import com.neusoft.services.impl.Ab05ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ForumControllerSupport extends ControllerSupport
{
	public ForumControllerSupport() 
	{
		this.setServices(new Ab05ServicesImpl());
	}
}
