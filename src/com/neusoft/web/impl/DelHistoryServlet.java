package com.neusoft.web.impl;
public final class DelHistoryServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delPost","�h��");
		this.query("queryHistory");
		return "queryHistoryPost";
	}
}
