package com.neusoft.web.impl;

public class FindByIdEmpServlet extends PersonControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addEmp";
	}

}
