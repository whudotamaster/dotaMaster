package com.neusoft.web.impl;

public class QueryMatchServlet extends MatchControllerSupport {


	@Override
	public String execute() throws Exception
	{
		this.query("queryMatch");
		return "queryMatch";
	}

}
