package com.neusoft.web.impl;

public final class QueryEmpServlet extends PersonControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryEmp";
	}
}
