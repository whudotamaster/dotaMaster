package com.neusoft.web.impl;

public class ModifyGetAccServlet extends GetAccControllerSupport 
{
	@Override
	public String execute() throws Exception {
		this.update("checkDelSuccess", "�ջ�");
		this.savePageDataForDelete();
		return "adminQueryGet";
	}
}
