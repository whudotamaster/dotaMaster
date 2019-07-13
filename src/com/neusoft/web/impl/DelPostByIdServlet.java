package com.neusoft.web.impl;

public final class DelPostByIdServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delPostById","„h³ý");
		this.forumOnLoad();
		return "forum";
	}
}
