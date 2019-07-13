package com.neusoft.web.impl;
public final class DelLikeServlet extends LikeControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delLike", "È¡ÏûµãÔÞ");
		this.postOnLoad();
		return "post";
	}
}
