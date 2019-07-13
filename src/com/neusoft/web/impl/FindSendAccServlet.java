package com.neusoft.web.impl;

public class FindSendAccServlet extends SendAccControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "buyAcc";
	}

}
