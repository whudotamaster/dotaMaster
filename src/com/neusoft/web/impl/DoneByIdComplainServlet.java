package com.neusoft.web.impl;


public class DoneByIdComplainServlet extends ComplainControllerSupport
{
	
	@Override
	public String execute()throws Exception
	{
		this.update("doneById","完成处理");
		this.query("queryPerson");
		return "adminQueryComplain";
	}
}
