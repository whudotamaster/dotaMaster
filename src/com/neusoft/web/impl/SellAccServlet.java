package com.neusoft.web.impl;
public class SellAccServlet extends AccControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("sellAccessories", "����");
		return "adminQueryGet";
	}

}
