package com.neusoft.web.impl;
public class AddPostOnLoadServlet extends PersonControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryMap("queryPerson");
	return "addPost";
	}

}
