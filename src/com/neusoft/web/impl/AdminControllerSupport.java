package com.neusoft.web.impl;


import com.neusoft.services.impl.AdminImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class AdminControllerSupport extends ControllerSupport 
{
	public AdminControllerSupport()
	{
		this.setServices(new AdminImpl());
	}
}
