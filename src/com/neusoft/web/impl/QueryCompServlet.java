package com.neusoft.web.impl;

public final class QueryCompServlet extends CompControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "announceResult";
	}
}
