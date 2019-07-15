package com.neusoft.web.impl;

import com.neusoft.services.impl.Ac12ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ChangelogControllerSupport extends ControllerSupport
{

	public ChangelogControllerSupport()
	{
		this.setServices(new Ac12ServicesImpl());
	}


}
