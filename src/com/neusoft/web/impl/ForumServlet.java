package com.neusoft.web.impl;

public final class ForumServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.forumOnLoad();
		return "forum";
	}
}
