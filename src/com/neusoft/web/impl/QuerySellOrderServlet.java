package com.neusoft.web.impl;

public final class QuerySellOrderServlet extends UserControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData("sell");
		return "adminQueryGet";
	}
}
