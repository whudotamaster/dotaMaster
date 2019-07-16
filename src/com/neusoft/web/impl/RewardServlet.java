package com.neusoft.web.impl;

public class RewardServlet extends EmpControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("reward");
		this.query("postFindById");
		return "post";
	}

}
