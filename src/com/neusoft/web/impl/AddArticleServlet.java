package com.neusoft.web.impl;

public class AddArticleServlet extends ArticleControllerSupport {



	@Override
	public String execute() throws Exception
	{
		this.update("addArticle", "���", "�ύ��˳ɹ�����������Ϊ", "aab802");
		return "addArticle";
	}

}
