package com.neusoft.web.impl;


public class UndoneByIdComplainServlet extends ComplainControllerSupport
{
	
	@Override
	public String execute()throws Exception
	{
		this.update("undoneById","��ɺ��Դ���");
		this.adminQueryComplainServ();
		return "adminQueryComplain";
	}
}
