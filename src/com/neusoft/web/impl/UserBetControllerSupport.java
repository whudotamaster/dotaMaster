package com.neusoft.web.impl;

import com.neusoft.services.impl.Ad02ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class UserBetControllerSupport extends ControllerSupport
{
	public UserBetControllerSupport() 
	{
		this.setServices(new Ad02ServicesImpl());
	}
}
