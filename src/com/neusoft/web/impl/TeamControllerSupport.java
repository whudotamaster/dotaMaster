package com.neusoft.web.impl;

import com.neusoft.services.impl.Ac09ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class TeamControllerSupport extends ControllerSupport {

	public TeamControllerSupport() 
	{
		this.setServices(new Ac09ServicesImpl());
	}

}
