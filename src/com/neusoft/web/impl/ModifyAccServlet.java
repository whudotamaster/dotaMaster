package com.neusoft.web.impl;

public class ModifyAccServlet extends AccControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("modifyAcc", "ÐÞ¸Ä");
		return "readAcc";
	}

}
