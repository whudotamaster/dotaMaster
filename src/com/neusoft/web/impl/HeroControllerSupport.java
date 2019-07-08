package com.neusoft.web.impl;

import com.neusoft.services.impl.Ac01ServicesImpl;
import com.neusoft.web.support.ControllerSupportForAc01;

public abstract class HeroControllerSupport extends ControllerSupportForAc01 {

	public HeroControllerSupport() 
	{
		this.setServices(new Ac01ServicesImpl());
	}

	

}
