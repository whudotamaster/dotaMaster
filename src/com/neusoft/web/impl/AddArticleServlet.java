package com.neusoft.web.impl;

public class AddArticleServlet extends ArticleControllerSupport {



	@Override
	public String execute() throws Exception
	{
		this.update("addArticle", "���", "��ӳɹ�����������Ϊ", "aab802");
		return "addArticle";
	}

}
