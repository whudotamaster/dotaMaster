package com.neusoft.web.impl;

public final class DelCollectionByIdServlet extends CollectionControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delCollectionById", "ɾ���ղ�");
		this.postOnLoad();
		return "post";
	}
}
