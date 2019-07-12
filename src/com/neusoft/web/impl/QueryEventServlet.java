package com.neusoft.web.impl;

public class QueryEventServlet extends EventControllerSupport {


	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		return "queryEvent";
	}

}
