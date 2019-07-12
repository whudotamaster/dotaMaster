package com.neusoft.web.impl;

import com.neusoft.services.impl.Ac10ServicesImp;
import com.neusoft.web.support.ControllerSupport;

public abstract class PlayerControllerSupport extends ControllerSupport {

	public PlayerControllerSupport()
	{
		this.setServices(new Ac10ServicesImp());
	
	}


}
