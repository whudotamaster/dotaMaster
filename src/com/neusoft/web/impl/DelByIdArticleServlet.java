package com.neusoft.web.impl;

public class DelByIdArticleServlet extends ArticleControllerSupport {


	@Override
	public String execute() throws Exception 
	{
		this.update("deleteByIdArticle", "É¾³ý");
		this.savePageDataForDelete();
		return "queryArticle";
	}

}
