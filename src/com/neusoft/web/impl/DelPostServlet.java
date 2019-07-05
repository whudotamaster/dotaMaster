package com.neusoft.web.impl;

public final class DelPostServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delPost","„h³ý");
		return "forum";
	}
}
