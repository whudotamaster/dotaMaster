package com.neusoft.web.impl;

public class QueryAccServlet extends AccControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		return "queryAcc";
	}

}
