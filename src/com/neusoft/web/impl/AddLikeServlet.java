package com.neusoft.web.impl;
public final class AddLikeServlet extends LikeControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addLike", "����");
		this.query("postFindById");
		return "post";
	}
}
