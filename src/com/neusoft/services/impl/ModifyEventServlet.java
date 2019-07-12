package com.neusoft.services.impl;

import com.neusoft.web.impl.EventControllerSupport;

public class ModifyEventServlet extends EventControllerSupport {
	@Override
	public String execute() throws Exception
	{
		this.update("modifyEvent", "ÐÞ¸Ä");
		return "modifyEvent";
	}

}
