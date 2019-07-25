package com.neusoft.web.impl;

public class AdminDelArticleServlet extends ArticleControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("batchDeleteArticle", "É¾³ý");
		this.query("adminQuery");
		return "adminQueryArticle";
	}

}
