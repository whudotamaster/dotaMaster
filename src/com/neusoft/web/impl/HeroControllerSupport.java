package com.neusoft.web.impl;
import com.neusoft.services.impl.Ac01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;
public abstract class HeroControllerSupport extends ControllerSupport
{

	public HeroControllerSupport() 
	{
		this.setServices(new Ac01ServicesImpl());
	}

	

}
