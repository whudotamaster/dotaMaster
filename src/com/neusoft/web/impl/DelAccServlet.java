package com.neusoft.web.impl;

public class DelAccServlet  extends AccControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelAcc", "ɾ��");
	    this.savePageDataForDelete();
		return "queryAcc";
	}

}
