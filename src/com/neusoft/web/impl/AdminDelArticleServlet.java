package com.neusoft.web.impl;

public class AdminDelArticleServlet extends ArticleControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("batchDeleteArticle", "ɾ��");
		this.query("adminQuery");
		return "adminQueryArticle";
	}

}
