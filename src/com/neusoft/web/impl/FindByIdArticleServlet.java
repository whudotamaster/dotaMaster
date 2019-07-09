package com.neusoft.web.impl;

public class FindByIdArticleServlet extends ArticleControllerSupport 
{


	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "readArticle";
	}

}
