package com.neusoft.web.impl;

import com.neusoft.services.impl.Ad05ServicesImpl;
import com.neusoft.web.support.ControllerSupport;


//Í¶ËßÒµÎñ
public abstract class ComplainControllerSupport extends ControllerSupport
{
	public ComplainControllerSupport()
	{
		this.setServices(new Ad05ServicesImpl());
	}

}
