package com.neusoft.web.impl;

import com.neusoft.services.impl.Ab08ServicesImpl;
import com.neusoft.web.support.ControllerSupportForAb08;

public abstract class ArticleControllerSupport extends ControllerSupportForAb08 {

	public ArticleControllerSupport()
	{

		this.setServices(new Ab08ServicesImpl());
	}

	

}
