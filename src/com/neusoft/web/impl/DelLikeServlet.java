package com.neusoft.web.impl;
public final class DelLikeServlet extends LikeControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delLike", "ȡ������");
		this.postOnLoad();
		return "post";
	}
}
