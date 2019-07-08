package com.neusoft.web.impl;

public final class PlayBetServlet extends BetControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("insertBetLog","Ѻע");
		return "queryBet";
	}
}
