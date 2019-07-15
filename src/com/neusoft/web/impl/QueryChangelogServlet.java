package com.neusoft.web.impl;

public class QueryChangelogServlet extends ChangelogControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		return "queryChangelog";
	}

}
