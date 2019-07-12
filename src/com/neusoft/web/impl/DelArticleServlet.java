package com.neusoft.web.impl;

public class DelArticleServlet extends ArticleControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("batchDeleteArticle", "É¾³ý");
		this.savePageDataForDelete();
		return "queryArticle";
	}

}
