package com.neusoft.web.impl;

public class DelPlayerServlet extends PlayerControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelPlayer", "ɾ��");
		this.savePageDataForDelete();
		return "queryPlayer";
	}

}
