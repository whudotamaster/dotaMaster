package com.neusoft.web.impl;

public final class QuerySendAccServlet extends SendAccControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "adminQuerySend";
	}
}
