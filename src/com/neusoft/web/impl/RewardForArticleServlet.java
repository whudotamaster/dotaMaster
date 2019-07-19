package com.neusoft.web.impl;

public class RewardForArticleServlet extends EmpControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("reward");
		this.queryMap("articleFindById");
		return "readArticle";
	}

}
