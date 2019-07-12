package com.neusoft.web.impl;

public class FindGetAccServlet extends GetAccControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "sellAcc";
	}

}
