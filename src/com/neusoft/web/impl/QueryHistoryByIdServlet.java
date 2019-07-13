package com.neusoft.web.impl;

public class QueryHistoryByIdServlet extends ForumControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.queryHistoryOnLoad();
		return "queryHistoryPost";
	}

}
