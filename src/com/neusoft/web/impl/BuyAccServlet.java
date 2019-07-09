package com.neusoft.web.impl;


public class BuyAccServlet extends AccControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("buyAccessories", "¹ºÂò");
		return "queryBet";
	}

}
