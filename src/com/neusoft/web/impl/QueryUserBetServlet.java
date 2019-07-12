package com.neusoft.web.impl;

public final class QueryUserBetServlet extends UserBetControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryUserBet";
	}
}
