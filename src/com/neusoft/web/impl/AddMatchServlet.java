package com.neusoft.web.impl;

public class AddMatchServlet extends MatchControllerSupport {



	@Override
	public String execute() throws Exception
	{
		this.update("addMatch", "���", "��ӱ����ɹ�,�ñ�����ʼʱ��Ϊ��", "aac1102");
		return "addMatch";
	}

}
