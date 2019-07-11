package com.neusoft.web.impl;

public final class QueryOrderServlet extends UserControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData("buy");
		return "queryOrder";
	}
}
