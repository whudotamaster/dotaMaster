package com.neusoft.web.impl;


public class BuyVIPServlet extends UserControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("buyVIP");
		return "updatePersonInfo";
	}

}
