package com.neusoft.web.impl;

public class ModifySendAccServlet extends SendAccControllerSupport 
{
	@Override
	public String execute() throws Exception {
		this.update("sendDelivery", "ÐÞ¸Ä");
		return "adminQuerySend";
	}
}
