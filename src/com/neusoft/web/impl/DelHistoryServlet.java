package com.neusoft.web.impl;
public final class DelHistoryServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delPost","„h³ý");
		this.query("queryHistory");
		return "queryHistoryPost";
	}
}
