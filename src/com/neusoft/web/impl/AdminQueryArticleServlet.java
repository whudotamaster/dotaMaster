package com.neusoft.web.impl;

public class AdminQueryArticleServlet extends ArticleControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.adminQueryArticleServ();
		return "adminQueryArticle";
	}

}
