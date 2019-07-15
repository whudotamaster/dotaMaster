package com.neusoft.web.impl;

public final class QueryGetAccServlet extends GetAccControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "adminQueryGet";
	}
}
