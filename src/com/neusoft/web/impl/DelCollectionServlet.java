package com.neusoft.web.impl;
public final class DelCollectionServlet extends CollectionControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delCollection", "�ղ�");
		this.query("queryCollectionList");
		return "queryCollection";
	}
}
