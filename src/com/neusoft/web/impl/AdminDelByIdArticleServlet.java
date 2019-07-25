package com.neusoft.web.impl;

public class AdminDelByIdArticleServlet extends ArticleControllerSupport {


	@Override
	public String execute() throws Exception 
	{
		this.update("deleteByIdArticle", "É¾³ý");
		this.query("adminQuery");
		return "adminQueryArticle";
	}

}
