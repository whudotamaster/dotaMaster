package com.neusoft.web.impl;

public class RewardServlet extends ForumControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("reward", "����");
		this.postOnLoad();
		return "post";
	}

}
