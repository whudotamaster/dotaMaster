package com.neusoft.web.impl;

public class FindForSellAccServlet extends AccControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "sellAcc";
	}

}
