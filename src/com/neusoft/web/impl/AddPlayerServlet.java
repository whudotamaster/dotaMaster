package com.neusoft.web.impl;

public class AddPlayerServlet extends PlayerControllerSupport {

	

	@Override
	public String execute() throws Exception 
	{
		this.update("addPlayer", "���", "��ӳɹ�����ѡ��Ϊ", "aac1002");
		return "addPlayer";
	}

}
