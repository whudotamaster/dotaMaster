package com.neusoft.web.impl;

public class FindByIdMatchServlet extends MatchControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "readMatch";
	}

}
