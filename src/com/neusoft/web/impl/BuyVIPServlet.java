package com.neusoft.web.impl;


public class BuyVIPServlet extends UserControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("buyVIP", "����", "����ɹ�,��Ա����ʱ��Ϊ", "aab109");
		return "updatePersonInfo";
	}

}
