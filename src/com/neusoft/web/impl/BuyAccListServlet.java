package com.neusoft.web.impl;


public class BuyAccListServlet extends AccControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("buyAccessoriesList", "����");
		return "adminQuerySend";
	}

}
