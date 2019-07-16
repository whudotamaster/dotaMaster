package com.neusoft.web.impl;

import com.neusoft.services.impl.Ad06ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class NoticeControllerSupport extends ControllerSupport 
{
	public NoticeControllerSupport()
	{
		this.setServices(new Ad06ServicesImpl());
	}
}
