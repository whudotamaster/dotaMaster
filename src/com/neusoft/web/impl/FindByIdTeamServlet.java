package com.neusoft.web.impl;

public class FindByIdTeamServlet extends TeamControllerSupport 
{
	@Override
	public String execute() throws Exception
	{

		this.savePageInstance();
		return "readTeam";
	}

}
