package com.neusoft.web.impl;
public final class AddPostServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addPost", "����");
		return "addPost";
	}
}
