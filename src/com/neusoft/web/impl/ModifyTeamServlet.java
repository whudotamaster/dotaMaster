package com.neusoft.web.impl;

public class ModifyTeamServlet extends TeamControllerSupport {


	@Override
	public String execute() throws Exception
	{
		this.update("modifyTeam", "�޸�");
		this.savePageData("FBIforMore");
		return "readTeam";
	}

}
