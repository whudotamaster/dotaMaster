package com.neusoft.web.impl;

public class QueryTeamServlet extends TeamControllerSupport {


	@Override
	public String execute() throws Exception
	{
		this.query("query");
		return "queryTeam";
	}

}
