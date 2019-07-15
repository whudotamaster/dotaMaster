package com.neusoft.web.impl;

public final class AddCollectionByIdServlet extends CollectionControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addCollectionById");
		this.postOnLoad();
		return "post";
	}
}
