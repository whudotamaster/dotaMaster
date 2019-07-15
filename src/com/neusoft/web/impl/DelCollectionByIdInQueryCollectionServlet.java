package com.neusoft.web.impl;
public final class DelCollectionByIdInQueryCollectionServlet extends CollectionControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delCollectionById", "É¾³ýÊÕ²Ø");
		this.collectionOnLoad();
		return "queryCollection";
	}
}
