package com.neusoft.web.impl;
public final class DelHistoryByIdServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delPostById","�h��");
		this.query("queryHistory");
		return "queryHistoryPost";
	}
}
