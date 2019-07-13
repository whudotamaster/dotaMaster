package com.neusoft.web.impl;

public class QueryArticleServlet extends ArticleControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		return "queryArticle";
	}

}
