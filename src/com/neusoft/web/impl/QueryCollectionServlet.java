package com.neusoft.web.impl;

public final class QueryCollectionServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.collectionOnLoad();
		return "queryCollection";
	}
}
