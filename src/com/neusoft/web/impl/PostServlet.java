package com.neusoft.web.impl;

public final class PostServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.query("postFindById");
		return "post";
	}
}
