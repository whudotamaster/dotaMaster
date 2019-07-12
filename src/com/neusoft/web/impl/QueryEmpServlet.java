package com.neusoft.web.impl;

public final class QueryEmpServlet extends EmpControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		System.out.println("19:38");
		return "queryEmp";
	}
}
