package com.neusoft.web.impl;

public class AddTeamServlet extends TeamControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("addTeam", "添加", "添加成功，该战队为：", "aac902");
		return "addTeam";
	}

}
