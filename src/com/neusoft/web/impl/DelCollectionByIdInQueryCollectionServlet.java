package com.neusoft.web.impl;
public final class DelCollectionByIdInQueryCollectionServlet extends CollectionControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delCollectionById", "ɾ���ղ�");
		this.query("queryCollectionList");
		return "queryCollection";
	}
}
