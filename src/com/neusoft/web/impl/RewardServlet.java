package com.neusoft.web.impl;

public class RewardServlet extends PersonControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("reward");
		this.query("postFindById");
		return "post";
	}

}
