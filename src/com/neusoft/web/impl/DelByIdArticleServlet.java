package com.neusoft.web.impl;

public class DelByIdArticleServlet extends ArticleControllerSupport {


	@Override
	public String execute() throws Exception 
	{
		this.update("deleteByIdArticle", "ɾ��");
		this.savePageDataForDelete();
		return "queryArticle";
	}

}
