package com.neusoft.web.impl;

public class ModifyEventServlet extends EventControllerSupport {
	@Override
	public String execute() throws Exception
	{
		
	    this.update("modifyEvent", "ÐÞ¸Ä");
		return "modifyEvent";
	}

}
