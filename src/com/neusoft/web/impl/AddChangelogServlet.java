package com.neusoft.web.impl;

public class AddChangelogServlet extends ChangelogControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("addChangelog", "添加", "添加成功，该更新日志版本号为：", "aac1202");
		return "addChangelog";
	}

}
