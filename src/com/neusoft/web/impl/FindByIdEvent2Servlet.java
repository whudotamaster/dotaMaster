package com.neusoft.web.impl;

public class FindByIdEvent2Servlet extends EventControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();	
		return "modifyEvent";
	}

}
