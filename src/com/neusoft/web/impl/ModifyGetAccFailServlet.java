package com.neusoft.web.impl;

public class ModifyGetAccFailServlet extends GetAccControllerSupport 
{
	@Override
	public String execute() throws Exception {
		this.update("checkDelFail", " ’ªı");
		this.savePageDataForDelete();
		return "adminQueryGet";
	}
}
