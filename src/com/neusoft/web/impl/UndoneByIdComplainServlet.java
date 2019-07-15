package com.neusoft.web.impl;


public class UndoneByIdComplainServlet extends ComplainControllerSupport
{
	
	@Override
	public String execute()throws Exception
	{
		this.update("undoneById","完成忽略处理");
		this.adminQueryComplainServ();
		return "adminQueryComplain";
	}
}
