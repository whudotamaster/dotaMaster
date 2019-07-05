package com.neusoft.web.impl;

public final class GoodPostServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyGoodPost","¼Ó¾«");
		return "forum";
	}
}
