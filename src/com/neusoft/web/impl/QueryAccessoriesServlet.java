package com.neusoft.web.impl;

public class QueryAccessoriesServlet extends AccControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.query("query");
		return "queryAcc";
	}

}
