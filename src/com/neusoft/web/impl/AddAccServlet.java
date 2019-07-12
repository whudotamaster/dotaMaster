package com.neusoft.web.impl;

public class AddAccServlet extends AccControllerSupport {


	@Override
	public String execute() throws Exception 
	{
		this.update("addAcc", "添加", "添加成功，该饰品为：", "aac602");
		return "addAcc";
	}

}
