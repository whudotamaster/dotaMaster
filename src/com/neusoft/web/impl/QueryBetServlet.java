package com.neusoft.web.impl;

public final class QueryBetServlet extends BetControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		System.out.println("������BetServlet");
		return "queryBet";
	}
}
