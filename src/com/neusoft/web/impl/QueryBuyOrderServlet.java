package com.neusoft.web.impl;

public final class QueryBuyOrderServlet extends UserControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData("buy");
		return "adminQuerySend";
	}
}
