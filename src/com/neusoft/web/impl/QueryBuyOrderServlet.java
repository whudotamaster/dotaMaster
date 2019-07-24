package com.neusoft.web.impl;

public final class QueryBuyOrderServlet extends UserControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.query("queryBuyOrder");
		return "adminQuerySend";
	}
}
