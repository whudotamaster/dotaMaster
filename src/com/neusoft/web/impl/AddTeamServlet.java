package com.neusoft.web.impl;

public class AddTeamServlet extends TeamControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("addTeam", "���", "��ӳɹ�����ս��Ϊ��", "aac902");
		return "addTeam";
	}

}
