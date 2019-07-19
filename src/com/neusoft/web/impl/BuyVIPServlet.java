package com.neusoft.web.impl;


public class BuyVIPServlet extends UserControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("buyVIP", "购买", "购买成功,会员到期时间为", "aab109");
		return "updatePersonInfo";
	}

}
