package com.neusoft.web.impl;

public class ModifyChangelogServlet extends ChangelogControllerSupport {


	@Override
	public String execute() throws Exception 
	{
		this.update("modifyChangelog", "ÐÞ¸Ä");
		this.savePageInstance();
		return "readChangelog";
	}

}
