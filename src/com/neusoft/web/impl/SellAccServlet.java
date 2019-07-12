package com.neusoft.web.impl;
public class SellAccServlet extends AccControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("sellAccessories", "³öÊÛ");
		return "adminQueryGet";
	}

}
