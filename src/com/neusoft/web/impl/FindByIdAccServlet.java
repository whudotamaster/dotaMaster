package com.neusoft.web.impl;

public class FindByIdAccServlet extends AccControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "readAcc";
	}

}
