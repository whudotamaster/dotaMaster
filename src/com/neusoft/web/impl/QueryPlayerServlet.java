package com.neusoft.web.impl;

public class QueryPlayerServlet extends PlayerControllerSupport {


	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryPlayer";
	}

}
