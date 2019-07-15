package com.neusoft.web.impl;

public final class DelCollectionByIdServlet extends CollectionControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delCollectionById", "É¾³ýÊÕ²Ø");
		this.postOnLoad();
		return "post";
	}
}
