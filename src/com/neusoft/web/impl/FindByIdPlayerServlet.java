package com.neusoft.web.impl;

public class FindByIdPlayerServlet extends PlayerControllerSupport {


	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "readPlayer";
	}

}
