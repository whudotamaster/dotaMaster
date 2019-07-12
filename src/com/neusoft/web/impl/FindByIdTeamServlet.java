package com.neusoft.web.impl;

public class FindByIdTeamServlet extends TeamControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.savePageData("FBIforMore");
		return "readTeam";
	}

}
