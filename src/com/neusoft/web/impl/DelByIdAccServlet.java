package com.neusoft.web.impl;

public class DelByIdAccServlet extends AccControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delByIdAcc", "ɾ��");
		this.savePageDataForDelete();
		return "queryAcc";
	}

}
