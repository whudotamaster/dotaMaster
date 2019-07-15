package com.neusoft.web.impl;
public final class DelHistoryByIdServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delPostById","„h³ý");
		this.queryHistoryOnLoad();
		return "queryHistoryPost";
	}
}
