package com.neusoft.web.impl;

import com.neusoft.services.impl.Ac11ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class MatchControllerSupport extends ControllerSupport {

	public MatchControllerSupport()
	{
		this.setServices(new Ac11ServicesImpl());
	}

}
