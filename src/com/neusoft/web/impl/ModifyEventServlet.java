package com.neusoft.web.impl;

public class ModifyEventServlet extends EventControllerSupport {
	@Override
	public String execute() throws Exception
	{
		
	    this.update("modifyEvent", "�޸�");
		return "modifyEvent";
	}

}
