package com.neusoft.web.impl;

public class FindForBuyAccServlet extends AccControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "buyAcc";
	}

}
