package com.neusoft.web.impl;

public class FindByIdChangelogServlet extends ChangelogControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "readChangelog";
	}

}
