package com.neusoft.web.impl;

public class ModifySendAccServlet extends SendAccControllerSupport 
{
	@Override
	public String execute() throws Exception {
		this.update("sendDelivery", "�޸�");
		this.savePageDataForDelete();
		return "adminQuerySend";
	}
}
