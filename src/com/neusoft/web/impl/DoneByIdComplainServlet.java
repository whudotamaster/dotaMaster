package com.neusoft.web.impl;


public class DoneByIdComplainServlet extends ComplainControllerSupport
{
	
	@Override
	public String execute()throws Exception
	{
		this.update("doneById","��ɴ���");
		this.savePageData();
		return "adminQueryComplain";
	}
}
