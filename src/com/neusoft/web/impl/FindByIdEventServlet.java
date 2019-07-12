package com.neusoft.web.impl;

public class FindByIdEventServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception
	{
		this.savePageData("FBIforMore");
		return "readEvent";
	}

}
