package com.neusoft.web.impl;

import com.neusoft.services.impl.Ab08ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ArticleControllerSupport extends ControllerSupport 
{
	public ArticleControllerSupport()
	{
		this.setServices(new Ab08ServicesImpl());
	}
}
