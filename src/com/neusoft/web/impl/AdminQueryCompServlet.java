package com.neusoft.web.impl;

public class AdminQueryCompServlet extends ComplainControllerSupport
{

	@Override
	public String execute()throws Exception
	{
		this.adminQueryComplainServ();
		return "adminQueryComplain";
	}
}
