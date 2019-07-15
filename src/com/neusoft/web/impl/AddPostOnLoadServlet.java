package com.neusoft.web.impl;
public class AddPostOnLoadServlet extends EmpControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryMap("queryPersonEmp");
	return "addPost";
	}

}
