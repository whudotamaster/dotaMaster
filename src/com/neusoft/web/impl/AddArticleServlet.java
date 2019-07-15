package com.neusoft.web.impl;

public class AddArticleServlet extends ArticleControllerSupport {



	@Override
	public String execute() throws Exception
	{
		this.update("addArticle", "添加", "提交审核成功，该文章名为", "aab802");
		return "addArticle";
	}

}
