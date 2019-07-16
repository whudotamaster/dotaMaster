package com.neusoft.web.impl;

public final class AddCommentServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addComment", "»Ø¸´");
		this.query("postFindById");
		return "post";
	}
}
