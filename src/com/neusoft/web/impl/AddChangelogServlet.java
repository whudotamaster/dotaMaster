package com.neusoft.web.impl;

public class AddChangelogServlet extends ChangelogControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("addChangelog", "���", "��ӳɹ����ø�����־�汾��Ϊ��", "aac1202");
		return "addChangelog";
	}

}
