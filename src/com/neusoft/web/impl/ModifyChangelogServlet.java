package com.neusoft.web.impl;

public class ModifyChangelogServlet extends ChangelogControllerSupport {


	@Override
	public String execute() throws Exception 
	{
		this.update("modifyChangelog", "�޸�");
		this.savePageInstance();
		return "readChangelog";
	}

}
