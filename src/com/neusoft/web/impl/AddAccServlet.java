package com.neusoft.web.impl;

public class AddAccServlet extends AccControllerSupport {


	@Override
	public String execute() throws Exception 
	{
		this.update("addAcc", "���", "��ӳɹ�������ƷΪ��", "aac602");
		return "addAcc";
	}

}
