package com.neusoft.web.impl;

public class RewardServlet extends EmpControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("reward", "¥Ú…Õ");
		this.postOnLoad();
		return "post";
	}

}
