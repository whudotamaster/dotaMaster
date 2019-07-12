package com.neusoft.web.impl;

import com.neusoft.services.impl.Ac05ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EquipmentControllerSupport extends ControllerSupport {

	public EquipmentControllerSupport() 
	{
		this.setServices(new Ac05ServicesImpl());
	}


}
